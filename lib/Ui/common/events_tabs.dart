import 'package:evently_app/Ui/common/tab_bar_item.dart';
import 'package:flutter/material.dart';
import '../../database/model/Category.dart';

typedef OnTabSelected = Function(int index, Category category);

class EventTabs extends StatelessWidget {
  OnTabSelected onTabSelected;
  int currentTabIndex = 0;
  List<Category> categories;
  bool reversed;

  EventTabs(
    this.categories,
    this.currentTabIndex,
    this.onTabSelected, {
    this.reversed = false,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,

      child: TabBar(
        onTap: (index) {
          onTabSelected(index, categories[index]);
        },
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        tabs: categories.map((category) {
          return TabBarItem(
            title: category.title,
            icon: category.icon,
            index: categories.indexOf(category),
            currentIndex: currentTabIndex,
            reverseColors: reversed,
          );
        }).toList(),
      ),
    );
  }
}
