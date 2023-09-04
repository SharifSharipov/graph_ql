

class Ship {
  String id;
  String name;
  String? image;
  String? status;
  List<String> roles;
  int? yearBuilt;
  String type;

  Ship({
    required this.id,
    required this.name,
    this.image,
    this.status,
    required this.roles,
    this.yearBuilt,
    required this.type,
  });

  factory Ship.fromJson(Map<String, dynamic> json) => Ship(
        id: json["id"] as String? ?? '',
        name: json["name"] as String? ?? '',
        image: json["image"] as String? ?? '',
        status: json["status"] as String? ?? '',
        roles: json["roles"] != null ? List<String>.from(json["roles"]) : [],
        yearBuilt: json["year_built"] as int? ?? 0,
        type: json['type'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "roles": roles,
        "year_built": yearBuilt,
        "type": type,
      };
}
