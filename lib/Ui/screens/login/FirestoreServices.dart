// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class FirebaseGoogleAuth {
//   bool? isInitialize;
//   String? _google;
//
//
//   Future<void> _initSignIn() async {
//     if (!isInitialize!) {
//       await _google?.initialize(
//         serverClientId:
//             '941522876231-g1rl7lnm7s6b4lh3c4b47hgkjh9rv4q1.apps.googleusercontent.com',
//       );
//     }
//     isInitialize = true;
//   }
//
//   Future<UserCredential> signInWithGoogle() async {
//     _initSignIn();
//
//     GoogleSignInAccount? account = await _google.authenticate();
//
//     final isToken = account.authentication.idToken;
//
//     final authClient = account.authorizationClient;
//
//     GoogleSignInClientAuthorization? auth = await authClient
//         .authorizationForScopes(['email', 'profile']);
//
//     final accessToken = auth?.accessToken;
//
//     final credential = GoogleAuthProvider.credential(
//       idToken: idToken,
//       accessToken: accessToken,
//     );
//     return await _google?.signInWithCredential(credential);
//   }
// }
