class Event {
  String? id;
  String? creatorUserId;
  String? title;
  String? desc;
  DateTime? date;
  DateTime? time;
  int? categoryId;
  bool isFavorite = false;

  Event({
    this.id,
    this.creatorUserId,
    this.title,
    this.categoryId,
    this.date,
    this.time,
    this.desc,
  });

  factory Event.fromMap(Map<String, dynamic>? map) {
    return Event(
        id: map?['id'],
        creatorUserId: map?['creatorUserId'],
        title: map?['title'],
        desc: map?['desc'],
        categoryId: map?['categoryId'],
        time: DateTime.fromMillisecondsSinceEpoch(map?['time']),
        date: DateTime.fromMillisecondsSinceEpoch(map?['date'])
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      'creatorUserId' : creatorUserId,
      'title' : title,
      'desc' : desc,
      'date' : date?.millisecondsSinceEpoch,
      'time' : time?.millisecondsSinceEpoch,
      'categoryId' : categoryId,
    };
  }

  String getCategoryImage() {
    switch (categoryId) {
      case 1:
        return 'assets/tabs/Birthday.png';
      case 2:
        return 'assets/tabs/Book_Club.png';
      case 3:
        return 'assets/tabs/Eating.png';
      case 4:
        return 'assets/tabs/Exhibition.png';
      case 5:
        return 'assets/tabs/Gaming.png';
      case 6:
        return 'assets/tabs/Holiday.png';
      case 7:
        return 'assets/tabs/Meeting.png';
      case 8:
        return 'assets/tabs/Sports.png';
      case 9:
        return 'assets/tabs/Work_Shop.png';
    }
    return '';
  }
}

extension DateMonth on DateTime {
  String getShortMonthName() {
    const List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[this.month - 1];
  }
}