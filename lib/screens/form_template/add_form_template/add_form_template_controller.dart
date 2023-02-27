import '../../../general_exports.dart';

class AddFormTemplateController extends GetxController {
  // RenderFormController renderController = Get.put(RenderFormController());

  TextEditingController templateController = TextEditingController();
  TextEditingController copyNameController = TextEditingController();

  List<dynamic> allServices = <dynamic>[];
  List<dynamic> listAllForms = <dynamic>[
    <String, Object>{
      'id': 1,
      'name': 'Portable Appliance Testing',
    },
    <String, Object>{
      'id': 3,
      'name': 'Domestic Electrical Installation Certificate',
    },
    <String, Object>{
      'id': 4,
      'name': 'Electrical Danger Notification',
    },
    <String, Object>{
      'id': 5,
      'name': 'Domestic Electrical installation Condition report',
    },
    <String, Object>{
      'id': 9,
      'name': 'Landlord/Homeowner Gas Safety Record',
    },
  ];

  Map<String, dynamic>? selectedService;
  Map<String, dynamic>? selectedForm;
  List<dynamic>? serviceListForms;

  List<int> listIndexService = <int>[];
  List<int> listIndexForm = <int>[];

  bool serviceHaveForm = true;
  bool isSelectedForm = false;

  dynamic formController;

  @override
  void onReady() {
    super.onReady();
    update();
  }

  void toggleRadioForm(int indexNum) {
    if (listIndexForm.isEmpty) {
      listIndexForm.add(indexNum);
      update();
      onSelectForm();
    } else {
      listIndexForm.clear();
      listIndexForm.add(indexNum);
      update();
      onSelectForm();
    }
  }

  void onSelectForm() {
    if (listIndexForm.isEmpty) {
      showMessage(
        description: 'Please Select Form',
        textColor: COMMON_RED_COLOR,
      );
    } else if (listIndexForm.isNotEmpty) {
      selectedForm = serviceListForms?.elementAt(listIndexForm[0]);
      checkIsPressNext();
      consoleLogPretty(selectedForm);
      Get.back();
    }
    hideKeyboard();
  }

  void checkIsPressNext() {
    if (selectedForm != null && templateController.text.isNotEmpty) {
      isSelectedForm = true;
      update();
    } else {
      isSelectedForm = false;
      update();
    }
  }

  void inputOnChange(dynamic value) {
    checkIsPressNext();
  }

  Future<void> renderFormScreen({
    int? formId,
    String? name,
    dynamic tempData,
    bool? updateTemp = false,
  }) async {
    hideKeyboard();
    // renderController.formId = formId ?? selectedForm?['id'];
    // renderController.templateName = name ?? templateController.text;
    // renderController.updateTemp = updateTemp;
    consoleLog(
        '${formId ?? selectedForm?['id']} + ${name ?? templateController.text}',
        key: 'template_info');

    // formController: EicrController(
    //   isTemplate: true,
    //   templateName: templateController.text.trim(),
    //   tempData: tempData,
    //   updateTemp: updateTemp!,
    // ),

    Get.to(
      () => const EICR(),
      arguments: <String, dynamic>{
        'isTemplate': true,
        'templateName': templateController.text.trim(),
        'tempData': tempData,
        'updateTemp': updateTemp!,
        'formId': formId,
      },
    );

    // renderController
    //     .checkTemplateType(
    //   tempData: tempData,
    // )
    //     .then(
    //   (void value) {
    //     // formController = EicrController(
    //     //   isTemplate: true,
    //     //   templateName: templateController.text.trim(),
    //     //   tempData: tempData,
    //     //   updateTemp: updateTemp!,
    //     // );
    //     Get.to(
    //       () => EICR(
    //         formController: EicrController(
    //           isTemplate: true,
    //           templateName: templateController.text.trim(),
    //           tempData: tempData,
    //           updateTemp: updateTemp!,
    //         ),
    //       ),
    //     );
    //     // renderController.checkTemplateWidget();
    //     // Get.toNamed(
    //     //   routeViewForms,
    //     //   arguments: <String, dynamic>{
    //     //     'formWidget': renderController.checkTemplateWidget(),
    //     //   },
    //     // );
    //   },
    // );
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
        if (Get.isBottomSheetOpen!) {
          Get.back();
        }
        consoleLog(name, key: 'name_temp_update');
        Get.to(
          () => const EICR(),
          arguments: <String, dynamic>{
            'isTemplate': true,
            'templateName': name,
            'tempData': data,
            'updateTemp': true,
            'formId': formId,
          },
        );
        // renderFormScreen(
        //   formId: formId,
        //   name: name,
        //   tempData: data,
        //   updateTemp: true,
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
        Get.find<FormTemplateController>().getFormsTemplates();
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
}
