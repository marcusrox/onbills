import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/OBBillsScreen.dart';

class OBDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Cabeçalho'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Contas do Mês'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              print('Vai para OBBillsScreen');
              Get.to(OBBillsScreen(title: 'Contas do mês'));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Planejamento'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

