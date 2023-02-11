class Words {
  String title;
  String category;
  String titleBack;
  Words({required this.title, required this.category, required this.titleBack});

  Words.fromMap(Map map)
      : title = map['title'] as String,
      titleBack = map["backTitle"] as String,
        category = map['category'] as String;

  Map toMap() {
    return {
      'title': title,
      "titleBack ": titleBack,
      'category': category,
    };
  }
}
