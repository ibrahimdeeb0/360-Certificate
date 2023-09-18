import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../general_exports.dart';

class MyAppController extends GetxController {
  dynamic userData;
  bool showMapDragBubble = true;
  String? userEmail;
  LocalStorage localStorage = LocalStorage();
  Map<String, dynamic> cartData = <String, dynamic>{};
  String? versionName;
  bool isInternetConnect = true;
  List<Map<String, dynamic>> noInternetWaitingRequests =
      <Map<String, dynamic>>[];
  bool isConnectionAlertNotOpened = true;
  bool showTextConnection = false;
  // Map<String, dynamic>? selectedCustomer;
  // Map<String, dynamic>? selectedForm;
  // Map<String, dynamic>? selectedTemplate;

  Map<String, dynamic> certFormInfo = <String, dynamic>{
    keyFormId: null,
    keyCertId: null,
    keyCustomerId: null,
    keySiteId: null,
    keyTemplateData: null,
    keyFormStatus: null,
    keyFormDataStatus: null,
    keyFormRoute: null,
    keyNameTemp: null,
  };

  void clearCertFormInfo() {
    certFormInfo = <String, dynamic>{
      keyFormId: null,
      keyCertId: null,
      keyCustomerId: null,
      keySiteId: null,
      keyTemplateData: null,
      keyFormStatus: null,
      keyFormDataStatus: null,
      keyFormRoute: null,
      keyNameTemp: null,
    };
    consoleLog('cleared general form data successfully',
        key: 'clear_Cert_Form_Info');
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
    consoleLogPretty(userData, key: 'userData');
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

  bool isInternetDialogOpened = false;
  Future<void> checkInternet() async {
    final dynamic connectivityResult =
        await (Connectivity().checkConnectivity());
    try {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        if (SmartDialog.config.checkExist() && isInternetConnect == false) {
          SmartDialog.dismiss();
        }
        isInternetConnect = true;
        isInternetDialogOpened = false;
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
        if (!SmartDialog.config.checkExist() &&
            (isInternetDialogOpened == false)) {
          //bottom
          await noInternetDialog(height: 70, alignment: Alignment.bottomCenter);
          isInternetDialogOpened = true;
        }
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

  Future<void> noInternetDialog({
    required AlignmentGeometry alignment,
    double width = double.infinity,
    double height = double.infinity,
  }) async {
    await SmartDialog.show(
      alignment: alignment,
      builder: (_) => Container(
        width: width,
        height: height,
        color: Colors.white,
        child: const Center(
          child: CommonText(
            'There is no Internet, Please check your connection',
          ),
        ),
      ),
    );
    // await Future<dynamic>.delayed(const Duration(milliseconds: 500));
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
    userData = null;
    myAppController.localStorage.saveToStorage(
      key: 'showAlertAttention',
      value: true,
    );
    // Navigator.of(Get.context!).pushNamedAndRemoveUntil(
    //   routeLogin,
    //   (Route<dynamic> route) => route.settings.name == routeLogin,
    // );
    Get.offAllNamed(routeLogin);
    // Get.forceAppUpdate();
    // Navigator.popUntil(Get.context!, ModalRoute.withName(routeLogin));
  }

  Timer timer({bool isClose = false}) =>
      Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        checkInternet();
        if (isClose) {
          timer.cancel();
        }
      });

  //* to change Animation Connecting Internet  */
  void onChangeValue() {
    isConnectionAlertNotOpened = false;
    showTextConnection = false;
    update();
    // close Texts
    Timer(
      const Duration(milliseconds: 500),
      () {
        showTextConnection = true;
        update();
      },
    );
    // close container
    Timer(
      const Duration(seconds: 2),
      () {
        isConnectionAlertNotOpened = !isConnectionAlertNotOpened;
        showTextConnection = false;
        update();
      },
    );
  }

  void onEndAnimationInternet() {
    if (isConnectionAlertNotOpened) {
      showTextConnection = false;
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
    timer(isClose: true);
  }
}
