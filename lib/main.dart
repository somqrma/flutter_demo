
import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'package:csslib/parser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final fontStyle = FontStyle.italic;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        primarySwatch: Colors.blue,
        applyElevationOverlayColor: true,
        // textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.red))
      ),
      home: const MyHomePage(title: 'My Customers'),
    );
  }
}
