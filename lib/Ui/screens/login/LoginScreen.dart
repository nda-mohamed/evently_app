import 'package:evently_app/Ui/common/AppNameText.dart';
import 'package:evently_app/Ui/design/design.dart';
import 'package:evently_app/Ui/provider/AppAuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../routes.dart';
import '../../common/CutomFormField.dart';
import '../../common/language_switcher.dart';
import '../../common/validators.dart';
import 'FirestoreServices.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  //final FirebaseGoogleAuth _googleAuth = FirebaseGoogleAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(AppImages.appIcon, width: 136, height: 141),
            AppNameText(),
            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppFormField(
                    controller: emailController,
                    label: "E-mail",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text?.trim().isEmpty == true) {
                        return "Please enter your email";
                      }
                      if (!isValidEmail(text)) {
                        return "Please enter valid email";
                      }
                    },
                  ),
                  AppFormField(
                    controller: passwordController,
                    label: "Password",
                    icon: Icons.lock,
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    validator: (text) {
                      if (text?.trim().isEmpty == true) {
                        return "Please enter password";
                      }
                      if ((text?.length ?? 0) < 6) {
                        return "Password must be at least 6 characters";
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: isLoading ? null : login,
                    child: isLoading
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 8),
                        Text("Loading..."),
                      ],
                    )
                        : Text("Sign in"),
                  ),

                  // ElevatedButton.icon(
                  //   onPressed: () async {
                  //     var user = await _googleAuth.signInWithGoogle();
                  //     print(user.user?.displayName);
                  //     print(user.user?.email);
                  //   },
                  //   icon: Image.asset(
                  //     'assets/icons/Group 18559.png',
                  //     height: 24,
                  //     width: 24,
                  //   ),
                  //   label: Text("Sign in with Google"),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.white,
                  //     foregroundColor: Colors.black87,
                  //     side: BorderSide(color: Colors.grey.shade300),
                  //     padding: EdgeInsets.symmetric(vertical: 12),
                  //   ),
                  // ),

                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have Account ? ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.RegisterScreen.route,
                          );
                        },
                        child: Text("Create Account"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot your password? ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.ForgetPasswordScreen.route,
                          );
                        },
                        child: Text(
                          "Reset Password",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LanguageSwitcher(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    if (validateForm() == false) return;

    setState(() => isLoading = true);

    AppAuthProvider provider =
    Provider.of<AppAuthProvider>(context, listen: false);

    AuthResponse response = await provider.login(
      emailController.text,
      passwordController.text,
    );

    if (response.success) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged in successfully")));
      Navigator.pushReplacementNamed(context, AppRoutes.HomeScreen.route);
    } else {
      handleAuthError(response);
    }

    setState(() => isLoading = false);
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void handleAuthError(AuthResponse response) {
    String errorMessage;

    switch (response.failure) {
      case AuthFailure.invalidCredential:
        errorMessage = "Wrong email or password";
        break;
      default:
        errorMessage = "Something went wrong";
        break;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}
