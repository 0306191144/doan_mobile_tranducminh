import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final String baseUrl = 'http://10.0.2.2:8000/api/';
  get(path) async {
    var url = Uri.parse(baseUrl + path);

    final response = await http.get(url, headers: await header());

    return json.decode(response.body);
  }

  post(path, data) async {
    var url = Uri.parse(baseUrl + path);

    final response =
        await http.post(url, body: jsonEncode(data), headers: await header());

    return json.decode(response.body);
  }

  header() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var token = sp.getString('token');
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
