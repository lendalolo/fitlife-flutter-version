

part of 'auth_bloc.dart';

 class AuthEvent {}
class ShowPassword extends AuthEvent{
}
class Register extends AuthEvent{
  final String name;
  final String email;
  final String password;
  Register(this.name, this.email, this.password);
}
class LogIn extends AuthEvent{
  final String email;
  final String password;
  LogIn( this.email, this.password);
}
class RegisterWithGoogle extends AuthEvent{}
class RegisterWithFacebook extends AuthEvent{}
class IsLoged extends AuthEvent{
   final List<TextEditingController> controlers;
final   bool isloged ;
IsLoged(this.isloged, this.controlers);
}
class IsSign extends AuthEvent{
  final   bool isloged ;
  IsSign(this.isloged);
}
class LogOut extends AuthEvent{
}
class AddUserInformation extends AuthEvent{
  final int width; final int height;  final String address;  final String gender;  final String lat;  final String lon;  final String illness;  final int age;
  final String dayes;
  AddUserInformation(this.width, this.height, this.address, this.gender, this.lat, this.lon, this.illness, this.age, this.dayes);
}
class UpadteUserInformation extends AuthEvent{
  final int width; final int height;  final String address;  final String gender;  final String lat;  final String lon;  final String illness;  final int age;
  final String dayes;
  UpadteUserInformation(this.width, this.height, this.address, this.gender, this.lat, this.lon, this.illness, this.age, this.dayes);
}
class SearchLocation extends AuthEvent{
   final String q;
   SearchLocation(this.q);
}
class ConfirmRegisterEvent extends AuthEvent{
  final int code;
  ConfirmRegisterEvent(this.code);
}
// class IsLogedNavigate extends AuthEvent{
//   final   bool isloged ;
//   IsLogedNavigate(this.isloged);
// }


