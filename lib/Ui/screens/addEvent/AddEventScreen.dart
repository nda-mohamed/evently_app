import 'package:evently_app/Ui/common/CutomFormField.dart';
import 'package:evently_app/Ui/common/events_tabs.dart';
import 'package:evently_app/database/EventDao.dart';
import 'package:evently_app/database/model/Category.dart';
import 'package:evently_app/extensions/context_extention.dart';
import 'package:evently_app/extensions/date_time_extentions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../database/model/event.dart';
import '../../provider/AppAuthProvider.dart';

class AddEventScreen extends StatefulWidget {
  AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedTabIndex = 0;
  List<Category> allCategories = Category.getCategories(includeAll: false);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Event')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: AssetImage(
                    'assets/tabs/${allCategories[selectedTabIndex].title}.png',
                  ),
                ),
              ),
              EventTabs(allCategories, reversed: true, selectedTabIndex, (
                index,
                category,
              ) {
                setState(() {
                  selectedTabIndex = index;
                });
              }),
              AppFormField(
                controller: titleController,
                label: "Event Title",
                icon: Icons.edit_note_outlined,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return "Please Enter Title";
                  }
                },
              ),
              AppFormField(
                controller: descriptionController,
                label: "Event Description",
                lines: 5,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return "Please Enter Description";
                  }
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.date_range_outlined),
                      SizedBox(width: 8),
                      Text("Event Date"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      chooseDate();
                    },
                    child: Text(
                      selectedDate == null
                          ? "Choose Date"
                          : selectedDate?.format() ?? "",
                      style: context.appTextTheme.bodyMedium?.copyWith(
                        color: context.appColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time_outlined),
                      SizedBox(width: 8),
                      Text("Event Time"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      chooseTime();
                    },
                    child: Text(
                      selectedTime == null
                          ? "Choose Time"
                          : selectedTime?.format(context) ?? "",
                      style: context.appTextTheme.bodyMedium?.copyWith(
                        color: context.appColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  createEvent();
                },
                child: Text("Create Event"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void chooseDate() async {
    var date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 60)),
    );
    setState(() {
      selectedDate = date;
    });
  }

  void chooseTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      selectedTime = time;
    });
  }

  bool isValidDate() {
    var isValid = formKey.currentState?.validate() ?? false;

    if (selectedDate == null) {
      context.showMessageDialog("Please Select Date");
      isValid = false;
    } else if (selectedTime == null) {
      context.showMessageDialog("Please Select Time");
      isValid = false;
    }
    return isValid;
  }

  void createEvent() async {
    if (!isValidDate()) {
      return;
    }
    var authProvider = Provider.of<AppAuthProvider>(context, listen: false);
    var event = Event(
      title: titleController.text,
      desc: descriptionController.text,
      date: selectedDate,
      time: selectedTime?.toDateTime(),
      categoryId: allCategories[selectedTabIndex].id,
      creatorUserId: authProvider.getUser()?.id,
    );
    await EventsDao.addEvent(event);

    context.showLoadingDialog(
      message: "Creating Event ...",
      isDismissible: false,
    );

    Navigator.pop(context);

    context.showMessageDialog(
      "Event Created Successfully",
      isDismissible: false,
      posActionText: "ok",
      onPosActionClick: (){
        Navigator.pop(context);
      },
    );
  }
}
