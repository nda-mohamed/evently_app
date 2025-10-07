import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../routes.dart';
import '../../provider/AppAuthProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppAuthProvider provider = Provider.of<AppAuthProvider>(context);
    var user = provider.getUser();
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              provider.logout();
              Navigator.pushReplacementNamed(context, AppRoutes.LoginScreen.route);
            },
            child: Icon(Icons.logout,
              color: Colors.white,),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            user?.name?.isEmpty == false ?
            Text(user?.name??"",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white
              ),) : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}