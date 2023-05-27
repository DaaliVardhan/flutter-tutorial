import 'package:flutter/material.dart';
import 'package:tut1/views/login.dart';
import 'package:tut1/views/register.dart';
import 'package:tut1/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: "Flutter App",
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      useMaterial3: true,
    ),
    home: const HomeView(),
  ));
}
