import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/provider/user_provider.dart';
import 'package:test2/screens/default_page.dart';

import 'package:test2/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Retrieve the login status with the correct key
  final bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>UserProvider(),child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:isLoggedIn? DefaultPage(): LoginPage(),
    ),);
  }
}
