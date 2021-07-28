import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sc_app/API/models/Event.dart';
import 'package:sc_app/API/models/Response.dart';
import 'package:sc_app/API/services/EventsServices.dart';
import 'package:sc_app/Utils/TextStyles.dart';
import 'package:sc_app/Utils/Utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Response<List<Event>>> eventsFuture;

  @override
  void initState() {
    eventsFuture = EventsServices.getUpcoming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'Bienvenido',
            style: TextStyle(
                fontSize: 36.0,
                fontFamily: 'Roboto Bold',
                color: HexColor('#FFFFFF')
            ),
          ),
          FutureBuilder(
              future: eventsFuture,
              builder: (BuildContext context, AsyncSnapshot<Response<List<Event>>> snapshot) {
                if(snapshot.hasData) {
                  return createEventsList(snapshot.data!);
                }
                if(snapshot.hasError) {
                  return Text("Error");
                }
                return CircularProgressIndicator();
              }
          )
        ],
      )
      ,
      backgroundColor: HexColor('#494646'),
    );
  }
}

Widget createEventsList(Response<List<Event>> response) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: response.data.length,
    itemBuilder: (context, index) {
      final event = response.data[index];
      return ListTile(
        title: Text(
          event.name,
          style: TextStyles.itemTitle(),
        ),
        subtitle: Text(
          Utils.formatDateTime(event.startTime),
          style: TextStyles.itemSubtitle(),
        ),
      );
    },
  );
}



