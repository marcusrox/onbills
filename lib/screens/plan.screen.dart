import 'package:flutter/material.dart';
import 'package:onbills/widgets/OBBottomBar.dart';
//import 'package:onbills/widgets/OBDrawer.dart';

class PlanScreen extends StatelessWidget {
  final String subtitle;

  PlanScreen({Key key, this.subtitle = "Plano"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ' + this.toString());
    return Scaffold(
      appBar: AppBar(title: Text('OnBills - ' + subtitle)),
      body: Center(child: Text('Tela de planejamento')),
      //drawer: OBDrawer(),
      bottomNavigationBar: OBBottomBar(),
    );
  }
}