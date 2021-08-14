import 'package:appidea/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if(_db == null){
      var path = join(await getDatabasesPath(), "banco_todo2");
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          // db.delete("secao");
          // db.execute(deleteAll);
          // db.execute(dropTable);
          db.execute(createTable);
          db.execute(createTarefaTable);
          db.execute(insert1Tarefa);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
        } 
      );
    }
    return _db;
  }

}