import 'package:evently_app/Ui/screens/home/tabs/home_tab/widgets/event_cards.dart';
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
            child: ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) => EventCards(),
            ),
          ),
        ],
      ),
    );
  }
}
