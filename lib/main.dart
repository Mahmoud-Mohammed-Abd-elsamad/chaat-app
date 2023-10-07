import 'package:chat_app/cubites/chat/chat_cubit.dart';
import 'package:chat_app/cubites/login/login_cubit.dart';
import 'package:chat_app/cubites/register/register_cubit.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/sigin_in_screen.dart';
import 'package:chat_app/screens/sigin_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>RegisterCubit()),
        BlocProvider(create: (context)=>ChatCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SiginInScreen.id:(_) => SiginInScreen(),
          SiginUpScreen.id:(_) => SiginUpScreen(),
          ChatScreen.id:(_) => ChatScreen()
        },
        initialRoute: SiginInScreen.id ,
      ),
    );
  }
}
