// To parse this JSON data, do
//
//     final frequentReponse = frequentReponseFromJson(jsonString);

import 'dart:convert';

FrequentReponse frequentReponseFromJson(String str) => FrequentReponse.fromJson(json.decode(str));

String frequentReponseToJson(FrequentReponse data) => json.encode(data.toJson());

class FrequentReponse {
  final List<ListElement>? list;

  FrequentReponse({
    this.list,
  });

  factory FrequentReponse.fromJson(Map<String, dynamic> json) => FrequentReponse(
    list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class ListElement {
  final int? id;
  final String? heading;
  final String? content;

  ListElement({
    this.id,
    this.heading,
    this.content,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    heading: json["heading"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "heading": heading,
    "content": content,
  };
}
