import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nelumhicker/ControllerScreens/ControllerMainScreen.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../New/model.dart';
import '../Roles/Admin.dart';
import '../loginnew.dart';

class ControllerResetPassword extends StatefulWidget {
  String id;
  ControllerResetPassword({required this.id});

  @override
  State<ControllerResetPassword> createState() =>
      _ControllerResetPasswordState(id: id);
}

class _ControllerResetPasswordState extends State<ControllerResetPassword> {
  _ControllerResetPasswordState({required this.id});
  final RoundedLoadingButtonController _btnController1 =
  RoundedLoadingButtonController();
  bool visible = false;
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  String id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(id)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(47, 110, 182, 10),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 22,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Controller(
                                  id: id,
                                )));
                  },
                  child: Image(
                    image: AssetImage("images/backarrow.png"),
                    height: 25,
                    width: 25,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Center(
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Container(
              height: MediaQuery.of(context).size.height - 140,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                      topLeft: Radius.circular(80))),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Forgot your password no issue,\n  we are here to help you out",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Enter your email in below textfield, get a \n    password reset link on your email",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(47, 110, 182, 10)),
                        ),
                        SizedBox(
                          height: 50,
                        ),
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Colors.black12,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50)),
                              prefixIcon: Icon(Icons.email, size: 16),
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
                                _btnController1.reset();
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
                        RoundedLoadingButton(
                          successIcon: Icons.done,
                          failedIcon: Icons.sms_failed,
                          color: Color.fromRGBO(47, 110, 182, 10),
                          height: 42,
                          width: 137,
                          child: Text('Login', style: TextStyle(color: Colors.white)),
                          controller: _btnController1,
                          onPressed: () {
                            if(emailController.text.trim().isEmpty){
                              _btnController1.reset();
                            }
                            else{
                              setState(() {
                                visible = true;
                                Forgotpassss(_btnController1,emailController.text.trim());
                              });
                            }
                            // signIn(
                            //     emailController.text, passwordController.text);
                          },
                        ),
                        //
                        // MaterialButton(
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(20.0))),
                        //   elevation: 5.0,
                        //   controller: _btnController1,
                        //   height: 40,
                        //   onPressed: () {
                        //     Forgotpassss(emailController.text.trim());
                        //     setState(() {
                        //       visible = true;
                        //     });
                        //   },
                        //   child: Text(
                        //     "Ok",
                        //     style: TextStyle(
                        //       fontSize: 20,
                        //     ),
                        //   ),
                        //   color: Colors.white,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void Forgotpassss(RoundedLoadingButtonController controller,String email) async {
    Timer(Duration(seconds: 5), () async {
      if (_formkey.currentState!.validate()) {
        try{
          await _auth
              .sendPasswordResetEmail(email: email);
          controller.success();
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Check your email----wait...',
          );
          Timer(Duration(seconds: 2), () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));
          });

        }on FirebaseAuthException catch (e){
          if(e.code == 'Email not sent'){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'Emailnot sent',
            );
          }
          else{
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'Email not registered, plz enter correct email',
            );
          }
        }
      }
      Timer(Duration(seconds: 2), () {
        controller.reset();
      });
    });
  }
}
