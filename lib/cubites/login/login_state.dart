abstract class LoginState{}

class LoginInitilial extends LoginState{}
class LoginLooding extends LoginState{}
class LoginSuccess extends LoginState{}
class LoginFailure extends LoginState{
  LoginFailure({required this.errorMessage});
  String errorMessage;
}
