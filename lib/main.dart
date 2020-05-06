import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/OBHomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'OnBills';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: OBHomeScreen(title: appTitle),
    );
  }
}




