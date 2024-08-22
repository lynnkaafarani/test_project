import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:test2/constants/login-class.dart';

Future<UserResponse> login(String username, String password) async {
  Map<String, String> loginData = {
    'username': username,
    'password': password,
  };

  String jsonBody = jsonEncode(loginData);

  http.Response response = await http.post(
    Uri.parse('https://tms.taqa-energies.com:8443/userLogin'),
    headers: {"Content-Type": "application/json"},
    body: jsonBody,
  );

  if (response.statusCode == 200) {
    String data = response.body;
    var decodedData = jsonDecode(data);

    UserResponse userData = UserResponse.fromJson(decodedData);
    print(userData);
    return userData;
  } else {
    print('Failed to login: ${response.statusCode}');
    throw Exception('Failed to login');
  }
}