import 'package:hive/hive.dart';

class HiveHelper{

  static setTask(String task){
    Hive.box(HiveKeys.tasks).put(HiveKeys.tasks, task);
  }










}


class HiveKeys{

  static const tasks="TASKS";


}