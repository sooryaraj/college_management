import 'dart:async';

import 'package:college_management/helpers/ApiProvider.dart';
import 'package:college_management/models/CoursesObj.dart';

class CourseRepository {
  final ApiProvider _provider = ApiProvider();

  Future<List<CoursesObj>> fetchCourseDetails() async {
    final List response = await _provider.get(path: 'staff/department');
    return response.map((job) => CoursesObj.fromJson(job)).toList();
  }
}
