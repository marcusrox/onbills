/*
JSON para gerar o código
{
    "title": "Conta de Luz",
    "dueDate": "2020-10-02",
    "dueValue": 123.51,
    "paidDate": ""
    "paidValue": 0.0
}

ATENÇÂO: NÂO ALTERAR O CODIGO ABAIXO. 
ALTERAR O JSON ACIMA USAR O GERADOR EM 
https://javiercbk.github.io/json_to_dart/
*/

import 'imodel.dart';

class BillModel implements IModel {
  String title;
  DateTime dueDate;
  double dueValue;
  DateTime paidDate;
  double paidValue;
  String icon;
  String paymentVoucher;

  BillModel(
      {this.title,
      this.dueDate,
      this.dueValue,
      this.paidDate,
      this.paidValue,
      this.icon,
      this.paymentVoucher});

  BillModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    //dueDate = json['dueDate'];
    dueDate = DateTime.parse(json['dueDate']);
    dueValue = json['dueValue'];
    paidDate = DateTime.parse(json['paidDate']);
    paidValue = json['paidValue'];
    icon = json['icon'];
    paymentVoucher = json['paymentVoucher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    //data['dueDate'] = this.dueDate;
    data['dueDate'] = this.dueDate.toString();
    data['dueValue'] = this.dueValue;
    data['paidDate'] = this.paidDate.toString();
    data['paidValue'] = this.paidValue;
    data['icon'] = this.icon;
    data['paymentVoucher'] = this.paymentVoucher;
    return data;
  }
}
