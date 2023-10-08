import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../loginnew.dart';
import 'model.dart';



class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RoundedLoadingButtonController _btnController1 =
  RoundedLoadingButtonController();
  _RegisterState();
  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;


  final TextEditingController nameController = new TextEditingController();
  final TextEditingController numberController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController CnicController=new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Student',
    'Controller'
  ];
  var _currentItemSelected = "Student";
  var rool = "Student";


  void _doSomething(RoundedLoadingButtonController controller,String email, String password, String rool) async {
    Timer(Duration(seconds: 5), () async {
      if (_formkey.currentState!.validate()) {
        try {
          await _auth
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) => {postDetailsToFirestore(email, rool)})
              .catchError((e) {});
          controller.success();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'not registered') {
            controller.error();
            Timer(Duration(seconds: 3), () {
              controller.reset();
            });
            print('plz check your internet connection.');
          } else if (e.code == null) {
            controller.error();
            Timer(Duration(seconds: 3), () {
              controller.reset();
            });
            print('Null value.');

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        child:Column(
          children: <Widget>[
            SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(
                // color: Colors.white60,
                  image: DecorationImage(
                      image:AssetImage("images/login.png"),
                      fit: BoxFit.fitHeight,
                      opacity: 0.05
                  )
              ),
              margin: EdgeInsets.all(1),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    SizedBox(
                      height: 150,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome!",style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          )),
                          Text("Create your account now and \n          explore the library",
                            style: TextStyle(
                                fontSize: 12
                            ),)
                        ],
                      ),
                    ),
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
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(47, 110, 182, 10),
                                borderRadius: BorderRadius.circular(34)),
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
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(34)),
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
                    SizedBox(
                      height: 30,
                    ),

                     //Textformfield starts from here

                    //Name Textformfield
                    SizedBox(
                        height:70 ,
                        width: 330,
                        child: TextFormField(
                          controller: nameController,
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
                            prefixIcon: Icon(Icons.drive_file_rename_outline,size: 16),
                            // prefixIconColor: Color.fromRGBO(47, 110, 182, 10),
                            hintText: 'Name',
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
                              return "Name cannot be empty";
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              _btnController1.reset();
                              return ("Please enter your first name");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),


                    //Number
                    SizedBox(
                      height: 70,
                      width: 330,
                      child: TextFormField(
                        controller: numberController,
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
                          prefixIcon: Icon(Icons.contact_page,size: 16),
                          // prefixIconColor: Color.fromRGBO(47, 110, 182, 10),
                          hintText: 'Phone number',
                          contentPadding:
                          const EdgeInsets.only(left: 14.0, top: 14.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(50),
                          ),
                        ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{11,}$');
                            if (value!.length == 0) {
                              _btnController1.reset();
                              return "Phone Number cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              _btnController1.reset();
                              return ("please enter valid number");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.phone,
                        ),
                    ),

                    //Email
                    SizedBox(
                      width: 330,
                      height: 70,
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
                        onChanged: (value) {},
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),


                    //CNIC
                    SizedBox(
                      width: 330,
                      height: 70,
                      child:  TextFormField(
                        controller: CnicController,
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
                          prefixIcon: Icon(Icons.credit_card_sharp,size: 16),
                          // prefixIconColor: Color.fromRGBO(47, 110, 182, 10),
                          hintText: 'CNIC',
                          contentPadding:
                          const EdgeInsets.only(left: 14.0, top: 14.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(50),
                          ),
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{13,}$');
                          if (value!.length == 0) {
                            _btnController1.reset();
                            return "CNIC cannot be empty";
                          }
                          if (!regex.hasMatch(value)) {
                            _btnController1.reset();
                            return ("please enter valid CNIC");
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          CnicController.text = value!;
                        },
                        keyboardType: TextInputType.number,
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
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,size: 16,),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
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
                            return "Password cannot be empty";
                          }
                          if (!regex.hasMatch(value)) {
                            _btnController1.reset();
                            return ("please enter valid password min. 6 character");
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                      ),
                    ),


                    //?Confirm password
                    SizedBox(
                      width: 330,
                      height: 70,
                      child: TextFormField(
                        textInputAction: TextInputAction.none,
                        autofocus: false,
                        style: TextStyle(fontSize: 14),
                        controller: confirmpassController,
                        obscureText: _isObscure2,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_clock_rounded,size: 16,),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure2
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure2 = !_isObscure2;
                                });
                              }),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          fillColor: Colors.black12,
                          hintText: 'Confirm Password',
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
                          if (confirmpassController.text !=
                              passwordController.text) {
                            _btnController1.reset();
                            return "Password did not match";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                      ),
                    ),


                    // SizedBox(
                    //   height: 5,
                    // ),

                    //Item list Role
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(width: 120,),
                        Text(
                          "Select Role : ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 50,),
                        DropdownButton<String>(
                          dropdownColor: Colors.white,
                          iconEnabledColor: Color.fromRGBO(47, 110, 182, 10),
                          isDense: true,
                          isExpanded: false,
                          focusColor: Color.fromRGBO(47, 110, 182, 10),
                          items: options.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(
                                dropDownStringItem,
                                style: TextStyle(
                                  color: Color.fromRGBO(47, 110, 182, 10),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValueSelected) {
                            setState(() {
                              _currentItemSelected = newValueSelected!;
                              rool = newValueSelected;
                            });
                            signUp(emailController.text,
                                passwordController.text, rool);
                          },
                          value: _currentItemSelected,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),


                    //Registration button Loading effect
                    RoundedLoadingButton(
                      successIcon: Icons.done,
                      failedIcon: Icons.sms_failed,
                      color: Color.fromRGBO(47, 110, 182, 10),
                      height: 42,
                      width: 137,
                      child: Text('Register', style: TextStyle(color: Colors.white)),
                      controller: _btnController1,
                      onPressed: () {
                        if(emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty || nameController.text.trim().isEmpty || CnicController.text.trim().isEmpty || numberController.text.trim().isEmpty){
                          _btnController1.reset();
                        }
                        else{
                          setState(() {
                            showProgress = true;
                            _doSomething(_btnController1,emailController.text.trim(),passwordController.text.trim(),rool);
                          });
                        }
                        // signIn(
                        //     emailController.text, passwordController.text);
                      },
                    ),



                    //Simple button
                    //Simple Register Button

                    // MaterialButton(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius:
                    //       BorderRadius.all(Radius.circular(20.0))),
                    //   elevation: 5.0,
                    //   height: 42,
                    //   minWidth: 127,
                    //   onPressed: () {
                    //     setState(() {
                    //       showProgress = true;
                    //       print(CnicController.text);
                    //       print(emailController.text);
                    //       print(passwordController.text);
                    //       print(rool);
                    //
                    //     });
                    //     signUp(emailController.text,
                    //         passwordController.text, rool);
                    //     // obj.insertData(nameController.text.trim(), emailController.text.trim(), CnicController.text.trim(), rool,numberController.text.trim());
                    //   },
                    //   child: Text(
                    //     "Register",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white,
                    //       fontSize: 20,
                    //     ),
                    //   ),
                    //   color: Color.fromRGBO(47, 110, 182, 10),
                    // ),
                  ],

                ),

              ),
            ),
          ],
        ),
      ),

    );

  }

  void signUp(String email, String password, String rool) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, rool)})
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String email, String rool) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = email;
    userModel.uid = user!.uid;
    userModel.wrool = rool;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}



