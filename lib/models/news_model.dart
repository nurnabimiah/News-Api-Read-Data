import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.by = "",
    this.descendants = 0,
    this.id = 0,
    this.kids = const [],
    this.score = 0,
    this.time = 0,
    this.title = "",
    this.type = "",
    this.url = "",
  });

  String by;
  int descendants;
  int id;
  List<int> kids;
  int score;
  int time;
  String title;
  String type;
  String url;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        by: json["by"] ?? "",
        descendants: json["descendants"] ?? 0,
        id: json["id"] ?? 0,
        kids: json["kids"] != null
            ? List<int>.from(json["kids"].map((x) => x))
            : const [],
        score: json["score"] ?? 0,
        time: json["time"] ?? "",
        title: json["title"] ?? "",
        type: json["type"] ?? "",
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "by": by,
        "descendants": descendants,
        "id": id,
        "kids": List<dynamic>.from(kids.map((x) => x)),
        "score": score,
        "time": time,
        "title": title,
        "type": type,
        "url": url,
      };
}
