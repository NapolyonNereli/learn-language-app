import 'dart:collection';
import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/words_model.dart';
import 'package:flutter_application_1/preferences/sp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordProvider with ChangeNotifier {
  List<Words> words = [];
  List<Words> backWords = [];
  SharedPreferences? sharedPreferences;
  UnmodifiableListView<Words> get allWords => UnmodifiableListView(words);
  UnmodifiableListView<Words> get allBackWords =>
      UnmodifiableListView(backWords);

  void addWords(Words word, Words backWord) {
    words.add(word);
    backWords.add(backWord);
    //saveLocalStroge();
    notifyListeners();
  }

  // void addBackWords(Words bWord) {
  //   backWords.add(bWord);
  //   saveLocalStroge();
  //   notifyListeners();
  // }

  void removeWords(Words word) {
    words.remove(word);
    backWords.remove(word);
    //updateLocalStorage();
    notifyListeners();
  }

  void initSP() async {
    await SharedPreferencesSP.init();
    sharedPreferences = SharedPreferencesSP.instance;
    loadLocalStorage();
    notifyListeners();
  }

  void saveLocalStroge() async {
    List<String>? spList = words.map((e) => json.encode(e.toMap())).toList();
    List<String>? spBackList =
        backWords.map((e) => json.encode(e.toMap())).toList();
    await sharedPreferences!.setStringList('list', spList);
    await sharedPreferences!.setStringList('backList', spBackList);
  }

  void loadLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('list');
    List<String>? spBackList = sharedPreferences!.getStringList("backList");
    if (spList != null) {
      //words = spBackList.map((e) => Words.fromMap(json.decode(e))).toList();
      words = spList.map((e) => Words.fromMap(json.decode(e))).toList();
    }
  }

  void updateLocalStorage() {
    sharedPreferences!.remove('list');
    saveLocalStroge();
  }
}
