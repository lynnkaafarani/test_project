import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:test2/constants/json_fct.dart';

Future<List<JsnFct>> getUsers() async {
  final tempDir = await getApplicationDocumentsDirectory();
  String _embPath = '${tempDir.path}/user.json';
  final jsonFile = File(_embPath);
  List<JsnFct> userDataList = [];
  if (jsonFile.existsSync()) {
    final jsonData = json.decode(jsonFile.readAsStringSync());
    if (jsonData["users"] is List) {
      userDataList =
          jsonData["users"].map<JsnFct>((item) => JsnFct.fromJson(item)).toList();
    }
  } else {
    print("File does not exists");
  }
  print(userDataList);
  return userDataList;
}