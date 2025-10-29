import 'package:evently_app/Ui/screens/home/tabs/map_tab/map_tab.dart';
import 'package:evently_app/Ui/screens/login/LoginScreen.dart';
import 'package:evently_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Ui/common/AppSharedPreferences.dart';
import 'Ui/design/design.dart';
import 'Ui/provider/AppAuthProvider.dart';
import 'Ui/provider/LanguageProvider.dart';
import 'Ui/provider/ThemeProvider.dart';
import 'Ui/screens/OnBoarding/OnBoarding.dart';
import 'package:provider/provider.dart';
import 'Ui/screens/addEvent/AddEventScreen.dart';
import 'Ui/screens/forgetPassword/forgetPassword.dart';
import 'Ui/screens/home/HomeScreen.dart';
import 'Ui/screens/home/tabs/fav_tab/fav_tab.dart';
import 'Ui/screens/home/tabs/profile_tab/profile_tab.dart';
import 'Ui/screens/intro/introScreens.dart';
import 'Ui/screens/register/RegisterScreen.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await AppSharedPreferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => AppAuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    AppAuthProvider authProvider = Provider.of<AppAuthProvider>(context);

    return MaterialApp(
      title: 'Event Planning App',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: provider.getSelectedThemeMode(),
      debugShowCheckedModeBanner: false,

      locale: languageProvider.getSelectedLocale(),

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      restorationScopeId: authProvider.isLoggedInBefore()
          ? AppRoutes.HomeScreen.route
          : AppRoutes.LoginScreen.route,

      initialRoute: AppRoutes.OnBoardingScreen.route,
      routes: {
        AppRoutes.OnBoardingScreen.route: (context) => const OnBoardingScreen(),
        AppRoutes.IntroScreen.route: (context) => IntroScreen(),
        AppRoutes.LoginScreen.route: (context) => LoginScreen(),
        AppRoutes.RegisterScreen.route: (context) => RegisterScreen(),
        AppRoutes.ForgetPasswordScreen.route: (context) => ForgetPasswordScreen(),
        AppRoutes.HomeScreen.route: (context) => HomeScreen(),
        AppRoutes.AddEventScreen.route: (context) => AddEventScreen(),
        AppRoutes.MapTab.route: (context) => MapTab(),
        AppRoutes.FavTab.route: (context) => FavTab(),
        AppRoutes.ProfileTab.route: (context) => ProfileTab(),
      },
    );
  }
}
