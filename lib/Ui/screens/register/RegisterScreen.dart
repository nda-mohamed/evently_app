import 'package:evently_app/Ui/common/AppNameText.dart';
import 'package:evently_app/Ui/design/design.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/CutomFormField.dart';
import '../../common/validators.dart';

class RegisterScreen extends StatefulWidget {
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(AppImages.appIcon, width: 136, height: 141),
            AppNameText(),
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
                    onPressed: () {
                      createAccount();
                    },
                    child: Text("Create Account"),
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
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
