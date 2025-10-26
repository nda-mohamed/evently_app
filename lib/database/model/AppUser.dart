class AppUser {
  String? id;
  String? name;
  String? email;
  List<String> favorites;

  AppUser({this.id, this.name, this.email, this.favorites = const []});

  AppUser.fromMap(Map<String, dynamic>? map)
    : this(
        id: map?['id'],
        name: map?['name'],
        email: map?['email'],
        favorites: (map?['favorites'] as List<dynamic>).map((e) => e.toString()).toList() ?? [],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'favorites': favorites ?? [],
    };
  }
}
