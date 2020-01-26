import 'dart:async';

class LoginValidation {
  final validationEmail = StreamTransformer<String , String>.fromHandlers(
    handleData: (email, sink) {
       (email.contains('@') && email.contains('.com')) 
        ? sink.add(email)
        : sink.addError('invalid email');
    }
  );

  final validationUserName = StreamTransformer<String , String>.fromHandlers(
    handleData: (userName, sink) {
       userName.isEmpty ? sink.add(userName): sink.addError('please enter your userName');
    }
  );

  final validationPhoneNumber = StreamTransformer<String , String>.fromHandlers(
    handleData: (phoneNumber, sink) {
       phoneNumber.isEmpty ? sink.add(phoneNumber): sink.addError('please enter a phoneNumber');
    }
  );

   final validationPassword = StreamTransformer<String , String>.fromHandlers(
    handleData: (password, sink) {
       (password.length >= 6) ? sink.add(password) : sink.addError('invalid password');
    }
  );
  
}