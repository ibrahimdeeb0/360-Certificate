import '../../general_exports.dart';

class MySettingsController extends GetxController {
  Map<String, dynamic> userData = <String, dynamic>{};

  Future<void> getUserData() async {
    hideKeyboard();
    ApiRequest(
      path: keyUserData,
      className: 'MySettingsController/getUserData',
      requestFunction: getUserData,
      withLoading: true,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getUserData',
          value: data,
        );
        userData = data;
        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getUserData',
      );
      userData = apiData;
      update();
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
  @override
  void onReady() {
    super.onReady();
    getUserData();
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
