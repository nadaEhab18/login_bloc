import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Center(child: Text('Hello',)),
          emailField(bloc),
          passwordField(bloc),
          submitBtn(),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context,snapshot){
      return TextField(
        onChanged: bloc.changeEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'you@example.com',
          labelText: 'Email Address',
       //  errorText: snapshot.error.toString(),
        ),
      );
    });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context,snapshot){
      return TextField(
        onChanged: bloc.changePassword,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          errorText: snapshot.error.toString(),

        ),
      );
    });
  }

  Widget submitBtn(){
    return RaisedButton(
        child: Text('Login'),
        color: Colors.blue,
        onPressed: (){});
  }
}
