import 'package:evently_app/extensions/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../database/EventDao.dart';
import '../../../../../database/model/Category.dart';
import '../../../../common/events_tabs.dart';
import '../../../../provider/AppAuthProvider.dart';
import '../home_tab/widgets/event_cards.dart';

class FavTab extends StatefulWidget {
  FavTab({super.key});

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
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
          child: FutureBuilder(
            future: EventsDao.getFavoriteEvents(
              allCategories[selectedCategoryIndex].id,
              provider.getUser()?.favorites ?? [],
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Something went Wrong"));
              }
              var events = snapshot.data?.toList();
              if (events == null || events.isEmpty == true) {
                return Center(
                  child: Text(
                    "No Events Found",
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.all(16.0),
                child: ListView.separated(
                  itemCount: events.length ?? 0,
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    var event = events[index];
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
