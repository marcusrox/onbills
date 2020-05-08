import 'package:flutter/material.dart';
import 'package:onbills/widgets/OBBottomBar.dart';

class SettingsScreen extends StatelessWidget {
  final String subtitle;
  
  SettingsScreen({Key key, this.subtitle = "Ajustes"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ' + this.toString());
    return Scaffold(
      appBar: AppBar(title: Text('OnBills - ' + subtitle)),
      body: Center(child: Text('Tela de ajustes')),
      //drawer: OBDrawer(),
      bottomNavigationBar: OBBottomBar(),
    );
  }
}