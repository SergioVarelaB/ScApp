import 'package:flutter/cupertino.dart';
import 'package:sc_app/API/models/DayOff.dart';
import 'package:sc_app/API/models/Team.dart';
import 'package:sc_app/API/models/User.dart';

class UserChangeNotifier extends ChangeNotifier {
  late User _user;
  bool isUserSet = true;

  List<Team> getTeams() {
    return _user.teams;
  }

  List<DayOff> getDaysOff() {
    return _user.daysOff;
  }

  void addTeam(Team team) {
    _user.teams.add(team);
  }

  void addDayOff(DayOff day) {
    _user.daysOff.add(day);
  }

  void setUser(User user) {
    _user = user;
  }

  User getUser() {
    return _user;
  }
}