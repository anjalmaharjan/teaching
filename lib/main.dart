import 'package:day_1/screen/dashboard_screen.dart';
import 'package:day_1/screen/first_screen.dart';
import 'package:day_1/screen/new_screen.dart';
import 'package:day_1/screen/second_screen.dart';
import 'package:day_1/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // named route
      routes: {
        "/first": (context) => const FirstScreen(value: ""),
        "/second": (context) => const SecondScreen(),
        "/splash": (context) => const SplashScreen(),
        "/dashboard": (context) => const DashboardScreen(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      home: const NewScreen(),
    );
  }
}
