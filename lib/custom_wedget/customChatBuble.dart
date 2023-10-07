import 'package:flutter/material.dart';

import '../constants.dart';

class CustomChatBuble extends StatelessWidget {
  CustomChatBuble({super.key,  required this.message });

  String message;

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(32),topLeft: Radius.circular(32),
                    bottomRight: Radius.circular(23))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 23,horizontal: 8),
              child: Text("$message ",style: const TextStyle(color: Colors.white),),
            ),
          );
  }
}


class CustomChatBubleForFrind extends StatelessWidget {
  CustomChatBubleForFrind({super.key,  required this.message });

  String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Color(0xff016d89),
          borderRadius: BorderRadius.only(topRight: Radius.circular(32),topLeft: Radius.circular(32),
              bottomLeft: Radius.circular(23))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 23,horizontal: 8),
        child: Text("$message ",style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
