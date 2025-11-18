class EventModel {
  final int id;
  final String name;
  final String? about;
  final DateTime eventTime;
  final double duration; // in hours
  final String location;
  final String? organizerId;
  final String organizerName; // NEW: store organizer's full name

  EventModel({
    required this.id,
    required this.name,
    this.about,
    required this.eventTime,
    required this.duration,
    required this.location,
    this.organizerId,
    required this.organizerName,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      name: map['name'],
      about: map['about'],
      eventTime: DateTime.parse(map['event_time']), // if it's a time string
      duration: (map['duration'] as num).toDouble(),
      location: map['location'],
      organizerName: map['organizerName'] ?? '', // read the joined name
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'about': about,
      'event_time': eventTime.toIso8601String(),
      'duration': duration,
      'location': location,
      'organizerId': organizerId,
    };
  }
}
