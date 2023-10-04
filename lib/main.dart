import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.yellow,
          elevation: 0,
        ),
        primaryColor: Colors.yellow,
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow[50],
      ),
      home: const HomePage(),
    );
  }
}
