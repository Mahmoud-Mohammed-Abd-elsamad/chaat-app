abstract  class RegisterState{}

class RegisterInitial extends RegisterState{}
class RegisterLoding extends RegisterState{}
class RegisterSuccess extends RegisterState{}
class RegisterFailure extends RegisterState{
  RegisterFailure({required this.errorMessaga});
  String errorMessaga;
}