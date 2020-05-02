import 'package:flutter/material.dart';
import 'package:ordersystem_j/screens/authenticate/register.dart';
import 'package:ordersystem_j/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showSigIn = true;
  void toggleView(){
    setState( () => showSigIn =! showSigIn );
  }

  @override
  Widget build(BuildContext context) {
    if(showSigIn){
      return SignIn(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }
      
  }
}