class Post {
  final int id;
  final String description;
  final String imgUrl;
  final int userId;
  final String location;
  final int likes;
  final String time;
  final int raisedAmount;
  final int totalAmount;
  final List<Contributor> contributors;
  final List<String> images;

  Post({
    required this.id,
    required this.description,
    required this.imgUrl,
    required this.userId,
    required this.location,
    required this.likes,
    required this.time,
    required this.raisedAmount,
    required this.totalAmount,
    required this.contributors,
    required this.images,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    List<Contributor> contributors = [];
    for (var contributor in json['contributors']) {
      contributors.add(Contributor.fromJson(contributor));
    }
    List<String> images = [];
    for (var image in json['images']) {
      images.add(image);
    }
    return Post(
      id: json['id'],
      description: json['description'],
      imgUrl: json['imgUrl'],
      userId: json['userId'],
      location: json['location'],
      likes: json['likes'],
      time: json['time'],
      raisedAmount: json['raisedAmount'],
      totalAmount: json['totalAmount'],
      contributors: contributors,
      images: images,
    );
  }
}

class Contributor {
  final int id;
  final String name;
  final String avatar;

  Contributor({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory Contributor.fromJson(Map<String, dynamic> json) {
    return Contributor(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}
