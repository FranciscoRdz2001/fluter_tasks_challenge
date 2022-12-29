import 'package:flutter_tasks_challenge/presentation/home/data/models/tab_model.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  RxList<TabModel> tabs = RxList([]);
  Rx<TabModel?> selectedTab = Rx(null);
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    tabs.addAll(const [
      TabModel(name: 'Completed', data: [1, 2, 3, 4]),
      TabModel(name: 'Not Completed', data: []),
    ]);
    selectedTab.value = tabs.first;
    super.onInit();
  }

  bool isSelected(TabModel tab) => tab == selectedTab.value;

  void onNewSelection(TabModel tab) {
    if (tab != selectedTab.value) {
      selectedTab.value = tab;
    }
  }
}
