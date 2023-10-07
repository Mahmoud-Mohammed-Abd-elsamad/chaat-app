import 'package:chat_app/cubites/login/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitilial());

  Future<void> userSigin({required String emailAddress,required String password}) async {

    emit(LoginLooding());
   try{
     final credential = await FirebaseAuth.instance
         .signInWithEmailAndPassword(email: emailAddress, password: password);
     emit(LoginSuccess());
   }on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found'&& e.code =="The email address is badly formatted") {
       emit(LoginFailure(errorMessage: 'No user found for that email'));
     } else if (e.code == 'wrong-password') {
       emit(LoginFailure(errorMessage: 'Wrong password provided for that user.'));
     }
   } catch(ex){
     emit(LoginFailure(errorMessage: '$ex'));

   }

  }
}