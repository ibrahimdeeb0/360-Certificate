import '../../general_exports.dart';

class FormsController extends GetxController {
  List<dynamic> listTemp = <dynamic>[];
  List<dynamic> allFormsTemplates = <dynamic>[];

  List<Map<String, dynamic>> formItems = <Map<String, dynamic>>[
    <String, dynamic>{
      keyTitle: 'Gas',
      keyItems: <Map<String, dynamic>>[
        <String, dynamic>{
          keyId: 9,
          keyTitle: 'Landlord/Homeowner Gas Safety Record',
        },
        <String, dynamic>{
          keyId: 11,
          keyTitle: 'Warning Notice',
        },
      ],
    },
    <String, dynamic>{
      keyTitle: 'Electrical',
      keyItems: <Map<String, dynamic>>[
        <String, dynamic>{
          keyId: 1,
          keyTitle: 'Portable Appliance Testing',
        },
        <String, dynamic>{
          keyId: 3,
          keyTitle: 'Domestic Electrical Installation Certificate',
        },
        <String, dynamic>{
          keyId: 4,
          keyTitle: 'Electrical Danger Notification',
        },
        <String, dynamic>{
          keyId: 5,
          keyTitle: 'EICR',
        },
      ],
    },
  ];

  @override
  void onReady() {
    super.onReady();
    getFormsTemplates();
  }

  // bool isNoTemp = false;
  void searchTemplate(Map<String, dynamic> formInfo) {
    // Get Templates related to selected Form
    listTemp = <dynamic>[
      ...allFormsTemplates
          .where((dynamic item) => item['form_id'] == formInfo[keyId])
    ];

    // set here form info and form page route
    Get.bottomSheet(
      ShowTemplatesBT(
        formInfo: formInfo,
      ),
    );

    update();
  }

  void onSkipTemplate(Map<String, dynamic> formInfo) {
    consoleLog(formInfo);
    consoleLog(formInfo, key: 'form_data');
    myAppController.certFormInfo[keyFormId] = formInfo[keyId];
    myAppController.certFormInfo[keyFormStatus] = FormStatus.create;
    myAppController.certFormInfo[keyFormDataStatus] = FormDataStatus.newForm;
    myAppController.certFormInfo[keyFormRoute] = routeFormEICR;

    consoleLog(myAppController.certFormInfo, key: 'form_data_Global');
    // myAppController.selectedForm = <String, dynamic>{
    //   ...formInfo,
    //   'form_route': routeFormEICR,
    //   'is_form_update': false,
    // };
    // consoleLog(myAppController.selectedForm, key: 'form_data_Global');
    Get.back();
    Get.toNamed(
      routeCreateCustomer,
    );
  }

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
        consoleLogPretty(allFormsTemplates, key: 'allFormsTemplates');
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

  void onSelectFormTemplate({
    Map<String, dynamic>? formInfo,
    int? tempId,
  }) {
    startLoading();
    // get data
    ApiRequest(
      path: '/forms/templates/$tempId/show',
      className: 'AddFormTemplateController/onPressEdit',
      requestFunction: onSelectFormTemplate,
      // withLoading: true,
      // formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        consoleLogPretty(data, key: 'template_data');
        myAppController.certFormInfo[keyFormId] = formInfo?[keyId];
        myAppController.certFormInfo[keyFormStatus] = FormStatus.create;
        myAppController.certFormInfo[keyFormDataStatus] =
            FormDataStatus.setTemp;
        myAppController.certFormInfo[keyFormRoute] = routeFormEICR;
        myAppController.certFormInfo[keyTemplateData] = data;

        consoleLog(myAppController.certFormInfo, key: 'form_data_Global');
        Get.toNamed(routeCreateCustomer);
        update();

        // dismissLoading();
      },
    );
  }
}
