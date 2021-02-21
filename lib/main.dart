import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Color(0XFF0000)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0XFF0A0E21),
          scaffoldBackgroundColor: Color(0XFF0A0E21)),
      home: HomePage(),
    );
  }
}
