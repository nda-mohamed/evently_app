import 'package:evently_app/Ui/screens/home/tabs/home_tab/widgets/event_cards.dart';
import 'package:evently_app/database/EventDao.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: EventsDao.getEvents(null), builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Something went Wrong"));
              }

              var events = snapshot.data;

              return ListView.separated(
                itemCount: events?.length ?? 0,
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemBuilder: (context, index) => EventCard(
                  events![index],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
