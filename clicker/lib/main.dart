import 'package:flutter/material.dart';
import 'package:clicker/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Autostopper",
      home: HomeScreen(),
    );
  }
}
