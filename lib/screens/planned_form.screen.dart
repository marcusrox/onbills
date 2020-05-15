import 'package:flutter/material.dart';

class PlannedFormScreen extends StatefulWidget {
  final String subtitle;
  final String plannedId;

  PlannedFormScreen({Key key, this.subtitle = "Contas Planejadas", this.plannedId})
      : super(key: key);

  @override
  _PlannedFormScreenState createState() => _PlannedFormScreenState();
}

class _PlannedFormScreenState extends State<PlannedFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}