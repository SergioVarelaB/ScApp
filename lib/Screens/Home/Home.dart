import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sc_app/API/models/Event.dart';
import 'package:sc_app/API/models/Response.dart';
import 'package:sc_app/API/services/EventsServices.dart';
import 'package:sc_app/Utils/TextStyles.dart';
import 'package:sc_app/Utils/Utils.dart';
import 'package:sc_app/changeNotifiers/EventsChangeNotifier.dart';
import 'package:sc_app/changeNotifiers/UserChangeNotifier.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final String userName;

  @override
  void initState() {
    Provider.of<EventChangeNotifier>(context,listen: false).loadIfEmpty();
    userName = Provider.of<UserChangeNotifier>(context,listen: false).getUser().name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'Hola, $userName',
            style: TextStyle(
                fontSize: 36.0,
                fontFamily: 'Roboto Bold',
                color: HexColor('#FFFFFF')
            ),
          ),
          Consumer<EventChangeNotifier>(
            builder: (context, eventsNotifer, child) {
              if (eventsNotifer.loading) {
                return CircularProgressIndicator();
              }
              if(eventsNotifer.error) {
                return Text("Ocurrio un error inesperado");
              }

              return createEventsList(eventsNotifer.getEvents());
            },
          ),
        ],
      )
      ,
      backgroundColor: HexColor('#494646'),
    );
  }
}

Widget createEventsList(List<Event> events) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: events.length,
    itemBuilder: (context, index) {
      final event = events[index];
      return ListTile(
        title: Text(
          event.name,
          style: TextStyles.itemTitle(),
        ),
        subtitle: Text(
          Utils.formatDateFormat(event.startTime,"MMM, E d H:mm"),
          style: TextStyles.itemSubtitle(),
        ),
        onTap: () => showEventDialog(context,event),
      );
    },
  );
}

void showEventDialog(BuildContext context,Event event) {
  showDialog(context: context, builder: (buildContext) {
    final team = Provider.of<UserChangeNotifier>(context,listen: false).getTeamByID(event.teamID);
    return SimpleDialog(
      title: Text(event.name),
      children: [

        Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 0,
              right: 5,
              bottom: 20,
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Fecha: " + Utils.formatDateFormat(event.startTime,"MMMEd")),
              Text("Hora: ${Utils.formatTime(event.startTime)} - ${Utils.formatTime(event.endTime)}"),
              Text("Equipo: ${(team != null)? team.name : '-'}")
            ],
          ),
        ),
      ],
    );
  });
}






