import 'dart:async';

class Validator{

  final validateEmail = StreamTransformer<String,String>.fromHandlers(
      handleData: (email,sink){
        if(email.contains('@')){
          sink.add(email);
        }else{
          sink.addError('Enter a Valid Email');
        }
      }
  );


  final validatePassword = StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink){
        if(password.length > 6){
          sink.add(password);
        }else{
          sink.addError('InValid Password Length');
        }
      }
  );

}