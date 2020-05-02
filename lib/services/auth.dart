import 'package:firebase_auth/firebase_auth.dart';
import 'package:ordersystem_j/models/user.dart';
import 'package:ordersystem_j/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based n firebase user
  User _userfromfbaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) =>_userfromfbaseUser(user));
      .map(_userfromfbaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user  = result.user;
      return _userfromfbaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  //sign in with email and password
  Future sigInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userfromfbaseUser(user); 
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //create or update user brew collection with uid from user returned
      await DatabaseService(uid: user.uid).updateUserData('0','name',100);
      return _userfromfbaseUser(user); 
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signout() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}