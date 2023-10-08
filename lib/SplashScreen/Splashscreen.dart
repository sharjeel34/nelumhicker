import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'Splash_screen_controller.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);


  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
Splashservice splashservice=Splashservice();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashservice.ismainpage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Shimmer(
        //Default value: Duration(seconds: 0)
        color: Colors.black12, //Default value
        colorOpacity: 0, //Default value
        enabled: true, //Default value
        direction: ShimmerDirection.fromLTRB(),
        child: Column(
            children:[
              SizedBox(height: 280,),

              Container(
                    height: 250,
                    width: 300,
                    child: Image.asset("assets/Access.png",
                        gaplessPlayback: true,
                        fit: BoxFit.fill
                    )),

              SizedBox(
                height: 5,
              ),
              SpinKitThreeBounce(
                color: Colors.blueAccent,
                size: 50,
              )
            ]
          ),
      ),

      );
  }
}
