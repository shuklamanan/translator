import 'dart:convert';
import 'package:translator/constants/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:translator/constants/constants.dart';

String url = "https://api.translateplus.io/v1/translate";

Future<String> translate(
    String inputstring, String translatefrom, String translateto) async {
  final obj = jsonEncode({
    "text": inputstring.trim(),
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
        "content-type": "application/json",
        "x-api-key": api,
      },
      body: obj,
      encoding: utf8,
    );
    Map result = jsonDecode(utf8.decode(response.bodyBytes));
    print(result["translations"]);
    return result["translations"]["translation"];
  } catch (e) {
    print(e.toString());
    return "Translated Text";
  }
}
