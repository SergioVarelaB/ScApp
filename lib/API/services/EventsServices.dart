import 'dart:convert';

import 'package:sc_app/API/ResponseHelper.dart';
import 'package:sc_app/API/models/Response.dart';
import 'package:sc_app/API/models/Event.dart';
class EventsServices {
  static final String _prefix = "event/";

  static Future<Response<List<Event>>> getUpcoming() async {
    final url = _prefix + "upcoming";
    final response = await ResponseHelper.get<List<dynamic>>(url);
    final events = <Event>[];
    for(Map<String,dynamic> e in response.data){
      events.add(Event.fromJson(e));
    }
    return new Response(data: events, message: response.message, error: response.error);
  }
}