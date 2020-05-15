
import 'package:onbills/repositories/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class BaseRepository {
  String tableName;

  BaseRepository({this.tableName});
  //List<IModel> getAll();

  //IModel get(String id);
//  Future<T> get(String id);
  
  Future<List<Map<String, dynamic>>> getAllMap() async {
    // Get a reference to the database.
    final Database db = await DatabaseHelper.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps;
  }  
  
  Future<Map<String, dynamic>> getMap(String id) async {
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName, where: 'id = ?', whereArgs: [id]);
    return maps[0];
  }

  // Esse método usa uma consulta bruta para fornecer a contagem de linhas.
  Future<int> rowCount() async {
    Database db = await DatabaseHelper.instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM ' + tableName));
  }

  Future<int> insertMap(Map<String, dynamic> map) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert(tableName, map,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Assumimos aqui que a coluna id no mapa está definida. Os outros
  // valores das colunas serão usados para atualizar a linha.
  Future<int> updateMap(Map<String, dynamic> map) async {
    Database db = await DatabaseHelper.instance.database;
    return await db
        .update(tableName, map, where: 'id = ?', whereArgs: map['id']);
  }

  // Exclui a linha especificada pelo id. O número de linhas afetadas é
  // retornada. Isso deve ser igual a 1, contanto que a linha exista.
  Future<int> delete(String id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
 
}