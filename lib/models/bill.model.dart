/*
JSON para gerar o código
{
    "title": "Conta de Luz",
    "dueDay": 1,
    "month": 5,
    "year": 2020,
    "dueValue": 123.51,
    "paidValue": 0
}

ATENÇÂO: NÂO ALTERAR O CODIGO ABAIXO. 
ALTERAR O JSON ACIMA USAR O GERADOR EM 
https://javiercbk.github.io/json_to_dart/
*/

import 'imodel.dart';

class BillModel implements IModel {
  String title;
  int dueDay;
  int month;
  int year;
  double dueValue;
  double paidValue;

  BillModel(
      {this.title,
      this.dueDay,
      this.month,
      this.year,
      this.dueValue,
      this.paidValue});

  BillModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    dueDay = json['dueDay'];
    month = json['month'];
    year = json['year'];
    dueValue = json['dueValue'];
    paidValue = json['paidValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['dueDay'] = this.dueDay;
    data['month'] = this.month;
    data['year'] = this.year;
    data['dueValue'] = this.dueValue;
    data['paidValue'] = this.paidValue;
    return data;
  }
}
