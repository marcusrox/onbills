import 'dart:async';
import 'package:onbills/models/planned.model.dart';
import 'package:onbills/repositories/base.repository.dart';

class PlannedRepository extends BaseRepository {
  PlannedRepository() : super(tableName: 'planned');
  
  Future<List<PlannedModel>> getAll() async {
    List<Map<String, dynamic>> maps = await getAllMap();

    // Converter o List<Map<String, dynamic> em um List<PlannedModel>
    return List.generate(maps.length, (i) {
      return PlannedModel.fromJson(maps[i]);
    });
  }

  // Obter registro., Recebo o ID e obtenho um MP do BaseRepository get. Devolvo um Model
  Future<PlannedModel> get(String id) async {
    Map<String, dynamic> map = await getMap(id);
    return PlannedModel.fromJson(map);
  }
 
  // Inserir novo retistro. Recebo Model e envio um Map para BaseRepository.insertMap
  Future<int> insert(PlannedModel planned) async {
      Map<String, dynamic> map = planned.toJson();
      return insertMap(map);
  }

  // Assumimos aqui que a coluna id no mapa está definida. Os outros
  // valores das colunas serão usados para atualizar o registro.
  Future<int> update(PlannedModel planned) async {
      Map<String, dynamic> map = planned.toJson();
      return updateMap(map);
  }

}
