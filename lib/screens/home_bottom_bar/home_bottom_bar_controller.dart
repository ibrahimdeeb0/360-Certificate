import '../../general_exports.dart';

class HomeBottomBarController extends GetxController {
  int selectedIndex = 0;
  List<Map<String, dynamic>> bottomBarItems = <Map<String, dynamic>>[
    <String, dynamic>{
      keyTitle: 'home',
      iconPath: iconHome,
      keyActiveIconColor: AppColors.white,
      keyInActiveIconColor: AppColors.grey,
    },
    <String, dynamic>{
      keyTitle: 'Certificate',
      iconPath: iconActivities,
      keyActiveIconColor: AppColors.white,
      keyInActiveIconColor: AppColors.grey,
    },
    <String, dynamic>{
      keyTitle: 'More',
      iconPath: iconActivities,
      keyActiveIconColor: AppColors.white,
      keyInActiveIconColor: AppColors.grey,
    },
  ];

  void onChangeIndex(int index) {
    selectedIndex = index;
    update();
  }
  // @override
  // void onInit() {
  //   //  implement onInit
  //   super.onInit();
  // }
  // @override
  // void onReady() {
  //   //  implement onReady
  //   super.onReady();
  // }
  // @override
  // void onClose() {
  //   //  implement onClose
  //   super.onClose();
  // }
}
