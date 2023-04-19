import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/events.dart';

class EventsController extends ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events => _events;

  Future<void> fetchEvents() async {
    try {
      final response = await http.get(Uri.parse(
          'https://my-json-server.typicode.com/Sayuru99/json_server/events'));
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      _events = jsonData.map((e) => Event.fromJson(e)).toList();
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print('Failed to fetch events: $error');
      }
    }
  }
}
