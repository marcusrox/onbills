import 'package:flutter/material.dart';
import 'package:onbills/models/planned.model.dart';
import 'package:onbills/repositories/planned.repository.dart';
import 'package:onbills/screens/planned_form.screen.dart';

class PlannedFormController {
  final formKey = GlobalKey<FormState>();
  final PlannedFormScreen screen;
  final PlannedRepository _repo = PlannedRepository();
  PlannedModel planned;

  PlannedFormController({this.screen});

  void carregarDados() async {
    print('carregarDados');
  }

  void deletePlanned() async {
    print('deletePlanned');
  }

  void submitForm() {
    print('submitForm');
  }

/*

  void _carregarDados() async {
    _bill = await BillsRepository().get(widget.billId);

    // Colocar os valores formatados para interface nos controllers dos TextFormField
    _titleController.text = _bill.title;
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
      _bill.title = _titleController.text;
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
  */

}
