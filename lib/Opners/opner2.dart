import 'package:flutter/material.dart';

import 'opner3.dart';

class Opner2 extends StatefulWidget {
  @override
  _Opner2State createState() => _Opner2State();
}

class _Opner2State extends State<Opner2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/op2.png'),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 120, top: 60),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.black.withOpacity(0.9),
                    ],),
                ),
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 30,bottom: 80),
                child: Text(
                  'Explore Your \nBooks',
                  style: TextStyle(

                      letterSpacing: 2,
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.7,
                      right: 35,
                      left: 35),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: IconButton(
                              splashColor: Color.fromRGBO(47, 110, 182, 10),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Opner3()));
                              },
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                            width:60,
                            height: 60,
                            decoration: BoxDecoration(
                                color:  Color.fromRGBO(47, 110, 182, 10),
                                borderRadius: BorderRadius.all(Radius.circular(14))
                            ),

                          )
                        ],
                      ),

                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.circle_outlined,
                            color: Color.fromRGBO(47, 110, 182, 10),
                            size: 20.0,
                          ),
                          Icon(
                            Icons.circle,
                            color: Color.fromRGBO(47, 110, 182, 10),
                            size: 20,
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: Color.fromRGBO(47, 110, 182, 10),
                            size: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
