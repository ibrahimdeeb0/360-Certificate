import '../../general_exports.dart';

class FormTemplateController extends GetxController {
  TextEditingController copyNameController = TextEditingController();

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
        // consoleLogPretty(allFormsTemplates);
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

  void onPressEditTemplate({
    int? formId,
    int? tempId,
    String? name,
  }) {
    // consoleLog('formId:$formId');
    // consoleLog('tempId:$tempId');
    // consoleLog('name:$name');
    // get data
    ApiRequest(
      path: '/forms/templates/$tempId/show',
      className: 'AddFormTemplateController/onPressEdit',
      withLoading: true,
      requestFunction: onPressEditTemplate,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.certFormInfo[keyFormDataStatus] =
            FormDataStatus.editTemp;
        myAppController.certFormInfo[keyFormId] = formId;
        myAppController.certFormInfo[keyTemplateData] = data;
        myAppController.certFormInfo[keyFormStatus] = FormStatus.template;
        myAppController.certFormInfo[keyFormDataStatus] =
            FormDataStatus.editTemp;
        myAppController.certFormInfo[keyNameTemp] = name;

        if (Get.isBottomSheetOpen!) {
          Get.back();
        }

        if (formId == 5) {
          Get.toNamed(
            routeFormEICR,
          );
        } else if (formId == 9) {
          Get.toNamed(
            routeFormLandlord,
          );
        } else if (formId == 4) {
          Get.toNamed(
            routeFormDangerNotice,
          );
        } else if (formId == 11) {
          Get.toNamed(
            routeFormWarningNotice,
          );
        } else if (formId == 3) {
          Get.toNamed(
            routeFormDomesticEic,
          );
        } else if (formId == 1) {
          Get.toNamed(
            routeFormPortableTest,
          );
        } else if (formId == 2) {
          Get.toNamed(
            routeFormMinorWorks,
          );
        } else if (formId == 31) {
          Get.toNamed(
            routeFormBreakdownService,
          );
        }

        update();
      },
    );
  }

  void onPressDelete({
    int? formId,
    int? tempId,
    String? name,
  }) {
    openDialog(
      title: 'Confirm',
      description: 'Are you sure to delete this form template?',
      onConfirm: () {
        deleteRequest(tempId);
      },
      onCancel: () {
        hideKeyboard();
        Get.back();
      },
    );
  }

  void deleteRequest(int? tempId) {
    hideKeyboard();
    startLoading();
    // ignore: missing_required_param
    ApiRequest(
      method: ApiMethods.delete,
      path: '/forms/templates/$tempId/delete',
      className: 'DeleteAccountController/onDeleteAccount',
      requestFunction: deleteRequest,
      body: <String, dynamic>{},
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        if (Get.isBottomSheetOpen!) {
          Get.back();
        }
        Get.back();
        getFormsTemplates();
        // dismissLoading();
      },
    );
  }

  void onPressDefault({required int tempId}) {
    hideKeyboard();
    startLoading();
    ApiRequest(
      method: ApiMethods.post,
      path: '/forms/templates/$tempId/make-default',
      className: 'AddFormTemplateController/onPressDefault',
      requestFunction: onPressDefault,
      body: <String, dynamic>{},
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        getFormsTemplates();
        if (Get.isBottomSheetOpen!) {
          Get.back();
        }
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    getFormsTemplates();
  }
}
