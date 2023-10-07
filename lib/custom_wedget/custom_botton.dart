import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  CustomButton({super.key, required this.text,required this.onTap});

  String text;
  Function() onTap;

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white,),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 55,
        child: Center(child: Text(text,style: const TextStyle(color: Colors.black,fontSize: 21),)),
      ),
    );
  }
}