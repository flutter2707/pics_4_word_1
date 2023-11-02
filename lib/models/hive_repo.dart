import 'package:hive/hive.dart';

class HiveRepo{
  final Box _box = Hive.box("onepice");


  saveVoise(bool t){
    _box.put("audio", t);
  }

  getVoise()=>_box.get("audio",defaultValue: false);


  saveTime(int second){
    _box.put("second", second);
  }

  getTime()=>_box.get("second",defaultValue: 0);


  saveCoins(int coin){
    _box.put("coins", coin);
  }
  getCoins()=>_box.get("coins",defaultValue: 25);


  saveRang(int coin){
    _box.put("rang", coin);
  }
  getRang()=>_box.get("rang",defaultValue: 1);


  saveLevel(int level){
    _box.put("level", level);
  }
  getLevel()=>_box.get("level",defaultValue: 0);


  saveAnswerList(List<String> list){
    _box.put("answerlist", list);
  }
  getAnswerList()=>_box.get("answerlist",defaultValue: <String>[]);


  saveWords(List<String> list){
    _box.put("words", list);
  }
  getWords()=>_box.get("words",defaultValue: <String>[]);


  saveIndex2(List<int> list){
    _box.put("index2", list);
  }
  getIndex2()=>_box.get("index2",defaultValue: <int>[]);
}