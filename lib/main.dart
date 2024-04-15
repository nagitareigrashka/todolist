import 'package:flutter/material.dart';
import 'package:todolist/pages/home.dart';
import 'package:todolist/pages/main_screen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.deepOrangeAccent,
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => const MainScreen(),
    '/todo': (context) => const Home(),
  },
));
