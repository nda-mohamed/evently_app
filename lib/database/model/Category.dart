import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Category{
  int id;
  String title;
  IconData icon;

  Category({required this.id,
    required this.title,
    required this.icon});


  static List<Category> getCategories({
    bool includeAll = true
  }){
    List<Category> list =[];
    if(includeAll){
      list.add(Category(icon: FontAwesome.compass, title: "All", id: 0));
    }
    list.addAll( [
      Category(icon: FontAwesome.bicycle_solid, title: "Sports", id: 1),
      Category(icon: FontAwesome.cake_candles_solid, title: "Birthday", id: 2),
      Category(icon: Icons.fastfood_outlined, title: "Eating", id: 3),
      // Category(icon: FontAwesome.playstation_brand, title: "Gaming", id: 4),
      // Category(icon: FontAwesome.tree_solid, title: "Holiday", id: 5),
      // Category(icon: FontAwesome.person_chalkboard_solid, title: "Meeting", id: 6),
      // Category(icon: FontAwesome.toolbox_solid, title: "Work Shop", id: 7),
      // Category(icon: FontAwesome.book_bookmark_solid, title: "Book Club", id: 8),
      // Category(icon: FontAwesome.images_solid, title: "Exhibition", id: 9),
    ]);
    return list;
  }
  static String getCategoryImage(int categoryId) {
    switch (categoryId) {
      case 1:
        return 'assets/tabs/Sports.png';
      case 2:
        return 'assets/tabs/Birthday.png';
      case 3:
        return 'assets/tabs/Eating.png';
      // case 4:
      //   return 'assets/tabs/Gaming.png';
      // case 5:
      //   return 'assets/tabs/Holiday.png';
      // case 6:
      //   return 'assets/tabs/Meeting.png';
      // case 7:
      //   return 'assets/tabs/Work_Shop.png';
      // case 8:
      //   return 'assets/tabs/Book_Club.png';
      // case 9:
      //   return 'assets/tabs/Exhibition.png';
    }
    return '';
  }
}