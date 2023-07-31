


import 'package:hive/hive.dart';

import 'hive_database_constants.dart';

class HiveHelper{


  void setBox1(String name) async {
    var box = await Hive.openBox(box1);
    box.put(box1,name);
  }

  Future<String> getBox1() async{
    var box = await Hive.openBox(box1);
    return await box.get(box1);
  }







}