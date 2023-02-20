import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../general_exports.dart';

class MyAppController extends GetxController {
  dynamic userData;
  bool showMapDragBubble = true;
  LocalStorage localStorage = LocalStorage();
  Map<String, dynamic> cartData = <String, dynamic>{};
  String? versionName;
  bool isInternetConnect = true;
  List<Map<String, dynamic>> noInternetWaitingRequests =
      <Map<String, dynamic>>[];

  Map<String, dynamic>? selectedCustomer;
  Map<String, dynamic>? selectedForm;
  Map<String, dynamic>? selectedTemplate;

  void clearFormAndTemp() {
    selectedCustomer = null;
    selectedForm = null;
    selectedTemplate = null;
    update();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await checkInternet();
    timer();
    userData = await localStorage.getFromStorage(key: storeUser);
    showMapDragBubble =
        await localStorage.getFromStorage(key: storeShowMapDragBubble) ?? true;
  }

  @override
  void onReady() {
    super.onReady();
    PackageInfo.fromPlatform().then(
      (PackageInfo packageInfo) {
        versionName = '${packageInfo.version}$currentModeText';
        update();
      },
    );
    consoleLog(userData, key: 'userData');
  }

  Future<void> updateData() async {
    final List<int> currentMap = <int>[1, 2, 3];
    final List<int> newList = <int>[];
    for (int item in currentMap) {
      newList.add(item);
    }
    update();
  }

  void onUserAuthenticated(dynamic userDataValue) {
    localStorage.saveToStorage(key: storeUser, value: userDataValue);
    userData = userDataValue;
    consoleLog(userDataValue);
    update();
  }

  Future<void> checkInternet() async {
    final dynamic connectivityResult =
        await (Connectivity().checkConnectivity());
    try {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        isInternetConnect = true;
        if (noInternetWaitingRequests.isNotEmpty) {
          for (final Map<String, dynamic> element
              in noInternetWaitingRequests) {
            startLoading();
            element[keyRequestFunction]?.call();
            noInternetWaitingRequests.remove(element);
          }
        }
      } else {
        isInternetConnect = false;
      }
      update();
    } on SocketException {
      if (isInternetConnect) {
        isInternetConnect = false;
        update();
      }
    }
  }

  void resendNoInternetRequests() {
    noInternetWaitingRequests.map((Map<String, dynamic> requestData) =>
        requestData['requestFunction']?.call());
  }

  void onUserUpdated(dynamic userDataValue) {
    localStorage.saveToStorage(key: storeUser, value: userDataValue);
    userData = userDataValue;
    consoleLog(userDataValue);
    update();
  }

  void setShowMapDragBubble(dynamic newValue) {
    showMapDragBubble = newValue;
    localStorage.saveToStorage(
      key: storeShowMapDragBubble,
      value: showMapDragBubble,
    );
  }

  // void onSignOut() {
  //   localStorage.removeFromStorage(key: storeUser);
  //   userData = null;
  //   Get.offAllNamed(routeLogin);
  // }

  void onSignOut() {
    homeBottomBarController.selectedIndex = 0;
    localStorage.erase();
    myAppController.localStorage.saveToStorage(
      key: 'showAlertAttention',
      value: true,
    );
    userData = null;
    Navigator.of(Get.context!).pushNamedAndRemoveUntil(
      routeLogin,
      (Route<dynamic> route) => route.settings.name == routeLogin,
    );
    Get.forceAppUpdate();

    // Navigator.popUntil(Get.context!, ModalRoute.withName(routeLogin));
  }

  Timer timer({bool isClose = false}) =>
      Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        checkInternet();
        if (isClose) {
          timer.cancel();
        }
      });

  @override
  void onClose() {
    super.onClose();
    timer(isClose: true);
  }
}
