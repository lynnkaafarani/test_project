import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/screens/sign_up.dart';
import 'package:test2/widgets/social_icon.dart';

import '../constants/color_constants.dart';
import 'home_pageproject.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool eye = true;
  bool val = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image(
                image: AssetImage('photo/logo.jpeg'),
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    surfaceTintColor: Colors.white,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(
                    color: mainTextColor, // border color
                    width: 2.0, // border thickness
                  ),),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: mainTextColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: TextFormField(
                                  validator: (val) {
                                    if (usernameController.text.isEmpty) {
                                      return "Empty fields";
                                    }
                                    return null;
                                  },
                                  controller: usernameController,
                                  style: TextStyle(
                                    color: mainTextColor,
                                  ),
                                  decoration: InputDecoration(
                                    label: Text("Username"),
                                    labelStyle: TextStyle(color:mainTextColor),

                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: mainTextColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: mainTextColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: mainTextColor)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xff0caba7))),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xff0caba7))),
                                    errorStyle: TextStyle(color: Color(0xff0caba7)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextFormField(
                                    validator: (val) {
                                      if (passwordController.text.isEmpty) {
                                        return "Empty fields";
                                      } else if (passwordController
                                              .text.length <
                                          7) {
                                        return "weak password";
                                      }
                                    },
                                    controller: passwordController,
                                    obscureText: eye,
                                    style: TextStyle(color: mainTextColor),
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          Icon(Icons.lock, color:mainTextColor),
                                      label: Text("Password"),
                                      labelStyle: TextStyle(color:mainTextColor),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: mainTextColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color:mainTextColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Color(0xff0caba7))),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Color(0xff0caba7))),
                                      errorStyle:
                                          TextStyle(color: Color(0xff0caba7)),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            eye = !eye;
                                          });
                                        },
                                        child: Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 8,
                          ),
                          child: Divider(
                            thickness: 1,
                            color: mainTextColor,
                          ),
                        ),
                        Row(children: [
                          SizedBox(
                            width: 20,
                          ),
                          Checkbox(
                              checkColor: Colors.white,
                              focusColor: mainTextColor,
                              activeColor: mainTextColor,
                              side: BorderSide(color: mainTextColor, width: 1.5),
                              value: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value ?? false;
                                });
                              }),
                          //SizedBox(width: 10,),

                          Text('Remember me ',
                              style: TextStyle(color:mainTextColor)),
                          SizedBox(
                            width: 50,
                          ),
                          Text("forgot password?",
                              style: TextStyle(color: mainTextColor)),
                        ]),
                        SizedBox(
                          width: 188,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: mainTextColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                child: Row(children: [
                                  Icon(Icons.login, color:Colors.white),
                                  Text("Log In", style: TextStyle(color:Colors.white)),
                                ]),
                                onPressed: () {Navigator.push(context,
                                       MaterialPageRoute(builder: (context) =>HomePageproject()));
                                  if (formKey.currentState!.validate()) {
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Check the inputs"),
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text("Or sign in with"),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SocialIcon(image: "insta/search.png"),
              //     GestureDetector(
              //       onTap: () {},
              //       child: Card(
              //         child: Image(
              //           image: AssetImage('insta/facebook.png'),
              //           width: 52,
              //           height: 52,
              //         ),
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: () {},
              //       child: Card(
              //         child: Image(
              //           image: AssetImage('photo/instagram.png'),
              //           width: 52,
              //           height: 52,
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 90),
                    Text("Don't have an account?"),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "sign up",
                        style: TextStyle(
                            color: Color(0xff00658e),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
