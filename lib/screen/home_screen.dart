import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nelumhicker/Chat/features/presentation/pages/home_page.dart';
import 'package:nelumhicker/Roles/Student.dart';
import '../Widgetsclasses/Bottomnavigationbar.dart';
import '../Widgetsclasses/PageScrollView.dart';
import '../loginnew.dart';


class HomeScreen extends StatefulWidget {
  final String id;
  final String email;
  final String username;
  const HomeScreen({
    required this.id,
    required this.email,
    required this.username
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState(id:id,email:email,username:username);
}



class _HomeScreenState extends State<HomeScreen> {
  var id;
  var email;
  var username;

  _HomeScreenState({required this.id,required this.email, this.username});
  final  TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  var auth = FirebaseAuth.instance;
  bool isLoading = false;


  @override
  void dispose() {
    emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
        inAsyncCall: isLoading,
      child :Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 110, 182, 10),
        toolbarOpacity: 0,
        shadowColor: Colors.black12,
        leading: Builder(
          builder: (BuildContext context) {
            return SizedBox(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    // ElevatedButton(onPressed: () {}, child:
                    //
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                        MaterialLocalizations.of(context).openAppDrawerTooltip;
                        } ,
                      child:  Image(
                        image: AssetImage('assets/images/Drawericon.png'),
                        height: 21,
                        width: 24,
                      ),
                    )
                  ],
                ),
            );
          },
        ),

      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(47, 110, 182, 10)),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 260),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blueGrey,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/150?img=11'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            username?? "Unknown",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Where would you like to go?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 145,
                      ),
                      Image(
                        image: AssetImage("assets/images/Notifyicon.png"),
                        width: 28,
                        height: 28,
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      child: Mystatefullwidget(),
                  margin: const EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              child: SizedBox(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueGrey,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=11'),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Name",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        )),
                        Text(email,
                            style: TextStyle(
                                fontSize: 12
                            )),
                      ],
                    ),


                  ],
                ),
              ),
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.location_on,color: Colors.white),
                    SizedBox(width: 10),
                    Text("Track",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),)
                  ],
                ),
              ),
              onTap: () {

                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.payment,color: Colors.black),
                    SizedBox(width: 10),
                    Text("Payment",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.chat,color: Colors.black),
                    SizedBox(width: 10),
                    Text("Chat",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Chatpage(email: emailController.text),));
                Navigator.push(context,MaterialPageRoute(builder: (context) => Chatpage(),));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.settings,color: Colors.black),
                    SizedBox(width: 10),
                    Text("Setting",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.contact_phone,color: Colors.black),
                    SizedBox(width: 10),
                    Text("Contact us",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                // margin: EdgeInsets.only(left: 150),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.book_outlined,color: Colors.black),
                    SizedBox(width: 10),
                    Text("About us",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                logout(context);
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.help,color: Colors.black),
                    SizedBox(width: 10),
                    Text("Help",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Container(
                // margin: EdgeInsets.only(left: 150),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.logout,color: Colors.black),
                    SizedBox(width: 10),
                    Text("LOGOUT",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),)
                  ],
                ),
              ),
              onTap: () {
                logout(context);
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    )
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
