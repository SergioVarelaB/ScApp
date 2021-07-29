class DayOff {
  final int id;
  final int userID;
  final DateTime day;

  DayOff({
    required this.id,
    required this.userID,
    required this.day
  });

  factory DayOff.fromJson(Map<String,dynamic> json) {
    return DayOff(
        id: json['ID'],
        userID: json['UserID'],
        day: DateTime.parse(json['Day'])
    );
  }
}