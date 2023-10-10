
import 'dart:core';

class SqfLiteConstants {
  static  String  tableName = "'myTasks'";
  static  String insertItem = "INSERT INTO";

  static  String getDataSql = "SELECT * FROM $tableName";
  static  String addDataSql = "INSERT INTO $tableName() VALUES ()";

  static  String whereWord ="WHERE";
  static  String valuesWord ="VALUES";

  static  String contentWord ="content";
  static  String dateWord ="date";
  static  String timeWord ="time";
  static  String statusWord ="status";

  static  String newWord ="new";
  static  String doneWord ="done";
  static  String archivedWord ="archived";



 
}