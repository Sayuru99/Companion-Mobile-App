class Userposts {
  final int id;
  final String title;
  final String body;
  final String image;
  final int raisedAmount;
  final int totalAmount;
  final List<Contributor> contributors;

  Userposts({
    required this.id,
    required this.title,
    required this.body,
    required this.image,
    required this.raisedAmount,
    required this.totalAmount,
    required this.contributors,
  });
}

class Contributor {
  final String name;
  final String avatar;

  Contributor({
    required this.name,
    required this.avatar,
  });
}
