class Post {
  final int id;
  final String description;
  final String long_des;
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
    required this.long_des,
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
      long_des: json['long_des'],
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
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> contributorsJson =
        contributors.map((contributor) => contributor.toJson()).toList();
    List<String> imagesJson = images.toList();

    return {
      'id': id,
      'description': description,
      'long_des': long_des,
      'imgUrl': imgUrl,
      'userId': userId,
      'location': location,
      'likes': likes,
      'time': time,
      'raisedAmount': raisedAmount,
      'totalAmount': totalAmount,
      'contributors': contributorsJson,
      'images': imagesJson,
    };
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
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
    };
  }
}
