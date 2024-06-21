import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:translator/constants/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:translator/constants/constants.dart';

String url = "https://api.translateplus.io/v1/translate";

Future<String> translate(
    String inputstring, String translatefrom, String translateto) async {
  final obj = json.encode({
    "text": translatefrom.trim(),
    "source": map[translatefrom],
    "target": map[translateto]
  });
  print(inputstring.trim());
  print(map[translatefrom]);
  print(map[translateto]);
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "content-type": "application/json;charset=utf-8",
        "x-api-key": api,
      },
      body: obj,
    );
    print(response.body);
    Map result = jsonDecode(response.body);
    print('hello');
    print("******");
    print(result);
    return result["translations"]["translation"];
  } catch (e) {
    print(e.toString());
    return "Translated Text";
  }
}
