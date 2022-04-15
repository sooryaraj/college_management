// To parse this JSON data, do
//
//     final staffObj = staffObjFromJson(jsonString);

import 'dart:convert';

class StaffObj {
  StaffObj({
    this.staffName,
    this.qualification,
    this.email,
    this.phone,
    this.profileImage,
    this.id,
  });

  final String? staffName;
  final String? qualification;
  final String? email;
  final dynamic phone;
  final String? profileImage;
  final String? id;

  factory StaffObj.fromRawJson(String str) =>
      StaffObj.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StaffObj.fromJson(Map<String, dynamic> json) => StaffObj(
        staffName: json["staff_name"],
        qualification: json["qualification"],
        email: json["email"],
        phone: json["phone"],
        profileImage: json["profile_image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "staff_name": staffName,
        "qualification": qualification,
        "email": email,
        "phone": phone,
        "profile_image": profileImage,
        "id": id,
      };
}
