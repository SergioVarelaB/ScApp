import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:sc_app/API/models/DayOff.dart';
import 'package:sc_app/API/models/Team.dart';
import 'package:sc_app/Utils/Utils.dart';
import 'package:sc_app/Utils/colors/light_colors.dart';
import 'package:sc_app/changeNotifiers/UserChangeNotifier.dart';
import 'package:sc_app/widgets/active_project_card.dart';
import 'package:sc_app/widgets/task_column.dart';
import 'package:sc_app/widgets/top_container.dart';
import 'package:percent_indicator/percent_indicator.dart';


class Profile extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar plusIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.add_box,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserChangeNotifier>(context,listen: false).getUser();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.menu,
                            color: LightColors.kDarkBlue, size: 30.0),
                        Icon(Icons.search,
                            color: LightColors.kDarkBlue, size: 25.0),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.75,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: LightColors.kRed,
                            backgroundColor: LightColors.kDarkYellow,
                            center: CircleAvatar(
                              backgroundColor: LightColors.kBlue,
                              radius: 35.0,
                              backgroundImage: AssetImage(
                                'assets/images/avatar.png',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  user.name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  user.email,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Dias Libres'),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => CalendarPage()),
                                  // );
                                },
                                child: plusIcon(),
                              ),
                            ],
                          ),
                          ...getTeamsList(user.daysOff)
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Equipos'),
                          SizedBox(height: 5.0),
                          ...getTeamsRows(user.teams),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> getTeamsList(List<DayOff> dayoff) {
  final list = <Widget>[];
  for(DayOff day in dayoff) {
    list.add(SizedBox(height: 15.0));
    final teamColumn = TaskColumn(
      icon: Icons.today_outlined,
      iconBackgroundColor: LightColors.getRandomColor(),
      title: Utils.formatDateFormat(day.day, "MMMEd"),
      subtitle: 'Dia asignado por ti mismo',
    );
    list.add(teamColumn);
  }
  return list;
}

List<Widget> getTeamsRows(List<Team> teams) {
  final rows = <Widget>[];
  var index = 0;
  while(index < teams.length) {
    final row = <Widget>[];
    row.add(getTeamItem(teams[index]));
    row.add(SizedBox(width: 20.0));
    index++;
    row.add(getTeamItem(teams[index]));
    index++;
    final rowWidget = Row(
      children: row,
    );
    rows.add(rowWidget);
  }
  return rows;
}

Widget getTeamItem(Team team) {
  return ActiveProjectsCard(
      cardColor: LightColors.getRandomColor(),
      loadingPercent: 0.25,
      title: team.name,
      subtitle: '9 eventos proximos',
  );
}

