// To parse this JSON data, do
//
//     final CoursesObj = CoursesObjFromJson(jsonString);

import 'dart:convert';

class CoursesObj {
  CoursesObj({
    this.courseName,
    this.noSection,
    this.staffName,
    this.id,
  });

  final String? courseName;
  final String? noSection;
  final String? staffName;
  final String? id;

  factory CoursesObj.fromRawJson(String str) =>
      CoursesObj.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CoursesObj.fromJson(Map<String, dynamic> json) => CoursesObj(
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
