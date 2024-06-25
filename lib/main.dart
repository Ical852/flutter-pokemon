import 'package:flutter/material.dart';
import 'package:flutterpokemon/screens/detail_pages/detail_page.dart';
import 'package:flutterpokemon/screens/main_pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "/detail": (context) => DetailPage()
      },
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text("Unknown Route")),
            body: Center(child: Text("Unknown Route")),
          ),
        );
      },
    );
  }
}
