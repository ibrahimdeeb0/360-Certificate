import '../../general_exports.dart';

class HomeController extends GetxController {
  List<dynamic> formsData = <dynamic>[];

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

  @override
  void onReady() {
    //  implement onReady
    super.onReady();
    getFormsData();
  }
  // @override
  // void onClose() {
  //   //  implement onClose
  //   super.onClose();
  // }
}
