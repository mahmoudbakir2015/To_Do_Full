import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class SqfliteHelper{
  Future<List<Map<String,dynamic>>> readData(String sql);
  Future<int> deleteData(String sql);
  Future<int> insertData(String sql);
  Future<int> updateData(String sql);
}

class SqfliteHelperImpl implements SqfliteHelper{
  static Database? _db;
  get db async{
    if(_db==null)
    {
      _db=await createDataBase();
      return _db;
    }else{
      return _db;
    }
  }
  static createDataBase()async{
    String pathOfDataBase=await getDatabasesPath();
    String path = join( pathOfDataBase,'dataBase' );
    Database mydb=await openDatabase(
      path,
      version: 1,
      onCreate:(db,version)async{
        await db.execute(' CREATE TABLE "myTasks"( id INTEGER PRIMARY KEY , content TEXT , date TEXT , time TEXT , isArc TEXT , isDone TEXT)');
      },
    );
    return mydb;
  }

  Future<List<Map<String,dynamic>>> readData(String sql)async
  {
    Database mydb=await db;
    List<Map<String,dynamic>> response =await mydb.rawQuery(sql);
    return response;
  }
  Future<int> deleteData(String sql)async
  {
    Database mydb=await db;
    int response =await mydb.rawDelete(sql);
    return response;
  }
  Future<int> insertData(String sql)async
  {
    Database mydb=await db;
    int response =await mydb.rawInsert(sql);
    return response;
  }
  Future<int> updateData(String sql)async
  {
    Database mydb=await db;
    int response =await mydb.rawUpdate(sql);
    return response;
  }
  static Future<void>myDeleteDataBase ()async{
    String pathOfDataBase=await getDatabasesPath();
    String path = join( pathOfDataBase,'dataBase' );
    await deleteDatabase(path);
  }
}