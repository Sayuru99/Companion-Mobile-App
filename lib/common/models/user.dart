class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String avatar;
  final String location;
  final int followers;
  final int events;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.avatar,
    required this.location,
    required this.followers,
    required this.events,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      avatar: json['avatar'],
      location: json['location'],
      followers: json['followers'],
      events: json['events'],
    );
  }
}
