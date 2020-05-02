import 'package:flutter/material.dart';
import 'package:ordersystem_j/models/user.dart';
import 'package:ordersystem_j/screens/wrapper.dart';
import 'package:ordersystem_j/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
      ),
    );
  }
}