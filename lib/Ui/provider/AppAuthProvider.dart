import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../database/UsersDao.dart';
import '../../database/model/AppUser.dart';

class AppAuthProvider extends ChangeNotifier {
  var _fb_authService = FirebaseAuth.instance; //singleton
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      print("sendPasswordReset error: ${e.code}");
      return false;
    } catch (e) {
      print("sendPasswordReset unknown error: $e");
      return false;
    }
  }

  AppAuthProvider(){
    retrieveUserFromDatabase();
  }

  AppUser? getUser(){
    return _databaseUser;
  }
  void logout(){
    _fb_authService.signOut();
    _databaseUser = null;
    _fbAuthUser = null;
    notifyListeners();
  }

  void retrieveUserFromDatabase() async {
    if(_fbAuthUser!=null){
      _databaseUser = await UsersDao.getUserById(_fbAuthUser?.uid);
      notifyListeners();
    }
  }

  // save user in memory
  var _fbAuthUser = FirebaseAuth.instance.currentUser;
  AppUser? _databaseUser;

  bool isLoggedInBefore(){
    var user = FirebaseAuth.instance.currentUser;

    if(user == null){
      return false;
    }

    return true;
  }

  Future<AuthResponse> register(String email, String password, String name) async {
    try {
      final credential = await _fb_authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser user = AppUser(
        id: credential.user!.uid,
        name: name,
        email: email,
      );

      await UsersDao.addUser(user);
      _databaseUser = user;
      _fbAuthUser = credential.user;

      return AuthResponse(success: true, failure: null, credential: credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthFailure.weakPassword.code) {
        return AuthResponse(success: false, failure: AuthFailure.weakPassword);
      } else if (e.code == AuthFailure.emailInUse.code) {
        return AuthResponse(success: false, failure: AuthFailure.emailInUse);
      }
    } catch (e) {}
    return AuthResponse(success: false, failure: AuthFailure.general);
  }

  Future<AuthResponse> login(String email, String password) async {
    try {
      final credential = await _fb_authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser? user = await UsersDao.getUserById(credential.user!.uid);

      _databaseUser = user;
      _fbAuthUser = credential.user;

      return AuthResponse(success: true, failure: null, credential: credential);

    } on FirebaseAuthException catch (e) {
      if (e.code == AuthFailure.invalidCredential.code) {
        return AuthResponse(
          success: false,
          failure: AuthFailure.invalidCredential,
        );
      }
    } catch (e) {}
    return AuthResponse(success: false, failure: AuthFailure.general);
  }
}

class AuthResponse {
  bool success;
  AuthFailure? failure;
  UserCredential? credential;
  AppUser? user;

  AuthResponse({
    required this.success,
    this.failure,
    this.credential,
    this.user,
  });
}

enum AuthFailure {
  weakPassword('weak-password'),
  emailInUse('email-already-in-use'),
  invalidCredential('invalid-credential'),
  general('Something went wrong');

  final String code;
  const AuthFailure(this.code);
}
