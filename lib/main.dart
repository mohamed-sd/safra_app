import 'package:flutter/material.dart';
import 'package:safra_app/login.dart';
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home.dart';

void main() {
  runApp(SafraApp());
}

class SafraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      title: 'سفرة',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Arial',
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 130, 191),
      body: Center(
        child: Container(
            width: double.infinity,
            height: 400,
            child: Image.asset('assets/splash.jpg'))
      ),
    );
  }
}


