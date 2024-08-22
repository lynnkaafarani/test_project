import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/constants/cst.dart';
import 'package:test2/constants/json_fct.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/constants/login-class.dart';
import 'package:test2/constants/loginfct.dart';

import '../constants/color_constants.dart';
import '../constants/other_constants.dart';
import 'default_page.dart';

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
  bool _isLoggedIn = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<JsnFct> users = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage('photo/logo.jpeg'),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
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
                            ),
                          ),
                          child: Form(
                            key: formKey,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: TextFormField(
                                          validator: (val) {
                                            if (usernameController
                                                .text.isEmpty) {
                                              return "Empty fields";
                                            }
                                            return null;
                                          },
                                          controller: usernameController,
                                          style: TextStyle(
                                            color: mainTextColor,
                                          ),
                                          decoration: InputDecoration(
                                            label: const Text("Username"),
                                            labelStyle:
                                            TextStyle(color: mainTextColor),
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: mainTextColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: mainTextColor)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: mainTextColor)),
                                            errorBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                    Color(0xff0caba7))),
                                            focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                    Color(0xff0caba7))),
                                            errorStyle: const TextStyle(
                                                color: Color(0xff0caba7)),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: TextFormField(
                                            validator: (val) {
                                              if (passwordController
                                                  .text.isEmpty) {
                                                return "Empty fields";
                                              } else if (passwordController
                                                  .text.length <
                                                  7) {
                                                return "weak password";
                                              }
                                            },
                                            controller: passwordController,
                                            obscureText: eye,
                                            style:
                                            TextStyle(color: mainTextColor),
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock,
                                                  color: mainTextColor),
                                              label: const Text("Password"),
                                              labelStyle: TextStyle(
                                                  color: mainTextColor),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: mainTextColor)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: mainTextColor)),
                                              errorBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(
                                                          0xff0caba7))),
                                              focusedErrorBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(
                                                          0xff0caba7))),
                                              errorStyle: const TextStyle(
                                                  color: Color(0xff0caba7)),
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    eye = !eye;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.remove_red_eye,
                                                  color: mainTextColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                Row(children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Checkbox(
                                      checkColor: Colors.white,
                                      focusColor: mainTextColor,
                                      activeColor: mainTextColor,
                                      side: BorderSide(
                                          color: mainTextColor, width: 1.5),
                                      value: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = value ?? false;

                                        });
                                      }),
                                  //SizedBox(width: 10,),

                                  Text('Remember me ',
                                      style: TextStyle(color: mainTextColor)),
                                  const SizedBox(
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
                                        child: const Row(children: [
                                          Icon(Icons.login,
                                              color: Colors.white),
                                          Text("Log In",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ]),
                                        onPressed: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            try {
                                              userResponse = await login(
                                                  usernameController.text,

                                                  passwordController.text);
                                            } catch (e) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(e.toString()),
                                                ),
                                              );
                                              setState(() {
                                                isLoading = false;
                                              });
                                              return;
                                            }
                                            setState(() {
                                              isLoading = false;
                                            });

                                            if (userResponse.userMenu.isNotEmpty) {
                                              saveData(userResponse,val);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                  const DefaultPage(),
                                                ),
                                              );
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                Text("Check the inputs"),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 90),
                            const Text("Don't have an account?"),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => SignUp()));
                              },
                              child: const Text(
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
            ),
            if(isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(child: CircularProgressIndicator(),),)
          ],
        ));
  }

  void init() async {
    users = await getUsers();
    print(users);
    setState(() {});
  }

  void saveData(UserResponse userResponse,val) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userPrefsJson = json.encode(userResponse.toJson());
    await prefs.setString('userResponse', userPrefsJson);
    prefs.setBool("isLoggedIn",val);

  }
}
