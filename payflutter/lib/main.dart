import 'package:flutter/material.dart';
import 'package:payflutter/widgets/dashboard.dart';
import 'package:payflutter/widgets/home_page.dart';
import 'package:payflutter/widgets/register.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Dashboard(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        Dashboard.routeName: (context) => Dashboard(),
      },
    );
  }
}
