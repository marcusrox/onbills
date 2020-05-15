import 'package:flutter/material.dart';
import 'package:onbills/controllers/planned_form.controller.dart';

class PlannedFormScreen extends StatefulWidget {
  final String subtitle;
  final String plannedId;

  PlannedFormScreen({Key key, this.subtitle = "Contas Planejadas", this.plannedId})
      : super(key: key);

  @override
  _PlannedFormScreenState createState() => _PlannedFormScreenState();
}

class _PlannedFormScreenState extends State<PlannedFormScreen> {
  PlannedFormController controller;
  final Map<String, dynamic> formData = {}; 

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _dueDayController = new TextEditingController();
  TextEditingController _dueValueController = new TextEditingController();
   
  @override
  void initState() {
    super.initState();
    controller = PlannedFormController(screen: widget);
    print('Carregar os dados!');
    if (widget.plannedId != null) {
      controller.carregarDados();
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

    return Scaffold(
      appBar: AppBar(title: Text('OnBills - ' + widget.subtitle)),
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
                    key: controller.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _getFieldTitle(),
                        _getFieldDueValue(),                        
                        _getFieldDueDay(),
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
                  onPressed: controller.deletePlanned,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 8.0),
                    alignment: Alignment.centerRight,
                    //color: Colors.blue,
                    child: RaisedButton(
                      child: Text("REGISTRAR"),
                      onPressed: controller.submitForm,
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


  Widget _getFieldTitle() {
    return TextFormField(
      keyboardType: TextInputType.text,
      //initialValue: _bill.title,
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

  Widget _getFieldDueDay() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _dueDayController,
      decoration: InputDecoration(
        labelText: 'Dia de vencimento',
        icon: Icon(Icons.calendar_today),
      ),
      validator: (value) {
        if (value.isEmpty) return 'Digite o dia para vencimento da conta';
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
        labelText: 'Valor previsto',
        icon: Icon(Icons.monetization_on),
      ),
      validator: (value) {
        if (value.isEmpty) return 'Digite o valor previsto para esta conta';
        return null;
      },
    );
  }


}
