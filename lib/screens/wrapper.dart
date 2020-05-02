import 'package:flutter/material.dart';
import 'package:ordersystem_j/models/user.dart';
import 'package:ordersystem_j/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return either home or authenticate widget
    // if(user== null){
    //   return Authenticate();
    // }else{
    //   return Home();
    // }
    return user == null ? Authenticate() : Home();
  }
}