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

  void onPressEdit({
    int? formId,
    int? tempId,
    String? name,
  }) {
    consoleLog('formId:$formId');
    // get data
    ApiRequest(
      path: '/forms/templates/$tempId/show',
      className: 'AddFormTemplateController/onPressEdit',
      withLoading: true,
      requestFunction: onPressEdit,
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
        // consoleLog(name, key: 'name_temp_update');
        Get.toNamed(
          routeFormEICR,
        );
        // Get.to(
        //   () => const EICR(),

        // );

        update();
      },
    );
  }

  void onPressCopy({
    int? formId,
    int? tempId,
    String? name,
    AddFormTemplateController? controller,
  }) {
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
    copyNameController.text = '$name copy';
    update();
    void createACopy() {
      ApiRequest(
        path: '/forms/templates/$tempId/show',
        className: 'AddFormTemplateController/onPressEdit',
        withLoading: true,
        requestFunction: createACopy,
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          Get.to(
            () => const EICR(),
            arguments: <String, dynamic>{
              'isTemplate': true,
              'templateName': copyNameController.text == ''
                  ? '$name copy'
                  : copyNameController.text,
              'tempData': data,
              'updateTemp': false,
              'formId': formId,
            },
          );
          // renderFormScreen(
          //   formId: formId,
          //   name: copyNameController.text == ''
          //       ? '$name copy'
          //       : copyNameController.text,
          //   tempData: data,
          // );
        },
      );
    }

    openDialog(
      title: 'Enter Copy Template Name',
      onCancel: Get.back,
      onConfirm: createACopy,
      child: CommonInput(
        topLabelText: '',
        controller: copyNameController,
      ),
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
        Get.find<FormTemplateController>().getFormsTemplates();
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
