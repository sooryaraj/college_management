import 'dart:async';

import 'package:college_management/helpers/ApiProvider.dart';
import 'package:college_management/models/StaffObj.dart';

class StaffRepository {
  final ApiProvider _provider = ApiProvider();

  Future<List<StaffObj>> fetchStaffDetails() async {
    final List response = await _provider.get(path: 'staff/staff');
    return response.map((job) => StaffObj.fromJson(job)).toList();
  }
}
