import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchAPI() async {
  final apiUrl =
      'https://api.openweathermap.org/data/2.5/weather?q=algeria&appid=fa06b1b5a81f62a60940385cae63c516';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return Future.value(jsonData);
  } else {
    print('API request failed with status code: ${response.statusCode}');
    return {}; // Return an empty map in case of an error
  }
}
