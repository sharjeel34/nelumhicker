import 'package:flutter/material.dart';

import '../../../core/color_const.dart';
import '../../models/message_model.dart';

class ChatBauble extends StatelessWidget {
  const ChatBauble({Key? key, required this.messageModel, required this.id}) : super(key: key);
  final MessageModel messageModel;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: kPrimaryColor),
        child:Column(
           children: [
             Text(
               messageModel.message,
               style: const TextStyle(color: Colors.white, fontSize: 20),
             ),
             // Text(
             //   messageModel.id,
             //   style: const TextStyle(color: Colors.white, fontSize: 16),
             // ),
           ],
        ),
      ),
    );
  }
}

class ChatBaubleForHost extends StatelessWidget {
  const ChatBaubleForHost({Key? key, required this.messageModel})
      : super(key: key);
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: kSecondColor),
        child:Column(
          children: [
            Text(
              messageModel.message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height:5),
            // Text(
            //   messageModel.id,
            //   style: const TextStyle(color: Colors.white, fontSize: 10),
            // ),
          ],
        ),
      ),
    );
  }
}
