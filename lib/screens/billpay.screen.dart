import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onbills/models/bill.model.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:onbills/repositories/bills.repository.dart';
import 'package:onbills/utils/utils.dart';

class BillPayScreen extends StatefulWidget {
  final String subtitle;
  final String billId;

  BillPayScreen({Key key, this.subtitle = "Pagar conta", this.billId}) : super(key: key);

  @override
  _BillPayScreenState createState() => _BillPayScreenState();
}

class _BillPayScreenState extends State<BillPayScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _dueDateController = new TextEditingController();
  final TextEditingController _dueValueController = new TextEditingController();
  final TextEditingController _paidValueController = new TextEditingController();
  final TextEditingController _paidDateController = new TextEditingController();

  BillModel _bill = BillModel();

  @override
  void initState() {
    super.initState();

    print('Carregar os dados!');

    if (widget.billId != null) {
      _bill = BillModel(
          title: 'Dentista Lizzzz',
          dueDate: DateTime.now(),
          dueValue: 200.9,
          paidValue: null);
      
      // Colocar os valores formatados para interface nos controllers dos TextFormField
      _titleController.text = _bill.title;
      _dueDateController.text = Utils.datetimeToStr(_bill.dueDate);
      _dueValueController.text = Utils.doubleToStr(_bill.dueValue);
      _paidDateController.text = Utils.datetimeToStr(_bill.paidDate);
      _paidValueController.text = Utils.doubleToStr(_bill.paidValue);
    }
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
        _bill.id = Utils.uniqueKey();
        _bill.title = _titleController.text;
        _bill.dueDate = Utils.strToDateTime(_dueDateController.text);
        _bill.dueValue = Utils.strToDouble(_dueValueController.text);
        _bill.paidDate = Utils.strToDateTime(_paidDateController.text);
        _bill.paidValue = Utils.strToDouble(_paidValueController.text);
        //_bill.icon = _iconController.text;
        //_bill.paymentVoucher = _paymentVoucherController.text;

        BillsRepository().insert(_bill).then((value) {
          Get.snackbar(
            'Pagamento registrado',
            'Pagamento de conta registrada com sucesso!',
            icon: Icon(Icons.alarm),
            barBlur: 20,
          );
        }).catchError((error) {
          Get.snackbar(
            'Erro',
            error.toString(),
            icon: Icon(Icons.alarm),
            barBlur: 20,
          );
        });
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
                      DateTimeField(
                        controller: _dueDateController,
                        decoration: InputDecoration(
                          labelText: 'Data do vencimento',
                          icon: Icon(Icons.calendar_today),
                        ),
                        format: DateFormat("dd/MM/yyyy"),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                        validator: (value) {
                          if (value.toString().isEmpty)
                            return 'Informe a data que do vencimento programada';
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
                      DateTimeField(
                        controller: _paidDateController,
                        decoration: InputDecoration(
                          labelText: 'Data do pagamento',
                          icon: Icon(Icons.calendar_today),
                        ),
                        format: DateFormat("dd/MM/yyyy"),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                        validator: (value) {
                          if (value == null)
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
