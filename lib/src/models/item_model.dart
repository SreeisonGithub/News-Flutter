import 'dart:convert';

class ItemModel {
  int id;
  bool deleted;
  String type;
  String by;
  int time;
  String text;
  bool dead;
  int parent;
  List<dynamic> kids;
  String url;
  int score;
  String title;
  int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    deleted = parsedJson['deleted'];
    type = parsedJson['type'];
    by = parsedJson['by'];
    time = parsedJson['time'];
    dead = parsedJson['dead'];
    parent = parsedJson['parent'];
    kids = parsedJson['kids'];
    url = parsedJson['url'];
    title = parsedJson['title'];
    descendants = parsedJson['descendants'];
  }

  ItemModel.fromDb(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    deleted = parsedJson['deleted'] == 1;
    type = parsedJson['type'];
    by = parsedJson['by'];
    time = parsedJson['time'];
    dead = parsedJson['dead'] == 1;
    parent = parsedJson['parent'];
    kids = jsonDecode(parsedJson['kids']);
    url = parsedJson['url'];
    title = parsedJson['title'];
    descendants = parsedJson['descendants'];
  }

  Map<String, dynamic> toMapForDb() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'by': by,
      'text': text,
      'score': score,
      "title": title,
      'parent': parent,
      'url': url,
      'dead': dead ? 1 : 0,
      'descendants': descendants,
      'deleted': deleted ? 1 : 0,
      'kids': jsonEncode(kids)
    };
  }
}
