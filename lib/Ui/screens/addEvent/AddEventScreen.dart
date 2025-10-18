import 'package:evently_app/Ui/common/events_tabs.dart';
import 'package:evently_app/database/model/Category.dart';
import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedTabIndex = 0;
  List<Category> allCategories = Category.getCategories(includeAll: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Event')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
