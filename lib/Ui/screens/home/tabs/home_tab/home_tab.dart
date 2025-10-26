import 'package:evently_app/Ui/screens/home/tabs/home_tab/widgets/event_cards.dart';
import 'package:evently_app/database/EventDao.dart';
import 'package:evently_app/extensions/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../database/model/Category.dart';
import '../../../../common/events_tabs.dart';
import '../../../../provider/AppAuthProvider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedCategoryIndex = 0;
  List<Category> allCategories = Category.getCategories(includeAll: true);

  @override
  Widget build(BuildContext context) {
    AppAuthProvider provider = Provider.of<AppAuthProvider>(
      context,
      listen: false,
    );

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.appColors.primary,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: EventTabs(allCategories, selectedCategoryIndex, (
            index,
            category,
          ) {
            setState(() {
              selectedCategoryIndex = index;
            });
          }),
        ),
        Expanded(
          child: StreamBuilder(
            stream: EventsDao.getRealTimeUpdatesForEvents(
              allCategories[selectedCategoryIndex].id != 0
                  ? allCategories[selectedCategoryIndex].id
                  : null,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Something went Wrong"));
              }

              var events = snapshot.data?.toList();

              events?.forEach((element) {
                print(element.date);
              });

              if (events == null || events.isEmpty == true) {
                return Center(
                  child: Text(
                    "No Events Found",
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(
                  itemCount: events?.length ?? 0,
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    var event = events![index];
                    var isFavorite = provider.isFavorite(event);
                    event.isFavorite = isFavorite;
                    return EventCard(events[index]);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
