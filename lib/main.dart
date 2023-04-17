import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsapp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: NewsApp(), // home: SafeArea(child: Text("Hello")),
  ));
}
