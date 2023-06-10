import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0a0321),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: Color(0xff0a0321),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
