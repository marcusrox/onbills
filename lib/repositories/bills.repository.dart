import 'dart:async';
import 'package:onbills/repositories/base.repository.dart';
import 'package:onbills/models/bill.model.dart';

class BillsRepository extends BaseRepository {
  BillsRepository() : super(tableName: 'bills');
  
  Future<List<BillModel>> getAll() async {
    List<Map<String, dynamic>> maps = await getAllMap();

    // Converter o List<Map<String, dynamic> em um List<BillModel>
    return List.generate(maps.length, (i) {
      return BillModel.fromJson(maps[i]);
    });
  }

  // Obter registro., Recebo o ID e obtenho um MP do BaseRepository get. Devolvo um BillModel
  Future<BillModel> get(String id) async {
    Map<String, dynamic> map = await getMap(id);
    return BillModel.fromJson(map);
  }
 
  // Inserir novo retistro. Recebo BillModel e envio um Map para BaseRepository.insertMap
  Future<int> insert(BillModel bill) async {
      Map<String, dynamic> map = bill.toJson();
      return insertMap(map);
  }

  // Assumimos aqui que a coluna id no mapa está definida. Os outros
  // valores das colunas serão usados para atualizar a linha.
  Future<int> update(BillModel bill) async {
      Map<String, dynamic> map = bill.toJson();
      return updateMap(map);
  }

}
