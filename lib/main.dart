import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_em/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MaterialColor mycolor = const MaterialColor(
    0xFFe4ba4c,
    <int, Color>{
      50: Color(0xFFe4ba4c),
      100: Color(0xFFe4ba4c),
      200: Color(0xFFe4ba4c),
      300: Color(0xFFe4ba4c),
      400: Color(0xFFe4ba4c),
      500: Color(0xFFe4ba4c),
      600: Color(0xFFe4ba4c),
      700: Color(0xFFe4ba4c),
      800: Color(0xFFe4ba4c),
      900: Color(0xFFe4ba4c),
    },
  );
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: mycolor),
      home: const HomePage(),
    );
  }
}
