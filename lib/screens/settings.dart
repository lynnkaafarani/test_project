import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Row(
            children: [
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: Card(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18, top: 18, left: 10),

                    child:Row( children:[Icon(
                      Icons.notifications,
                      color: mainTextColor,
                    ),
                   Padding(
                     padding: const EdgeInsets.only(left: 8.0),
                     child: Text("Notification",
                         style: TextStyle(color: mainTextColor, fontSize: 20),),
                   )]),
                  ),

                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Row(
          children: [
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Card(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18, top: 18, left: 10),

                  child:Row( children:[Icon(
                    Icons.language,
                    color: mainTextColor,
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text("Language",
                        style: TextStyle(color: mainTextColor, fontSize: 20),),
                    )]),
                ),

              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Card(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18, top: 18, left: 10),

                  child:Row( children:[Icon(
                    Icons.question_answer,
                    color: mainTextColor,
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text("FAQ",
                        style: TextStyle(color: mainTextColor, fontSize: 20),),
                    )]),
                ),

              ),
            ),
          ],
        ),
      ],
    );
  }
}
