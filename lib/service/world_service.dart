import 'dart:convert';

import 'package:covid19/models/all_country.dart';
import 'package:covid19/models/world_total.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class WorldService {
  Future<WorldTotal> fetchCases() async {
    http.Response response =
        await http.get('https://api.covid19api.com/world/total');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return WorldTotal.fromJson(jsonDecode(response.body));
      debugPrint("data: ${response.body}");
    } else {
      debugPrint("status code: ${response.statusCode},"
          " reason: ${response.reasonPhrase}");
    }
  }

  Future<List<AllCountry>> fetchCountry() async {
    http.Response response =
        await http.get('https://api.covid19api.com/summary');
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = jsonDecode(response.body);

      List countriesJson = responseData['Countries'];
      if (countriesJson == null) return [];

      List<AllCountry> countries = countriesJson
          .map<AllCountry>((model) => AllCountry.fromJson(model))
          .toList();
      return countries;
    } else {
      debugPrint("status code: ${response.statusCode},"
          " reason: ${response.reasonPhrase}");
      return [];
    }
  }
}
