import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:onbills/controllers/planned.controller.dart';
import 'package:onbills/screens/planned_form.screen.dart';
import 'package:onbills/widgets/ob_bottom_bar.dart';

class PlannedScreen extends StatefulWidget {
  final String subtitle;

  PlannedScreen({Key key, this.subtitle = "Plano de Contas"}) : super(key: key);

  @override
  _PlannedScreenState createState() => _PlannedScreenState();
}

class _PlannedScreenState extends State<PlannedScreen> {

  PlannedController controller;

  @override
  void initState() {
    super.initState();
    controller = PlannedController(screen: widget);
  }

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ' + this.toString());
    return Scaffold(
      appBar: AppBar(
          title: Text('OnBills - ' + widget.subtitle),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10),
            child: Text('Defina as contas que você precisa pagar todos os meses'),
          ),
          Flexible(
            /* É necessário colocar o Flexible para o ListView.builder funcionar dentro de um Column*/
            child: ListView.builder(
              itemCount: controller.planned?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 40,
                  ),
                  title: Text(controller.planned[index].title),
                  subtitle: Text('Vence em ' + controller.planned[index].dueDay.toString().padLeft(2, '0')  + ' - ' + 
                                 NumberFormat.currency(locale: 'pt').format(controller.planned[index].dueValue)), // 
                  trailing: Icon(Icons.keyboard_arrow_right),
                  //trailing: Utils.icon('today'),
                  onTap: () {
                    print('Clicou no Tile');

                    Get.to(PlannedFormScreen(subtitle: 'Pagar!', plannedId: controller.planned[index].id), duration: Duration.zero);
                  }, 
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: OBBottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(PlannedFormScreen(subtitle: 'Adicionar conta planejada'), duration: Duration.zero);
        },
        child: Icon(Icons.add),
      ),
    );
  }

}