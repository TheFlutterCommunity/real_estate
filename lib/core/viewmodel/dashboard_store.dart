import 'package:mobx/mobx.dart';

class DashboardStore with Store {
  Observable<int> tabIndex = Observable(2);

  Observable<int> popUpItemIndex = Observable(1);

  void selectTab(int index) {
    runInAction(() {
      tabIndex.value = index;
    });
  }

  void selectPopUpItem(int index) {
    runInAction(() {
      popUpItemIndex.value = index;
    });
  }
}
