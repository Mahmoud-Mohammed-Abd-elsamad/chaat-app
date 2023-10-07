import 'package:flutter/material.dart';



class CustomTextFormField extends StatelessWidget{
  CustomTextFormField({super.key, required this.hintText,required this.onChange,required this.validator,this.obscureText =false});

  String? hintText;
  Function(String) onChange;
  String? Function(String?)? validator;
  bool obscureText;

  @override
  Widget build(BuildContext context) {

   return TextFormField(
     obscureText: obscureText,
     onChanged: onChange,
     validator: validator,
     decoration: InputDecoration(
       hintText: hintText,
       hintStyle:const TextStyle(color: Colors.white) ,
       focusedBorder:const OutlineInputBorder(
         borderSide: BorderSide(color: Colors.white,),
       ),
       enabledBorder: const OutlineInputBorder(
         borderSide: BorderSide(
             color: Colors.white), //<-- SEE HERE
       ),
     ),
   );
  }
}