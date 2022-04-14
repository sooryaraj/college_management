// To parse this JSON data, do
//
//     final studentObj = studentObjFromJson(jsonString);

import 'dart:convert';

class StudentObj {
  StudentObj({
    this.studentName,
    this.fatherName,
    this.profileImage,
    this.email,
    this.department,
    this.joiningDate,
    this.tcImage,
    this.addharcardNo,
    this.address,
    this.id,
  });

  final String? studentName;
  final String? fatherName;
  final String? profileImage;
  final String? email;
  final String? department;
  final String? joiningDate;
  final String? tcImage;
  final String? addharcardNo;
  final String? address;
  final String? id;

  factory StudentObj.fromRawJson(String str) =>
      StudentObj.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentObj.fromJson(Map<String, dynamic> json) => StudentObj(
        studentName: json["student_name"],
        fatherName: json["Father_name"],
        profileImage: json["Profile_image"],
        email: json["email"],
        department: json["department"],
        joiningDate: json["joining_date"],
        tcImage: json["tc_image"],
        addharcardNo: json["addharcard_no"],
        address: json["address"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "student_name": studentName,
        "Father_name": fatherName,
        "Profile_image": profileImage,
        "email": email,
        "department": department,
        "joining_date": joiningDate,
        "tc_image": tcImage,
        "addharcard_no": addharcardNo,
        "address": address,
        "id": id,
      };
}
