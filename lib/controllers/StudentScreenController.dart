import 'package:college_management/helpers/LocalDatabaseDao.dart';
import 'package:college_management/models/StudentObj.dart';
import 'package:college_management/services/StudentRepository.dart';
import 'package:college_management/utils/enums.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class StudentScreenController extends GetxController {
  var listStudents = <StudentObj>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var panelController = PanelController().obs;
  var isPanelOpened = false.obs;
  var dao = LocalDatabaseDao();
  Rx<RetriveState> status = RetriveState.loading.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadStudentDetailsFromLocal();
  }

  void loadStudentDetails() {
    status.value = RetriveState.loading;
    isLoading(true);
    try {
      StudentRepository().fetchStudentDetails().then((value) {
        listStudents.value = value;
        if (value.isEmpty) {
          status.value = RetriveState.empty;
        } else {
          dao.insertStudentList(value);
          status.value = RetriveState.success;
        }
      });
    } catch (e) {
      status.value = RetriveState.error;
      errorMessage.value = "Error: $e";
    }

    isLoading(false);
  }

  void loadStudentDetailsFromLocal({String where = ""}) {
    status.value = RetriveState.loading;
    isLoading(true);
    try {
      dao.getStudentFromLocal(where: where).then((value) {
        listStudents.value = value;
        if (value.isEmpty) {
          loadStudentDetails();
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
