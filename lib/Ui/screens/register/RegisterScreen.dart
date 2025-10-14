import 'package:evently_app/Ui/common/AppNameText.dart';
import 'package:evently_app/Ui/design/design.dart';
import 'package:evently_app/Ui/provider/AppAuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../routes.dart';
import '../../common/CutomFormField.dart';
import '../../common/language_switcher.dart';
import '../../common/validators.dart';

class RegisterScreen extends StatefulWidget {
  static const String route = "register";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(AppImages.appIcon, width: 136, height: 141),
            AppNameText(),
            const SizedBox(height: 16),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppFormField(
                    controller: nameController,
                    label: "Name",
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                    validator: (text) {
                      if (text?.trim().isEmpty == true) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),

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
                        return "please enter password";
                      }
                      if ((text?.length ?? 0) < 6) {
                        return "Password must be at least 6 characters";
                      }
                    },
                  ),

                  AppFormField(
                    controller: rePasswordController,
                    label: "Re-Password",
                    icon: Icons.lock,
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    validator: (text) {
                      if (text?.trim().isEmpty == true) {
                        return "please enter password";
                      }
                      if (passwordController.text != text) {
                        return "Password does not match";
                      }
                    },
                  ),

                  const SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            createAccount();
                          },
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(width: 8),
                              Text("Loading..."),
                            ],
                          )
                        : Text("Create Account"),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account ? ",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.LoginScreen.route,
                          );
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [LanguageSwitcher()],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createAccount() async {
    if (validateForm() == false) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    AppAuthProvider provider = Provider.of<AppAuthProvider>(
      context,
      listen: false,
    );

    AuthResponse response = await provider.register(
      emailController.text,
      passwordController.text,
      nameController.text,
    );

    if (response.success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("User created successfully")));
      Navigator.pushReplacementNamed(context, AppRoutes.HomeScreen.route);
    } else {
      handleAuthError(response);
    }
    setState(() {
      isLoading = false;
    });
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void handleAuthError(AuthResponse response) {
    String errorMessage;

    switch (response.failure) {
      case AuthFailure.weakPassword:
        errorMessage = "Weak password";
        break;
      case AuthFailure.emailInUse:
        errorMessage = "Email already used";
        break;
      default:
        errorMessage = "Something went wrong";
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}
