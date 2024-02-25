import 'package:flutter/material.dart';
import 'package:todolist/pages/home.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.deepOrangeAccent,
  ),
  home: const Home(),
));
