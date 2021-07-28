
class Event {
  final String name;
  final int teamID;
  final int userID;
  final DateTime startTime;
  final DateTime endTime;

  Event({
    required this.name,
    required this.teamID,
    required this.userID,
    required this.startTime,
    required this.endTime
  });

  factory Event.fromJson(Map<String,dynamic> json) {
    return Event(
      name: json['Name'],
      teamID: json['TeamID'],
      userID: json['UserID'],
      startTime: DateTime.parse(json['StartTime']),
      endTime: DateTime.parse(json['EndTime'])
    );
  }
}