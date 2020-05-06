import 'package:flutter/material.dart';
import 'package:onbills/widgets/OBDrawer.dart';

class OBBillsScreen extends StatelessWidget {
  final String title;

  OBBillsScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Tela de contas do Mês!')),
      drawer: OBDrawer(),
    );
  }
}