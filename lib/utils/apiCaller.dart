import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCaller {
  static dynamic getApi(String url) async {
    var response;

    try {
      response = await http.get(Uri.parse(url), headers: <String, String>{
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "*",
        "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      });
    } catch (error) {
      throw Exception(error);
    }

    if (response != null && response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed ${url}");
    }
  }
}
