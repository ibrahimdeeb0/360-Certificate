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
          keyRoute: routeFormLandlord,
        },
        <String, dynamic>{
          keyId: 11,
          keyTitle: 'Warning Notice',
          keyRoute: routeFormWarningNotice,
        },
      ],
    },
    <String, dynamic>{
      keyTitle: 'Electrical',
      keyItems: <Map<String, dynamic>>[
        // <String, dynamic>{
        //   keyId: 1,
        //   keyTitle: 'Portable Appliance Testing',
        //   keyRoute: '',
        // },
        <String, dynamic>{
          keyId: 3,
          keyTitle: 'Domestic EIC',
          keyRoute: routeFormDomesticEic,
        },
        <String, dynamic>{
          keyId: 4,
          keyTitle: 'Electrical Danger Notice',
          keyRoute: routeFormDangerNotice,
        },
        <String, dynamic>{
          keyId: 5,
          keyTitle: 'EICR',
          keyRoute: routeFormEICR,
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
    consoleLog(formInfo);
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
    myAppController.certFormInfo[keyFormRoute] = formInfo[keyRoute];

    consoleLog(myAppController.certFormInfo, key: 'form_data_Global');

    Get.back();

    Get.offAndToNamed(routeCreateCustomer);
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
    consoleLog(formInfo);
    // get data
    ApiRequest(
      path: '/forms/templates/$tempId/show',
      className: 'AddFormTemplateController/onPressEdit',
      requestFunction: onSelectFormTemplate,
      // withLoading: true,
      // formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.certFormInfo[keyFormId] = formInfo?[keyId];
        myAppController.certFormInfo[keyFormStatus] = FormStatus.create;
        myAppController.certFormInfo[keyFormDataStatus] =
            FormDataStatus.setTemp;
        myAppController.certFormInfo[keyFormRoute] = formInfo?[keyRoute];
        myAppController.certFormInfo[keyTemplateData] = data;

        Get.back();
        Get.offAndToNamed(routeCreateCustomer);
        update();

        // dismissLoading();
      },
    );
  }
}
