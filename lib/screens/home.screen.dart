import 'package:flutter/material.dart';
import 'package:onbills/widgets/ob_bottom_bar.dart';
//import 'package:onbills/widgets/OBDrawer.dart';

class HomeScreen extends StatelessWidget {
  final String subtitle;

  HomeScreen({Key key, this.subtitle = "Principal" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ${this}');
    return Scaffold(
      appBar: AppBar(title: Text('OnBills - $subtitle')),
      body: Center(child: Text('Tela incial!!!')),
      //drawer: OBDrawer(),
      bottomNavigationBar: OBBottomBar(),
    );
  }
}