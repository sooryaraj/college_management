import 'package:college_management/helpers/data_base.dart';
import 'package:college_management/models/CoursesObj.dart';
import 'package:college_management/models/StaffObj.dart';
import 'package:college_management/models/StudentObj.dart';
import 'package:college_management/utils/constant.dart';
import 'package:sembast/sembast.dart';

class LocalDatabaseDao {
  final _staffPrefFolder = intMapStoreFactory.store(Const.staffPrefFolderName);
  final _studentPrefFolder =
      intMapStoreFactory.store(Const.studentPrefFolderName);
  final _coursePrefFolder =
      intMapStoreFactory.store(Const.coursePrefFolderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  ///// INSERT BEGIN
  Future insertStaffList(value, [bool reset = false]) async {
    if (reset) deleteStaff();
    return await Future.wait([
      for (var element in value)
        _staffPrefFolder.add(await _db, element.toJson()),
    ]);
  }

  Future insertStudentList(value, [bool reset = false]) async {
    if (reset) deleteStudent();
    return await Future.wait([
      for (var element in value)
        _studentPrefFolder.add(await _db, element.toJson()),
    ]);
  }

  Future insertCourseList(value, [bool reset = false]) async {
    if (reset) deleteCourse();
    return await Future.wait([
      for (var element in value)
        _coursePrefFolder.add(await _db, element.toJson()),
    ]);
  }

  ///// INSERT END
  /*
  //
  //
  */
  ///// SELECT BEGIN
  Future<List<StaffObj>> getStaffFromLocal({String where = ""}) async {
    List<RecordSnapshot<int, Map<String, Object?>>> recordSnapshot;
    if (where != "") {
// Using a regular expression matching the exact word (no case)
      var filter = Filter.or([
        Filter.matchesRegExp(
            'staff_name', RegExp('^$where\$', caseSensitive: false)),
        Filter.matchesRegExp(
            'qualification', RegExp('^$where\$', caseSensitive: false)),
        Filter.matchesRegExp(
            'email', RegExp('^$where\$', caseSensitive: false)),
        Filter.matchesRegExp('phone', RegExp('^$where\$', caseSensitive: false))
      ]);
      recordSnapshot = await _staffPrefFolder.find(await _db,
          finder: Finder(filter: filter));
    } else {
      recordSnapshot = await _staffPrefFolder.find(await _db);
    }
    var recordList = recordSnapshot.map((snapshot) {
      final data = StaffObj.fromJson(snapshot.value);
      return data;
    }).toList();
    return recordList;
  }

  Future<List<StudentObj>> getStudentFromLocal({String where = ""}) async {
    List<RecordSnapshot<int, Map<String, Object?>>> recordSnapshot;
    if (where != "") {
// Using a regular expression matching the exact word (no case)
      var filter = Filter.or([
        Filter.matchesRegExp(
            'student_name', RegExp('^$where\$', caseSensitive: false)),
        Filter.matchesRegExp(
            'Father_name', RegExp('^$where\$', caseSensitive: false)),
        Filter.matchesRegExp(
            'department', RegExp('^$where\$', caseSensitive: false)),
        Filter.matchesRegExp(
            'staff_name', RegExp('^$where\$', caseSensitive: false)),
        Filter.matchesRegExp(
            'course_name', RegExp('^$where\$', caseSensitive: false)),
        Filter.matchesRegExp(
            'address', RegExp('^$where\$', caseSensitive: false)),
        Filter.matchesRegExp(
            'addharcard_no', RegExp('^$where\$', caseSensitive: false))
      ]);
      recordSnapshot = await _studentPrefFolder.find(await _db,
          finder: Finder(filter: filter));
    } else {
      recordSnapshot = await _studentPrefFolder.find(await _db);
    }

    var recordList = recordSnapshot.map((snapshot) {
      final data = StudentObj.fromJson(snapshot.value);
      return data;
    }).toList();
    print(recordList);
    return recordList;
  }

  Future<List<CoursesObj>> getCourseFromLocal({String where = ""}) async {
    List<RecordSnapshot<int, Map<String, Object?>>> recordSnapshot;
    if (where != "") {
// Using a regular expression matching the exact word (no case)
      var filter = Filter.or([
        Filter.matchesRegExp(
            'staff_name', RegExp('^$where\$', caseSensitive: false)),
        Filter.matchesRegExp(
            'course_name', RegExp('^$where\$', caseSensitive: false)),
      ]);
      recordSnapshot = await _coursePrefFolder.find(await _db,
          finder: Finder(filter: filter));
    } else {
      recordSnapshot = await _coursePrefFolder.find(await _db);
    }
    var recordList = recordSnapshot.map((snapshot) {
      final data = CoursesObj.fromJson(snapshot.value);
      return data;
    }).toList();
    print(recordList);
    return recordList;
  }

  ///// SELECT END
  /*
  //
  //
  */
  ///// DELETE BEGIN

  Future<int> deleteStaff() async => await _staffPrefFolder.delete(await _db);
  Future<int> deleteStudent() async =>
      await _studentPrefFolder.delete(await _db);
  Future<int> deleteCourse() async => await _coursePrefFolder.delete(await _db);

  ///// SELECT END
}
