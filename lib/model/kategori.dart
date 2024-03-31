// To parse this JSON data, do
//
//     final kategory = kategoryFromJson(jsonString);

part of 'model.dart';

List<Kategory> kategoryFromJson(String str) => List<Kategory>.from(json.decode(str).map((x) => Kategory.fromJson(x)));

String kategoryToJson(List<Kategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kategory {
    int id;
    String name;
    String image;
    DateTime creationAt;
    DateTime updatedAt;

    Kategory({
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    factory Kategory.fromJson(Map<String, dynamic> json) => Kategory(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
