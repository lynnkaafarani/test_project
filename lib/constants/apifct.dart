import 'dart:convert';

import 'package:test2/constants/cars.dart';
import 'package:http/http.dart' as http;

Future<List<Cars>> getCars() async {
  // Send the request
  http.Response response = await http
      .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));

  if (response.statusCode == 200) {
    String data = response.body;
    var decodedData = jsonDecode(data) as List;

    List<Cars> cars = decodedData.map((car) => Cars.fromJson(car)).toList();
    print(cars);
    return cars;
  } else {
    print('Failed to load cars: ${response.statusCode}');
    throw Exception('Failed to load cars');
  }
}