
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
          primarySwatch: Colors.blue,
          applyElevationOverlayColor: true,
          textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.red))),
      home: const MyHomePage(title: 'My Customers'),
    );
  }
}
