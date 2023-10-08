import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nelumhicker/New/register.dart';
import 'package:nelumhicker/screen/home_screen.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'New/Forget.dart';
import 'New/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final RoundedLoadingButtonController _btnController1 =
  RoundedLoadingButtonController();

  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  void _doSomething(RoundedLoadingButtonController controller,String email, String password) async {
    Timer(Duration(seconds: 5), () async {
      if (_formkey.currentState!.validate()) {
        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          controller.success();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => contro(),
            ),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            controller.error();
            Timer(Duration(seconds: 3), () {
              controller.reset();
            });
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'No user found for that email',
            );
            print('No user found for that email.');
          }
          else if (e.code == 'wrong-password') {
            controller.error();
            Timer(Duration(seconds: 3), () {
              controller.reset();
            });
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'Wrong password provided for that user',
            );
            print('Wrong password provided for that user.');

          }
          Timer(Duration(seconds: 3), () {
            controller.reset();
          });

        }
      }

    });
  }

  @override
  void initState() {
    super.initState();
    _btnController1.stateStream.listen((value) {
      print(value);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  // color: Colors.white60,
                  image: DecorationImage(
                    image:AssetImage("images/login.png"),
                    fit: BoxFit.fitHeight,
                    opacity: 0.05
                  )
              ),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Welcome!",style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              )),
                              Text("Lets sign in to book your trip \n now & begin the adventure",
                              style: TextStyle(
                                fontSize: 12
                              ),)
                            ],
                          ),
                        ),


                        //
                        //Login Signup Button area
                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              clipBehavior: Clip.hardEdge,
                              fit: StackFit.loose,
                              children: [
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 94, top: 8),
                                    height: 41,
                                    width: 180,
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                        color:
                                        Color.fromRGBO(221, 221, 221, 120),
                                        borderRadius:
                                        BorderRadius.circular(34)),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()),
                                    );
                                  },
                                ),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(7),
                                    height: 41,
                                    width: 100,
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(47, 110, 182, 10),
                                        borderRadius:
                                        BorderRadius.circular(34)),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),


                        //Textfield
                        //Email
                        SizedBox(
                          height: 70,
                          width: 330,
                          child: TextFormField(
                              controller: emailController,
                              autofocus: false,
                              textInputAction: TextInputAction.none,
                              style: TextStyle(
                                  fontFamily: "Montserrat", fontSize: 14),
                              decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                filled: true,
                                fillColor: Colors.black12,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                prefixIcon: Icon(Icons.email,size: 16),
                                // prefixIconColor: Color.fromRGBO(47, 110, 182, 10),
                                hintText: 'Email',
                                contentPadding:
                                const EdgeInsets.only(left: 14.0, top: 14.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(50),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length == 0) {
                                  return "Email cannot be empty";
                                }
                                if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  _btnController1.reset();
                                  return ("Please enter a valid email");

                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                        ),

                      //Password
                      SizedBox(
                        height: 70,
                        width: 330,
                        child: TextFormField(
                          textInputAction: TextInputAction.none,
                              autofocus: false,
                              style: TextStyle(fontSize: 14),
                              controller: passwordController,
                              obscureText: _isObscure3,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock,size: 16,),
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure3
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure3 = !_isObscure3;
                                      });
                                    }),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                fillColor: Colors.black12,
                                hintText: 'Password',
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 11.0, top: 15.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(50),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(27),
                                ),
                              ),
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  _btnController1.reset();
                                  return "Password cannot be empty";
                                }
                                if (!regex.hasMatch(value)) {
                                  _btnController1.reset();
                                  return ("please enter valid password min. 6 character");
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                passwordController.text = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                      ),



                        // Forget password
                        //Area
                        Container(
                          padding: EdgeInsets.only(
                              left: 200
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Forgotpass()));
                              },
                              child: Text(
                                "Forget Password ?",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(47, 110, 182, 10),
                                  fontWeight:  FontWeight.bold

                                ),
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),


                        //Login Button
                        // MaterialButton(
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius:
                        //       BorderRadius.all(Radius.circular(20.0))),
                        //   // elevation: 5.0,
                        //   height: 42,
                        //   minWidth: 127,
                        //   onPressed: () {
                        //     setState(() {
                        //       visible = true;
                        //     });
                        //     signIn(
                        //         emailController.text, passwordController.text);
                        //   },
                        //   child: Text(
                        //     "Login",
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 20,
                        //         fontFamily: "Montserrat",
                        //         color: Colors.white),
                        //   ),
                        //   color: Color.fromRGBO(47, 110, 182, 10),
                        // ),
                        //Login Button
                        RoundedLoadingButton(
                          successIcon: Icons.done,
                          failedIcon: Icons.sms_failed,
                          color: Color.fromRGBO(47, 110, 182, 10),
                          height: 42,
                          width: 137,
                          child: Text('Login', style: TextStyle(color: Colors.white)),
                          controller: _btnController1,
                            onPressed: () {
                              if(emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty){
                                _btnController1.reset();
                              }
                              else{
                                setState(() {
                                  visible = true;
                                  _doSomething(_btnController1,emailController.text.trim(),passwordController.text.trim());
                                });
                              }
                              // signIn(
                              //     emailController.text, passwordController.text);
                            },
                        ),


                        // Did not have any account Button and Sign up Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()),
                                  );
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(47, 110, 182, 10),
                                    fontWeight: FontWeight.bold
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(height: 300,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );


  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  contro(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
