// To parse this JSON data, do
//
//     final departmentObj = departmentObjFromJson(jsonString);

import 'dart:convert';

class DepartmentObj {
  DepartmentObj({
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
  final String? phone;
  final String? profileImage;
  final String? id;

  factory DepartmentObj.fromRawJson(String str) =>
      DepartmentObj.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DepartmentObj.fromJson(Map<String, dynamic> json) => DepartmentObj(
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
