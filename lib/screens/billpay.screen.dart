import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onbills/models/bill.model.dart';
//import 'package:onbills/widgets/OBBottomBar.dart';

class BillPayScreen extends StatefulWidget {
  final String subtitle;

  BillPayScreen({Key key, this.subtitle = "Pagar conta"}) : super(key: key);

  @override
  _BillPayScreenState createState() => _BillPayScreenState();
}

class _BillPayScreenState extends State<BillPayScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _dueDateController = new TextEditingController();
  final TextEditingController _dueValueController = new TextEditingController();
  final TextEditingController _paidValueController =
      new TextEditingController();
  final TextEditingController _paidDateController = new TextEditingController();

  BillModel _bill;

  @override
  void initState() {
    super.initState();
    print('Carregar os dados!');

    _bill = BillModel(
        title: 'Dentista Lizzzz',
        dueDate: DateTime.now(),
        dueValue: 200.9,
        paidValue: 0.0);

    //_bill.title = "Teste";
    _titleController.text = _bill.title;
    _dueDateController.text = _bill.dueDate.toString();
    _dueValueController.text = _bill.dueValue.toString();
    _paidDateController.text = _bill.paidDate.toString();
    _paidValueController.text = _bill.paidValue.toString();
  }

  @override
  void dispose() {
    // limpa o no focus quando o form for liberado.
    print('DEBUG: Rodou dispose() em ' + this.toString());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ' + this.toString());

    void _submitForm() {
      print('_submitForm');

      if (_formKey.currentState.validate()) {
        _bill.title = _titleController.text;
        _bill.dueDate = DateTime.tryParse(_dueDateController.text);
        _bill.dueValue = double.tryParse(_dueValueController.text);
        _bill.paidDate = DateTime.tryParse(_paidDateController.text);
        _bill.paidValue = double.tryParse(_paidValueController.text);
        //_bill.icon = _iconController.text;
        //_bill.paymentVoucher = _paymentVoucherController.text;
        Get.snackbar(
          'Pagamento registrado',
          '_submitForm: ' + _bill.toJson().toString(),
          icon: Icon(Icons.alarm),
          barBlur: 20,
        );

        print(_bill.toJson());
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('OnBills - ' + widget.subtitle)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        //initialValue: _bill.title,
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Título da conta',
                          icon: Icon(Icons.description),
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Digite o título para a conta';
                          return null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _dueValueController,
                        //autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'Valor devido',
                          icon: Icon(Icons.monetization_on),
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Digite o valor devido para esta conta';
                          return null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        controller: _dueDateController,
                        decoration: InputDecoration(
                          labelText: 'Data do vencimento',
                          icon: Icon(Icons.calendar_today),
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Informe a data do vencimento desta conta';
                          return null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _paidValueController,
                        //autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'Valor pago',
                          icon: Icon(Icons.monetization_on),
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Digite o valor pago para esta conta';
                          return null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        controller: _paidDateController,
                        decoration: InputDecoration(
                          labelText: 'Data do pagamento',
                          icon: Icon(Icons.calendar_today),
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Informe a data que o pagamento foi realizado';
                          return null;
                        },
                      ),
                      RaisedButton(
                        child: Text("REGISTRAR"),
                        onPressed: _submitForm,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      //drawer: OBDrawer(),
      //bottomNavigationBar: OBBottomBar(),
    );
  }
}
