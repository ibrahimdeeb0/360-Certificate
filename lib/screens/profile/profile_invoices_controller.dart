import '../../general_exports.dart';

class ProfileInvoicesController extends GetxController {
  List<dynamic> allInvoicesData = <dynamic>[];
  bool isStopLoading = false;

  Future<void> getProfileInvoices() async {
    hideKeyboard();
    startLoading();
    ApiRequest(
      path: keyInvoices,
      className: 'ProfileInvoicesController/getProfileInvoices',
      requestFunction: getProfileInvoices,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getProfileInvoices',
          value: data,
        );
        allInvoicesData = data;
        dismissLoading();
        isStopLoading = true;
        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getProfileInvoices',
      );
      allInvoicesData = apiData;
      dismissLoading();
      isStopLoading = true;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProfileInvoices();
  }
}
