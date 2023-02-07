import '../../general_exports.dart';

class FormTemplateController extends GetxController {
  List<dynamic> allFormsTemplates = <dynamic>[];

  Future<void> getFormsTemplates() async {
    hideKeyboard();
    startLoading();
    ApiRequest(
      path: keyGetAllFormTemplate,
      className: 'FormTemplateController/getFormsTemplates',
      requestFunction: getFormsTemplates,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getFormsTemplates',
          value: data,
        );
        allFormsTemplates = data;
        consoleLogPretty(allFormsTemplates);
        update();
        dismissLoading();
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getFormsTemplates',
      );
      allFormsTemplates = apiData;
      dismissLoading();
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getFormsTemplates();
  }
}
