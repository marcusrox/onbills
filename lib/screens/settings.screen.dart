import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onbills/repositories/database_helper.dart';
import 'package:onbills/utils/dialogs.dart';
import 'package:onbills/widgets/ob_bottom_bar.dart';

class SettingsScreen extends StatelessWidget {
  final String subtitle;

  SettingsScreen({Key key, this.subtitle = "Ajustes"}) : super(key: key);

  void _excluirDados(BuildContext context) async {

    final ConfirmAction action = await asyncConfirmDialog(context, 'Deseja realmente excluir?');
    print("Confirm Action $action");

    if (action == ConfirmAction.Yes) {
      DatabaseHelper.instance.destroyDatabase();
      Get.snackbar(
        'Excluir dados',
        'Banco de dados excluído sucesso!',
        icon: Icon(Icons.alarm),
        barBlur: 20,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ' + this.toString());
    return Scaffold(
      appBar: AppBar(title: Text('OnBills - ' + subtitle)),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Text('Excluir todos os dados deste celular'),
            RaisedButton(
              child: Text('Excluir dados'),
              onPressed: () {
                _excluirDados(context);
              },
            ),
          ],
        ),
      ),
      //drawer: OBDrawer(),
      bottomNavigationBar: OBBottomBar(),
    );
  }
}
