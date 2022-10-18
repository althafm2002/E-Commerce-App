import 'package:ecommerse/screens/authentication/controller/screen_forgetpassword.dart';
import 'package:ecommerse/screens/authentication/controller/screen_login_provider.dart';
import 'package:ecommerse/screens/authentication/controller/screen_registration_provider.dart';
import 'package:ecommerse/screens/bottomnavigation/controller/bottom_nav_provider.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/splash/controller/screen_splash_provider.dart';
import 'package:ecommerse/screens/splash/view/screen_spalsh.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScreenLoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScreenRegistrationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScreenForgetPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScreenSplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScreenHomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}