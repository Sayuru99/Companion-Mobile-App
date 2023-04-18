class Event {
  final int id;
  final String name;
  final String location;
  final String description;
  final double lat;
  final double lng;
  final String startTime;
  final String endTime;
  final String imageUrl;

  Event({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.lat,
    required this.lng,
    required this.startTime,
    required this.endTime,
    required this.imageUrl,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      description: json['description'],
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
      startTime: json['start_time'],
      endTime: json['end_time'],
      imageUrl: json['image_url'],
    );
  }
}
