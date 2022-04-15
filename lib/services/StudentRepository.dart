import 'dart:async';

import 'package:college_management/helpers/ApiProvider.dart';
import 'package:college_management/models/StudentObj.dart';

class StudentRepository {
  final ApiProvider _provider = ApiProvider();

  Future<List<StudentObj>> fetchStudentDetails() async {
    final List response = await _provider.get(path: 'staff/student');
    return response.map((job) => StudentObj.fromJson(job)).toList();
  }
}
