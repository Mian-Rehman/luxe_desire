// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:luxe_desires/app/constants/tokens.dart';

class Event {
  String id;
  String title;
  String imageUrl;
  String rating;
  Event({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
  });
}

class Events extends GetxController {
  List<Event> _events = [];

  List<Event> get events {
    return [..._events];
  }

  //-------------------------------fetch and set events----------------------

  Future<void> fetchAndSetEvents() async {
    List<Event> tempEvents = [];
    final url = Uri.parse(
        'https://www.eventbriteapi.com/v3/organizations/$organizationId/events/');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $privateKey'});

    var extractedData = json.decode(response.body) as Map<String, dynamic>;

    var extractedEvents = extractedData['events'] as List<dynamic>;
    if (kDebugMode) {
      print(response);
    }
    for (var e in extractedEvents) {
      tempEvents.add(
        Event(
          id: e['id'],
          title: e['name']['text'],
          imageUrl: e['logo']['url'],
          rating: '4.9',
        ),
      );
    }
    _events = tempEvents;
    log(response.body);
  }
}
