import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nelumhicker/Chat/features/presentation/pages/home_page.dart';
import 'package:nelumhicker/New/add_book_information.dart';

import '../ControllerScreens/ResetpasswordScreen.dart';
import '../Error.dart';
import '../New/StudentList.dart';
import '../New/model.dart';
import '../New/posts.dart';
import '../loginnew.dart';
import '../screen/home_screen.dart';

class Controller extends StatefulWidget {
  String id;
  Controller({required this.id});
  @override
  _ControllerState createState() => _ControllerState(id: id);
}

class _ControllerState extends State<Controller> {
  String id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();

  _ControllerState({required this.id});
  @override
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
            Center(
              child: Text(
                "Profile",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),

            SizedBox(
              height: 90,
            ),
            //making profile pic frame
            //the curve design container
            // Stack(
            //   children: [
            //     Container(
            //       height:100,
            //       color: Colors.white,
            //     ),
            //     Center(
            //       child: CircleAvatar(
            //         radius: 62,
            //         backgroundImage: AssetImage("images/avatar.png"),
            //       ),
            //     ),
            //
            //   ],
            // ),
            Stack(children: [
              Container(
                margin: EdgeInsets.only(top: 48),
                height: 607.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                          child:
                          Icon(
                            Icons.camera_alt,
                            size: 15.0,
                            color: Color(0xFF404040),
                          ),
                        ),
                      ),
                      radius: 60.0,
                      backgroundImage: AssetImage('images/avatar.png'),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:120),
                    Text("Your name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16
                        )),
                    Text(emaill,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 16
                        )),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 200,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ControllerResetPassword(id: id,)));
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 24,),
                        Image(
                          image: AssetImage("images/resetpassword.png"),
                          color:Colors.black54 ,
                          height: 24,
                          width: 24,),
                        SizedBox(width: 20,),
                        Text("Reset Password",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87
                          ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Errorpage()));
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 24,),
                        Image(
                          image: AssetImage("images/location.png"),
                          color:Colors.black54 ,
                          height: 24,
                          width: 24,),
                        SizedBox(width: 20,),
                        Text("Location Panel",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),)
                      ],
                    ),
                  ),
                  // SizedBox(height: 30,),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(context,MaterialPageRoute(builder: (context) => Chatpage(),));
                  //   },
                  //   child: Row(
                  //     children: [
                  //       SizedBox(width: 24,),
                  //       Image(
                  //         image: AssetImage("images/chat.png"),
                  //         color:Colors.black54 ,
                  //         height: 24,
                  //         width: 24,),
                  //       SizedBox(width: 20,),
                  //       Text("Chat",
                  //         style: TextStyle(
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.black
                  //         ),)
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 30,),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => add_book_info()));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          SizedBox(width: 24,),
                          Image(
                            image: AssetImage("images/tree.png"),
                            color:Colors.black54 ,
                            height: 24,
                            width: 24,),
                          SizedBox(width: 20,),
                          Text("Add Book",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () {
                      logout(context);
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 24,),
                        Icon(
                            Icons.logout,
                            color:Colors.black54 ,
                            size: 25),
                        SizedBox(width: 20,),
                        Text("Logout",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),)
                      ],
                    ),
                  ),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
