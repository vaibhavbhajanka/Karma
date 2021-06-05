import 'package:flutter/material.dart';
import 'package:karma_app/Screens/LoginScreen.dart';
import 'package:karma_app/Screens/KarmaDriveScreen.dart';
import 'package:karma_app/Screens/ProfileScreen.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/second':(context) => KarmaDriveScreen(),
        '/third':(context) => ProfileScreen(),
      },
    );
  }
}
