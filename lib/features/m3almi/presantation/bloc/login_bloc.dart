import 'package:auth/features/m3almi/domaine/usecases/auth.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'feilds_validators.dart';


class LoginBloc with LoginValidation {

  final AuthService _auth = AuthService();
  
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _userName = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();


Stream<String> get email => _email.stream.transform(validationEmail);
Stream<String> get password => _password.stream.transform(validationPassword);
Stream<String> get userName => _userName.stream.transform(validationUserName);
Stream<String> get phoneNumber => _phoneNumber.stream.transform(validationPhoneNumber);

Function(String) get emailChanged => _email.sink.add;
Function(String) get passwordChanged => _password.sink.add;
Function(String) get userNameChanged => _userName.sink.add;
Function(String) get phoneNumberChanged => _phoneNumber.sink.add;

Stream<bool> get buttonSignIsValid => CombineLatestStream([email , password], (values) => true);
Stream<bool> get buttonRegisterIsValid => CombineLatestStream([email , password , phoneNumber ], (values) => true);

String error = "";
submitLogin() async {
  final validEmail = _email.value;
  final validPassword = _password.value;
  try {
    await _auth.signInWithEmailAndPassword(validEmail, validPassword );
  } catch (e) {
    print(e.toString());
  }
    
}
    
  dispose(){
    _email.close();
    _password.close();
    _userName.close();
    _phoneNumber.close();
  }
    


  
}