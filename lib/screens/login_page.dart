import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/screens/sign_up.dart';
import 'package:test2/widgets/social_icon.dart';

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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xff00658e),
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
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            Text(
                              "Username",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                validator: (val) {
                                  if (usernameController.text.isEmpty) {
                                    return "Empty fields";
                                  }
                                },
                                controller: usernameController,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.orange)),
                                  errorStyle:TextStyle(color: Colors.orange),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              Text(
                                "Password",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    validator: (val) {
                                      if (passwordController.text.isEmpty) {
                                        return "Empty fields";

                                      }
                                      else if(passwordController.text.length<7){
                                        return"weak password";
                                      }
                                    },


                                    controller: passwordController,
                                    obscureText: eye,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.white)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.orange)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.orange)),
                                      errorStyle: TextStyle(color: Colors.orange),

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
                                  )),
                            ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8,),
                          child: Divider(thickness:1,color: Colors.white,),
                        ),
                        Row(children: [
                          SizedBox(
                            width: 20,
                          ),
                          Checkbox(
                              checkColor: Color(0xff00658e),
                              focusColor: Colors.white,
                              activeColor: Colors.white,
                              side: BorderSide(color: Colors.white, width: 1.5),
                              value: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value ?? false;
                                });
                              }),
                          //SizedBox(width: 10,),

                          Text('Remember me ',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(
                            width: 50,
                          ),
                          Text("forgot password?",
                              style: TextStyle(color: Colors.white)),
                        ]),
                        SizedBox(
                          width: 188,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8))),
                                child: Row(children: [
                                  Icon(Icons.login),
                                  Text("Log In"),
                                ]),
                                onPressed: () {
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
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
