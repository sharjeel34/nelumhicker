// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:nelumhicker/screen/home_screen.dart';
//
// import 'ResetpasswordScreen.dart';
//
// class ControllerMainScreen extends StatelessWidget {
//   const ControllerMainScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(47, 110, 182, 10),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           Center(
//             child: Text(
//               "Profile",
//               style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 25,
//                   color: Colors.white),
//             ),
//           ),
//
//           SizedBox(
//             height: 90,
//           ),
//           //making profile pic frame
//           //the curve design container
//           // Stack(
//           //   children: [
//           //     Container(
//           //       height:100,
//           //       color: Colors.white,
//           //     ),
//           //     Center(
//           //       child: CircleAvatar(
//           //         radius: 62,
//           //         backgroundImage: AssetImage("images/avatar.png"),
//           //       ),
//           //     ),
//           //
//           //   ],
//           // ),
//           Stack(children: [
//             Container(
//               margin: EdgeInsets.only(top: 48),
//               height: 607.45,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(60),
//                     topRight: Radius.circular(60)),
//               ),
//             ),
//             Align(
//                 alignment: Alignment.topCenter,
//                 child: SizedBox(
//                   child: CircleAvatar(
//                     radius: 60.0,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       child: Align(
//                         alignment: Alignment.bottomRight,
//                         child: CircleAvatar(
//                           backgroundColor: Colors.white,
//                           radius: 12.0,
//                           child:
//                           Icon(
//                             Icons.camera_alt,
//                             size: 15.0,
//                             color: Color(0xFF404040),
//                           ),
//                         ),
//                       ),
//                       radius: 60.0,
//                       backgroundImage: AssetImage('images/avatar.png'),
//                     ),
//                   ),
//                 ),
//             ),
//             Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height:120),
//                   Text("Your name",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     fontSize: 16
//                   )),
//                   Text("yourname@gmail.com",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black45,
//                           fontSize: 16
//                       )),
//                 ],
//               ),
//             ),
//             Column(
//               children: [
//                 SizedBox(height: 200,),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => ControllerResetPassword()));
//                   },
//                   child: Row(
//                     children: [
//                       SizedBox(width: 24,),
//                       Image(
//                         image: AssetImage("images/resetpassword.png"),
//                         color:Colors.black54 ,
//                         height: 24,
//                         width: 24,),
//                       SizedBox(width: 20,),
//                       Text("Reset Password",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87
//                       ),)
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//                   },
//                   child: Row(
//                     children: [
//                       SizedBox(width: 24,),
//                       Image(
//                         image: AssetImage("images/location.png"),
//                         color:Colors.black54 ,
//                         height: 24,
//                         width: 24,),
//                       SizedBox(width: 20,),
//                       Text("Location Panel",
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black
//                         ),)
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//                   },
//                   child: Row(
//                     children: [
//                       SizedBox(width: 24,),
//                       Image(
//                         image: AssetImage("images/chat.png"),
//                         color:Colors.black54 ,
//                         height: 24,
//                         width: 24,),
//                       SizedBox(width: 20,),
//                       Text("Chat",
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black
//                         ),)
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//                   },
//                   child: Container(
//                     child: Row(
//                       children: [
//                         SizedBox(width: 24,),
//                         Image(
//                           image: AssetImage("images/tree.png"),
//                           color:Colors.black54 ,
//                           height: 24,
//                           width: 24,),
//                         SizedBox(width: 20,),
//                         Text("Add Trip",
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black
//                           ),)
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             )
//
//
//           ])
//         ],
//       ),
//     );
//   }
// }
