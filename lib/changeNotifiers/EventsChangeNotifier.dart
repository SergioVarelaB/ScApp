import 'package:flutter/material.dart';
import 'package:sc_app/API/models/Event.dart';
import 'package:sc_app/API/services/EventsServices.dart';

class EventChangeNotifier extends ChangeNotifier {
  final List<Event> _events = [];
  var error = false;
  var message = "";
  var loading = false;

  int getNumEvents() {
    return _events.length;
  }

  List<Event> getEvents() {
    return _events;
  }

  void addEvents(List<Event> newEvents) {
    _events.addAll(newEvents);
    notifyListeners();
  }

  void loadIfEmpty() {
    if (getNumEvents() == 0) {
      loadEvents();
    }
  }

  void loadEvents() async {
    loading = true;
    notifyListeners();
    final result = await EventsServices.getUpcoming();
    loading = false;
    error = result.error;
    message = result.message;
    if(!error) {
      addEvents(result.data!);
    }
  }
}