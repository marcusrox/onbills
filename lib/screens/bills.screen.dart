import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:onbills/models/bill.model.dart';
import 'package:onbills/utils/utils.dart';
import 'package:onbills/widgets/OBBottomBar.dart';
import 'package:intl/intl.dart';

class BillsScreen extends StatefulWidget {
  final String subtitle;

  BillsScreen({Key key, this.subtitle = "Contas do Mês"}) : super(key: key);

  @override
  _BillsScreenState createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  DateTime selectedDate = DateTime.now();
  List bills = [
    BillModel(title: 'Conta de Luz', dueDay: 1, dueValue: 100.9, paidValue: 100.9),
    BillModel(title: 'Condomínio', dueDay: 1, dueValue: 30.9, paidValue: 0.0),
    BillModel(title: 'VIVO - Internet e TV', dueDay: 1, dueValue: 600.1, paidValue: 0.0),
    BillModel(title: 'Escola Sempre Viva', dueDay: 5, dueValue: 700.9, paidValue: 0.0),
    BillModel(title: 'Cartão BB', dueDay: 5, dueValue: 10.2, paidValue: 0.0),
    BillModel(title: 'Cartão Nubank', dueDay: 10, dueValue: 200.9, paidValue: 0.0),
    BillModel(title: 'Boleto Formatura Vini', dueDay: 10, dueValue: 200.9, paidValue: 0.0),
    BillModel(title: 'Ofertas e Provisões', dueDay: 10, dueValue: 200.9, paidValue: 0.0),
    BillModel(title: 'Cartão Anne', dueDay: 15, dueValue: 200.9, paidValue: 0.0),
    BillModel(title: 'BahiaGás', dueDay: 15, dueValue: 200.9, paidValue: 0.0),
    BillModel(title: 'Dentista Liz', dueDay: 15, dueValue: 200.9, paidValue: 0.0),
  ]; 
  

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.

    return showDatePicker(
      context: context,
      //initialDatePickerMode: DatePickerMode.year,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

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

    //var order = await getDate();
    //print(order);
  }

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ' + this.toString());
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: <Widget>[
          Expanded(child: Text('OnBills - ' + widget.subtitle)),
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
              Utils.monthName(selectedDate.month) +
                  ' de ' +
                  selectedDate.year.toString(),
              style: TextStyle(fontSize: 26.0),
            ),
          ),
          Flexible(
            /* É necessário colocar o Flexible para o ListView.builder funcionar dentro de um Column*/
            child: ListView.builder(
              itemCount: bills.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 40,
                  ),
                  title: Text(bills[index].title),
                  subtitle: Text('Vence em ' + bills[index].dueDay.toString().padLeft(2, '0')  + ' - ' + 
                                 NumberFormat.currency(locale: 'pt').format(bills[index].dueValue)), // 
                  trailing: Icon(Icons.keyboard_arrow_right),
                  //trailing: Utils.icon('today'),
                  onTap: () {
                    print('Clicou no Tile');
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
          // Add your onPressed code here!
          setState(() {
            bills.add(BillModel(title: 'Teste XX', dueDay: 1, dueValue: 100.9, paidValue: 100.9));
          });
        },
        child: Icon(Icons.add),
        //backgroundColor: Colors.green,
      ),
    );
  }
}
