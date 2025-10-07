import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppAuthProvider extends ChangeNotifier {

  var _fb_authService = FirebaseAuth.instance; //singleton

  Future<AuthResponse> register(String email, String password, String name) async {
    try {
      final credential = await _fb_authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

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
      return AuthResponse(success: true, failure: null, credential: credential);

    } on FirebaseAuthException catch (e) {
      if (e.code == AuthFailure.invalidCredential.code) {
        return AuthResponse(success: false, failure: AuthFailure.invalidCredential);
      }
    } catch (e) {}
    return AuthResponse(success: false, failure: AuthFailure.general);
  }

}

class AuthResponse {
  bool success;
  AuthFailure? failure;
  UserCredential? credential;

  AuthResponse({required this.success, this.failure, this.credential});

}

enum AuthFailure {
  weakPassword('weak-password'),
  emailInUse('email-already-in-use'),
  invalidCredential('invalid-credential'),
  general('Something went wrong');

  final String code;
  const AuthFailure(this.code);
}