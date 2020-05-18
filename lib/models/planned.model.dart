/*
JSON para gerar o código
{
    "title": "Conta de Luz",
    "dueDay": 30,
    "dueValue": 123.51,
    "icon" "teste"
}

ATENÇÂO: NÂO ALTERAR O CODIGO ABAIXO. 
ALTERAR O JSON ACIMA USAR O GERADOR EM 
https://javiercbk.github.io/json_to_dart/
*/

import 'imodel.dart';

class PlannedModel implements IModel {
  String id;
  String title;
  int dueDay;
  double dueValue;
  String icon;

  PlannedModel({
      this.id,
      this.title,
      this.dueDay,
      this.dueValue,
      this.icon,
  });

  PlannedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    dueDay = json['dueDay'];
    dueValue = json['dueValue'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['dueDay'] = dueValue.toString();
    data['dueValue'] = dueValue.toString();
    data['icon'] = icon;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }

}
