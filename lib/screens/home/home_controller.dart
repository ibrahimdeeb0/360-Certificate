import '../../general_exports.dart';

class HomeController extends GetxController {
  List<dynamic> formsData = <dynamic>[];

  dynamic certCountData;
  int countCompleteCert = 0;
  int countUnCompleteCert = 0;

  @override
  void onReady() {
    super.onReady();
    getFormsData();
    getCertCount();
  }

  Future<void> getFormsData() async {
    ApiRequest(
      path: keyForms,
      className: 'HomeController/getFormsData',
      requestFunction: getFormsData,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        formsData = data;
        myAppController.localStorage.saveToStorage(
          key: 'formsData',
          value: data,
        );
        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      formsData = await myAppController.localStorage.getFromStorage(
        key: 'formsData',
      );
      update();
      dismissLoading();
    }
  }

  Future<void> getCertCount() async {
    ApiRequest(
      path: formGetCerCount,
      className: 'HomeController/getCertCount',
      requestFunction: getCertCount,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        certCountData = data;
        countCompleteCert = data['count_complete_cert'];
        countUnCompleteCert = data['count_uncompleted_cert'];
        myAppController.localStorage.saveToStorage(
          key: 'certCountData',
          value: data,
        );
        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      certCountData = await myAppController.localStorage.getFromStorage(
        key: 'certCountData',
      );
      countCompleteCert = certCountData['count_complete_cert'];
      countCompleteCert = certCountData['count_uncompleted_cert'];
      update();
      dismissLoading();
    }
  }

  // @override
  // void onClose() {
  //   //  implement onClose
  //   super.onClose();
  // }
}
