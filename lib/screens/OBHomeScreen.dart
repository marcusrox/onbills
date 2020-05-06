import 'package:flutter/material.dart';
import '../widgets/OBDrawer.dart';

class OBHomeScreen extends StatelessWidget {
  final String title;

  OBHomeScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Tela incial!')),
      drawer: OBDrawer(),
    );
  }
}