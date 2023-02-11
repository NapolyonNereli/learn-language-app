import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item_model.dart';
import 'package:flutter_application_1/preferences/sp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardProvider extends ChangeNotifier {
  List<Item> categories = [
    Item(title: "Deneme1"),
    Item(title: "Denem2"),
  ];

  SharedPreferences? sharedPreferences;

  UnmodifiableListView<Item> get allCategories =>
      UnmodifiableListView(categories);

  void addCategory(Item item) {
    categories.add(item);
    saveLocalStroge();
    notifyListeners();
  }

  void deleteCategory(Item item) {
    categories.remove(item);
    updateLocalStroge();
    notifyListeners();
  }

  void initSharedPrefrences() async {
    await SharedPreferencesSP.init();
    sharedPreferences = SharedPreferencesSP.instance;
    loadLocalStorage();
    notifyListeners();
  }

  void saveLocalStroge() async {
    // List<String> spList = categories.map((e) => json.encode(e.toMap)).toList();
    // sharedPreferences!.setStringList("categorylist", spList);
    await sharedPreferences!.setStringList(
        "categorylist", categories.map((e) => json.encode(e.toMap())).toList());
  }

  void loadLocalStorage() async {
    List<String>? spList = sharedPreferences!.getStringList("categorylist");
    if (spList != null) {
      categories = spList.map((e) => Item.fromMap(json.decode(e))).toList();
    }
  }

  void updateLocalStroge() {
    sharedPreferences!.remove('categorylist');
    saveLocalStroge();
  }
}
