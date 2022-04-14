// To parse this JSON data, do
//
//     final departmentObj = departmentObjFromJson(jsonString);

import 'dart:convert';

class DepartmentObj {
  DepartmentObj({
    this.courseName,
    this.noSection,
    this.staffName,
    this.id,
  });

  final String? courseName;
  final String? noSection;
  final String? staffName;
  final String? id;

  factory DepartmentObj.fromRawJson(String str) =>
      DepartmentObj.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DepartmentObj.fromJson(Map<String, dynamic> json) => DepartmentObj(
        courseName: json["course_name"],
        noSection: json["no_section"],
        staffName: json["staff_name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "course_name": courseName,
        "no_section": noSection,
        "staff_name": staffName,
        "id": id,
      };
}
