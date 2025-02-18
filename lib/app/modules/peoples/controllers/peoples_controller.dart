import 'package:get/get.dart';

class PeoplesController extends GetxController {
  RxBool peoplesIsGrid = true.obs;
  setPeoplesIsGrid() {
    peoplesIsGrid.value = !peoplesIsGrid.value;
    update();
  }

  RxString selectedStringTab = 'Department1'.obs;
  setSelectedStringTab(String value) {
    selectedStringTab.value = value;
    update();
  }
}
