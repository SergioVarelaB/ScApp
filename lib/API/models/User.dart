import 'package:sc_app/API/models/DayOff.dart';

import 'Team.dart';

class User {
  final int id;
  final String name;
  final String email;
  final List<Team> teams;
  final List<DayOff> daysOff;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.teams,
    required this.daysOff
  });

  factory User.fromJson(Map<String,dynamic> json) {
    final teams = <Team>[];
    final daysOff = <DayOff>[];

    for(Map<String,dynamic> teamJson in json['Teams']) {
      teams.add(Team.fromJson(teamJson));
    }
    for(Map<String,dynamic> dayJson in json['DaysOff']) {
      daysOff.add(DayOff.fromJson(dayJson));
    }

    return User(
        id: json['ID'],
        name: json['name'],
        email: json['email'],
        teams: teams,
        daysOff: daysOff
    );
  }
}