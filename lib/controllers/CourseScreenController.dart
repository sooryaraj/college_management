import 'package:college_management/helpers/LocalDatabaseDao.dart';
import 'package:college_management/models/CoursesObj.dart';
import 'package:college_management/services/CourseRepository.dart';
import 'package:college_management/utils/enums.dart';
import 'package:get/get.dart';

class CourseScreenController extends GetxController {
  var listCourse = <CoursesObj>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var dao = LocalDatabaseDao();
  Rx<RetriveState> status = RetriveState.loading.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadCourseDetailsFromLocal();
  }

  void loadCourseDetails() {
    status.value = RetriveState.loading;
    isLoading(true);
    try {
      CourseRepository().fetchCourseDetails().then((value) {
        listCourse.value = value;
        if (value.isEmpty) {
          status.value = RetriveState.empty;
        } else {
          dao.insertCourseList(value);
          status.value = RetriveState.success;
        }
      });
    } catch (e) {
      status.value = RetriveState.error;
      errorMessage.value = "Error: $e";
    }

    isLoading(false);
  }

  void loadCourseDetailsFromLocal({String where = ""}) {
    status.value = RetriveState.loading;
    isLoading(true);
    try {
      dao.getCourseFromLocal(where: where).then((value) {
        listCourse.value = value;
        if (value.isEmpty) {
          loadCourseDetails();
        } else {
          status.value = RetriveState.success;
        }
      });
    } catch (e) {
      status.value = RetriveState.error;
      errorMessage.value = "Error: $e";
    }

    isLoading(false);
  }
}
