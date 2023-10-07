import 'package:chat_app/constants.dart';
import 'package:chat_app/cubites/register/register_cubit.dart';
import 'package:chat_app/cubites/register/register_state.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_wedget/custom_botton.dart';
import '../custom_wedget/custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class SiginUpScreen extends StatelessWidget {
  static String id = 'siginUpScreen';

  String? emailAddress;

  String? password;

  bool isLoding = false;

  final GlobalObjectKey<FormState> _formKey = const GlobalObjectKey(FormState);

  SiginUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body:BlocConsumer<RegisterCubit,RegisterState>(builder: (BuildContext context, state) {
        return  ModalProgressHUD(
          inAsyncCall: isLoding,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Image.asset("assets/images/img.png"),
                    const SizedBox(
                      height: 70,
                    ),
                    Image.asset("assets/images/img.png",height: 100,),
                    const Center(
                        child: Text(
                          "Scholar Chat",
                          style: TextStyle(fontSize: 21, color: Colors.white),
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      "Register",
                      style: TextStyle(fontSize: 21, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      hintText: "email",
                      onChange: (text) {
                        emailAddress = text;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "this field requird";
                        }
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: "password",
                      onChange: (text) {
                        password = text;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "this field requird";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'Register',
                      onTap: () async {

                          isLoding = true;

                        if(_formKey.currentState!.validate()){
                          BlocProvider.of<RegisterCubit>(context).userRegistration(emailAddress: emailAddress, password: password);

                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "aredy have an account",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "  Login",
                              style: TextStyle(color: Color(0xffa4b5c2)),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
        listener: (BuildContext context, Object? state) {
        if(state is RegisterLoding){
          isLoding = true;
        }else if(state is RegisterSuccess){
          isLoding = false;
          showSnackBar(context, message: "Successful Registration");
             Navigator.pushNamed(context, ChatScreen.id);
        }else if(state is RegisterFailure) {
          isLoding = false;

          showSnackBar(context, message: state.errorMessaga);
        }

        },)
    );
  }

  void showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Future<UserCredential> userRegistration() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );
    return credential;
  }
}
