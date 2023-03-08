import '../../general_exports.dart';

class CustomersController extends GetxController {
  List<dynamic> allCustomers = <dynamic>[];

  Future<void> getAllCustomers() async {
    hideKeyboard();

    ApiRequest(
      path: formGetAllCustomers,
      className: 'CustomersController/getAllCustomers',
      requestFunction: getAllCustomers,
      withLoading: true,
      // formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getAllCustomers',
          value: data,
        );
        allCustomers = data;
        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getAllCustomers',
      );
      allCustomers = apiData;
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
    getAllCustomers();
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
