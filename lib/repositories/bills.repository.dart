import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:onbills/models/bill.model.dart';

import 'DatabaseHelper.dart';

class BillsRepository {

  Future<List<BillModel>> getAll() async {
    // Get a reference to the database.
    final Database db = await DatabaseHelper.instance.database;

    // Query the table.
    final List<Map<String, dynamic>> maps = await db.query('bills');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return BillModel.fromJson(maps[i]);
    });
  }

  // Esse método usa uma consulta bruta para fornecer a contagem de linhas.
  Future<int> rowCount() async {
    Database db = await DatabaseHelper.instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM bills'));
  }

  Future<BillModel> get(String id) async {
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('bills', where: 'id = ?', whereArgs: [id]);
    return BillModel.fromJson(maps[0]);
  }

  Future<int> insert(BillModel bill) async {
    // Get a reference to the database.
    Database db = await DatabaseHelper.instance.database;
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    // In this case, replace any previous data.
    return await db.insert('bills', bill.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Assumimos aqui que a coluna id no mapa está definida. Os outros
  // valores das colunas serão usados para atualizar a linha.
  Future<int> update(BillModel bill) async {
    Database db = await DatabaseHelper.instance.database;
    return await db
        .update('bills', bill.toJson(), where: 'id = ?', whereArgs: [bill.id]);
  }

  // Exclui a linha especificada pelo id. O número de linhas afetadas é
  // retornada. Isso deve ser igual a 1, contanto que a linha exista.
  Future<int> delete(String id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete("bills", where: 'id = ?', whereArgs: [id]);
  }
}
