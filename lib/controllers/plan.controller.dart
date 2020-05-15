import 'package:flutter/material.dart';
import 'package:onbills/models/planned.model.dart';
import 'package:onbills/repositories/planned.repository.dart';
import 'package:onbills/screens/planned.screen.dart';


class PlanController {
  final _formKey = GlobalKey<FormState>();
  final PlannedScreen screen;
  final PlannedRepository _repo = PlannedRepository();
  List<PlannedModel> planned;

  PlanController({this.screen}); 
    
  void carregarDados() async {
    planned = await _repo.getAll();
    print ("DEBUG: Dados carregados: " + planned.toString());
  }

    
}