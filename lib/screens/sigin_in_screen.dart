import 'package:chat_app/constants.dart';
import 'package:chat_app/cubites/chat/chat_cubit.dart';
import 'package:chat_app/cubites/login/login_cubit.dart';
import 'package:chat_app/cubites/login/login_state.dart';
import 'package:chat_app/custom_wedget/custom_text_form_field.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/sigin_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../custom_wedget/custom_botton.dart';

class SiginInScreen extends StatelessWidget {
  SiginInScreen({super.key});

  static String id = 'siginInScreen';

  String? emailAddress;

  String? password;
  bool isLoding = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: BlocConsumer<LoginCubit, LoginState>(
          builder: (BuildContext context, state) {
            return ModalProgressHUD(

              inAsyncCall: isLoding,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Image.asset(
                        "assets/images/img.png",
                        height: 100,
                      ),
                      const Center(
                          child: Text(
                        "Scholar Chat",
                        style: TextStyle(fontSize: 21, color: Colors.white),
                      )),
                      const SizedBox(
                        height: 70,
                      ),
                      const Text(
                        "SiginIn",
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
                          validator: (value) =>
                              value!.isEmpty ? 'email cannot be blank' : null),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          obscureText: true,
                          hintText: "password",
                          onChange: (text) {
                            password = text;
                          },
                          validator: (value) => value!.isEmpty
                              ? 'Password cannot be blank'
                              : null),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: 'Sigin In',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).userSigin(
                                emailAddress: emailAddress!,
                                password: password!);

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
                            "don't have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, SiginUpScreen.id);
                              },
                              child: const Text(
                                "  Sign Up",
                                style: TextStyle(color: Color(0xffa4b5c2)),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (BuildContext context, Object? state) {
            if (state is LoginLooding) {
              isLoding = true;
            } else if (state is LoginSuccess) {
              BlocProvider.of<ChatCubit>(context).getMessage();
              isLoding = false;
              Navigator.pushNamed(context, ChatScreen.id,
                  arguments: emailAddress);
            } else if (state is LoginFailure) {
              isLoding = false;
              showSnackBar(context, state.errorMessage);
            }
          },
        ));
  }

  void showSnackBar(BuildContext context, String mesage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(" $mesage"),
    ));
  }

  Future<UserCredential> userSigin() async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress!, password: password!);
    return credential;
  }
}
