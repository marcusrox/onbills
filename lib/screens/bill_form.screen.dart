import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:onbills/models/bill.model.dart';
import 'package:onbills/screens/bills.screen.dart';
import 'package:onbills/repositories/bills.repository.dart';
import 'package:onbills/utils/utils.dart';

class BillFormScreen extends StatefulWidget {
  final String subtitle;
  final String billId;

  BillFormScreen({Key key, this.subtitle = "Pagar conta", this.billId})
      : super(key: key);

  @override
  _BillFormScreenState createState() => _BillFormScreenState();
}

class _BillFormScreenState extends State<BillFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _dueValueController = TextEditingController();
  final _paidValueController = TextEditingController();
  final _paidDateController = TextEditingController();

  BillModel _bill = BillModel();

  @override
  void initState() {
    super.initState();
    print('Carregar os dados!');
    if (widget.billId != null) {
       _carregarDados();
    }
  }

  @override
  void dispose() {
    // limpa o no focus quando o form for liberado.
    print("DEBUG: Rodou dispose() em ${this}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Rodou build() em ${this}');
   
    return Scaffold(
      appBar: AppBar(title: Text('OnBills - ${widget.subtitle}')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _getFieldTitle(),
                        _getFieldDueValue(),
                        _getFieldDueDate(),
                        _getFieldPaidValue(),
                        _getFieldPaidDate(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30,
                  ),
                  onPressed: _deleteBill,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 8.0),
                    alignment: Alignment.centerRight,
                    //color: Colors.blue,
                    child: RaisedButton(
                      child: Text("REGISTRAR"),
                      onPressed: _submitForm,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      //drawer: OBDrawer(),
      //bottomNavigationBar: OBBottomBar(),
    );
  }

  void _carregarDados() async {
    _bill = await BillsRepository().get(widget.billId);

    // Colocar os valores formatados para interface nos controllers dos TextFormField
    //_titleController.text = _bill.title;
    _dueDateController.text = Utils.datetimeToStr(_bill.dueDate);
    _dueValueController.text = Utils.doubleToStr(_bill.dueValue);
    _paidDateController.text = Utils.datetimeToStr(_bill.paidDate);
    _paidValueController.text = Utils.doubleToStr(_bill.paidValue);
  }

  void _deleteBill() {
    if (widget.billId != null) {
      BillsRepository().delete(_bill.id).then((value) {
        Get.snackbar(
          'Conta excluída',
          'Conta excluída com sucesso!',
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

      Get.off(BillsScreen(), duration: Duration.zero);
    }
  }

  void _submitForm() {
    print('_submitForm');

    if (_formKey.currentState.validate()) {
      if (widget.billId == null) {
        _bill.id = Utils.uniqueKey();
      }
      //_bill.title = _titleController.text;
      _bill.dueDate = Utils.strToDateTime(_dueDateController.text);
      _bill.dueValue = Utils.strToDouble(_dueValueController.text);
      _bill.paidDate = Utils.strToDateTime(_paidDateController.text);
      _bill.paidValue = Utils.strToDouble(_paidValueController.text);
      //_bill.icon = _iconController.text;
      //_bill.paymentVoucher = _paymentVoucherController.text;

      // O método abaixo tem a capacidade de atualizar o registro se o ID já existir ou criar caso negativo
      BillsRepository().insert(_bill).then((value) {
        Get.snackbar(
          'Conta atualizada',
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
      //Get.back();
      Get.off(BillsScreen(), duration: Duration.zero);
    }
  }

  Widget _getFieldTitle() {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: _bill.title,
      controller: _titleController,
      decoration: InputDecoration(
        labelText: 'Título da conta',
        icon: Icon(Icons.description),
      ),
      validator: (value) {
        if (value.isEmpty) return 'Digite o título para a conta';
        return null;
      },
    );
  }

  Widget _getFieldDueValue() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _dueValueController,
      //autofocus: true,
      decoration: InputDecoration(
        labelText: 'Valor devido',
        icon: Icon(Icons.monetization_on),
      ),
      validator: (value) {
        if (value.isEmpty) return 'Digite o valor devido para esta conta';
        return null;
      },
    );
  }

  Widget _getFieldDueDate() {
    return DateTimeField(
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
        if (value.toString().isEmpty) {
          return 'Informe a data que do vencimento programada';
        }
        return null;
      },
    );
  }

  Widget _getFieldPaidValue() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _paidValueController,
      //autofocus: true,
      decoration: InputDecoration(
        labelText: 'Valor pago',
        icon: Icon(Icons.monetization_on),
      ),
      validator: (value) {
        if (value.isEmpty) return 'Digite o valor pago para esta conta';
        return null;
      },
    );
  }

  Widget _getFieldPaidDate() {
    return DateTimeField(
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
        if (value == null) {
          return 'Informe a data que o pagamento foi realizado';
        }
        return null;
      },
    );
  }
}
