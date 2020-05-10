import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static String monthName(int monthNumber) {
    String month;
    switch (monthNumber) {
      case 1:
        month = "Janeiro";
        break;
      case 2:
        month = "Fevereiro";
        break;
      case 3:
        month = "Março";
        break;
      case 4:
        month = "Abril";
        break;
      case 5:
        month = "Maio";
        break;
      case 6:
        month = "Junho";
        break;
      case 7:
        month = "Julho";
        break;
      case 8:
        month = "Agosto";
        break;
      case 9:
        month = "Setembro";
        break;
      case 10:
        month = "Outubro";
        break;
      case 11:
        month = "Novembro";
        break;
      case 12:
        month = "Dezembro";
        break;
    }
    return month;
  }

  static Map<String, IconData> iconMapping = {
    'today': Icons.today,
    'toys': Icons.toys,
    'home': Icons.home,
    'audiotrack': Icons.audiotrack,
  };

  static Widget icon(String name) {
    return Icon(iconMapping[name]);
  }

  static double strToDouble(String strNum) {
    if (strNum == null) return null;
    return double.tryParse(strNum.replaceAll(',', '.'));
  }

  static String doubleToStr(double num) {
    if (num == null) return '';
    NumberFormat formatter = NumberFormat("0.00");
    return formatter
        .format(num)
        .replaceFirst('.', ','); // num.toStringAsPrecision(2);
  }

  // Recebe data em formato BR '20/12/2020' e retorna objeto DateTime
static DateTime strToDateTime(String txtDateTime) {
    //print("---------> txtDateTime: " + txtDateTime);
    if (txtDateTime == null) return null;
    String strDateISO = txtDateTime.substring(6, 10) + '-' +
        txtDateTime.substring(3, 5) + '-' +
        txtDateTime.substring(0, 2);
    //print("----------> strDateISO: " + strDateISO);
    DateTime dt = DateTime.tryParse(strDateISO);
    return dt;
}

  static String datetimeToStr(DateTime dt) {
    if (dt == null) return '';
    var formatter = new DateFormat('dd/MM/yyyy');
    return formatter.format(dt);
  }

  static String uniqueKey() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
