import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:onbills/models/bill.model.dart';
import 'package:onbills/repositories/bills.repository.dart';
import 'package:onbills/utils/utils.dart';
import 'package:onbills/widgets/ob_bottom_bar.dart';
import 'package:intl/intl.dart';

import 'bill_form.screen.dart';

class BillsScreen extends StatefulWidget {
  final String subtitle;

  BillsScreen({Key key, this.subtitle = "Contas do Mês"}) : super(key: key);

  @override
  _BillsScreenState createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  DateTime selectedDate = DateTime.now();
  List<BillModel> bills;

  void onSelectMonth() async {
    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: selectedDate ?? DateTime.now(),
      locale: Locale("pt"),
    ).then((date) {
      if (date != null) {
        setState(() {
          selectedDate = date;
          // Carregar a lista das contas do mês
        });
      }
    });

  }

  void _carregarDados() async {
    BillsRepository br = BillsRepository();
    bills = await br.getAll();
    setState((){});
    print ("DEBUG: Dados carregados: $bills");
  }

  @override
  void initState () {
    super.initState();
    // Carregar os dados
    print('Carregar os dados!');
    
    _carregarDados();
    
  }

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ${this}');
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: <Widget>[
          Expanded(child: Text('OnBills - ${widget.subtitle}')),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: onSelectMonth,
          ),
        ],
      )),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10),
            //padding: EdgeInsets.all(10),
            //child: Text('Mês ' + selectedDate.month.toString(), style: TextStyle(fontSize: 26.0,))
            child: Text(
              "${Utils.monthName(selectedDate.month)} de ${selectedDate.year.toString()}",
              style: TextStyle(fontSize: 26.0),
            ),
          ),
          Flexible(
            /* É necessário colocar o Flexible para o ListView.builder funcionar dentro de um Column*/
            child: ListView.builder(
              itemCount: bills?.length ?? 0,
              itemBuilder: (context, index) {
                var subtitle = 'Vence em ${bills[index].dueDate.day.toString().padLeft(2, '0')} - ${NumberFormat.currency(locale: 'pt').format(bills[index].dueValue)}';
                return ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 40,
                  ),
                  title: Text(bills[index].title),
                  subtitle: Text(subtitle), // 
                  trailing: Icon(Icons.keyboard_arrow_right),
                  //trailing: Utils.icon('today'),
                  onTap: () {
                    print('Clicou no Tile');

                    Get.to(BillFormScreen(subtitle: 'Pagar!', billId: bills[index].id), duration: Duration.zero);
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
          Get.to(BillFormScreen(subtitle: 'Adicionar conta'), duration: Duration.zero);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
