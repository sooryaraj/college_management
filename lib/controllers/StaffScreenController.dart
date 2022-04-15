import 'package:college_management/helpers/LocalDatabaseDao.dart';
import 'package:college_management/services/StaffRepository.dart';
import 'package:college_management/utils/enums.dart';
import 'package:get/get.dart';

import '../models/StaffObj.dart';

class StaffScreenControler extends GetxController {
  var listStaffs = <StaffObj>[].obs;
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

  void loadstaffDetails() {
    status.value = RetriveState.loading;
    isLoading(true);
    try {
      StaffRepository().fetchStaffDetails().then((value) {
        listStaffs.value = value;
        if (value.isEmpty) {
          status.value = RetriveState.empty;
        } else {
          dao.insertStaffList(value);
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
      dao.getStaffFromLocal(where: where).then((value) {
        listStaffs.value = value;
        if (value.isEmpty) {
          loadstaffDetails();
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
