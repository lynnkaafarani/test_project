import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Row(
          children: [
            SizedBox(width:80),
            Text("username", style:TextStyle(color:Colors.redAccent)),
            SizedBox(width:12),
            Expanded(
              child: TextField(
                controller:usernameController,
              
              
              ),
            )
          ],
        ),
      ]),
    );
  }
}
