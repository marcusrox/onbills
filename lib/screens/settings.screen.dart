import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onbills/repositories/DatabaseHelper.dart';
import 'package:onbills/widgets/OBBottomBar.dart';

class SettingsScreen extends StatelessWidget {
  final String subtitle;

  SettingsScreen({Key key, this.subtitle = "Ajustes"}) : super(key: key);

  void _excluirDados() {
    DatabaseHelper.instance.destroyDatabase();
    Get.snackbar(
      'Excluir dados',
      'Banco de dados excluído sucesso!',
      icon: Icon(Icons.alarm),
      barBlur: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ' + this.toString());
    return Scaffold(
      appBar: AppBar(title: Text('OnBills - ' + subtitle)),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text('Excluir dados'),
            onPressed: () {
              _excluirDados();
            },
          ),
        ],
      ),
      //drawer: OBDrawer(),
      bottomNavigationBar: OBBottomBar(),
    );
  }
}
