import 'package:chat_app/cubites/register/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit():super(RegisterInitial());



  Future<void> userRegistration({required emailAddress,required password}) async {
    emit(RegisterLoding());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(RegisterSuccess());

    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMessaga: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessaga: "The account already exists for that email."));
      }
    } catch (e) {
      emit(RegisterFailure( errorMessaga: '$e'));

      // TODO
    }
  }

}