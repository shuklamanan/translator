import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:translator/constants/api/api.dart';
import 'package:http/http.dart' as http;

String url = "https://services.hyphenapi.com/${api}/translate";

Future<String> translate(
    String inputstring, String translatefrom, String translateto) async {
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "x-api-key": api,
        "Content-Type": "application/json",
        "text": inputstring.trim(),
        "from": translatefrom,
        "to": translateto
      },
      // body: {
      // },
    );
    Map result = jsonDecode(response.body);
    print(result);
    return result["data"]["translation"]["text"];
  } catch (e) {
    return e.toString();
  }
}
