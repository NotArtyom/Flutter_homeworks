import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_homework/hw2.2/modular_app.dart';
import 'package:flut_homework/hw2.2/home_screen.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Homeworks',
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
          primaryColor: Colors.blue,
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.lightBlueAccent, secondary: Colors.white),
          appBarTheme: const AppBarTheme(elevation: 0)),
    ).modular();
  }
}
