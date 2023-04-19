import 'package:flutter/material.dart';
import 'common/auth/authservice.dart';
import 'common/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      initialRoute:
          AuthService().currentUser != null ? Routes.home : Routes.login,
      routes: Routes.routes,
    );
  }
}
