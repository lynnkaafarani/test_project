import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/provider/user_provider.dart';

import '../constants/color_constants.dart';
import 'Faq.dart';
import 'login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  bool lgswitch = false;
  String selectedLanguage = 'English'; // Default selected language
  final List<String> languages = [
    'English',
    'Arabic',
    'French',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: 40),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              SizedBox(width: 14),
              Expanded(
                child: Card(
                  color: Colors.white70,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 18, top: 18, left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: mainTextColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Notification",
                            style:
                                TextStyle(color: mainTextColor, fontSize: 20),
                          ),
                        ),
                        SizedBox(width: 85),
                        Switch(
                          activeColor: green,
                          inactiveThumbColor: Colors.blue,
                          inactiveTrackColor: Color(0xffB8E2F2),
                          value: isSwitched,
                          onChanged: (value) async {
                            setState(() {
                              isSwitched = value;
                            });
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool(
                                "switchVal",
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .userResponse
                                    .userPrefs
                                    .notification);
                          },
                        ),
                        Text(isSwitched ? "ON" : "OFF",
                            style: TextStyle(color: mainTextColor)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 40),
        Row(
          children: [
            SizedBox(width: 14),
            Expanded(
              child: Card(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18, top: 18, left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: mainTextColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Language",
                          style: TextStyle(color: mainTextColor, fontSize: 20),
                        ),
                      ),
                      SizedBox(width: 110),
                      DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: selectedLanguage,
                        icon: Icon(Icons.arrow_drop_down, color: mainTextColor),
                        onChanged: (String? newValue) async {
                          setState(() {
                            selectedLanguage = newValue!;
                          });
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString(
                              "selectedLanguage",
                              Provider.of<UserProvider>(context, listen: false)
                                  .userResponse
                                  .userPrefs
                                  .language);

                          // You can save the selected language using SharedPreferences here
                        },
                        items: languages
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextStyle(color: mainTextColor)),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 14),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Faq(),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white70,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 18, top: 18, left: 10),
                    child: Row(children: [
                      Icon(
                        Icons.question_answer,
                        color: mainTextColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "FAQ",
                          style: TextStyle(color: mainTextColor, fontSize: 20),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 188,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: mainTextColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Row(children: [
                  Icon(Icons.logout, color: Colors.white),
                  Text("Log Out", style: TextStyle(color: Colors.white)),
                ]),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool("isLoggedIn", false);
                }),
          ),
        ),
      ],
    );
  }

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSwitched = prefs.getBool("switchVal") ?? false;
    });
  }

  Future<void> initiate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lgswitch = prefs.getBool("newVal") ?? false;
    });
  }

  Future<void> initlang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      isSwitched = prefs.getBool("switchVal") ?? false;
      selectedLanguage = prefs.getString("selectedLanguage") ??
          'English'; // Load saved language or default to English
    });
  }
}
