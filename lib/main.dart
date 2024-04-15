import 'package:flutter/material.dart';
import 'package:todolist/pages/home.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.deepOrangeAccent,
  ),
  home: const Home(),
));
