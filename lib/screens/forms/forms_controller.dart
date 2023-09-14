import '../../general_exports.dart';

class FormsController extends GetxController {
  List<dynamic> listTemp = <dynamic>[];
  List<dynamic> allFormsTemplates = <dynamic>[];

  List<Map<String, dynamic>> get formItems => <Map<String, dynamic>>[
        if (homeController.isHaveGas)
          <String, dynamic>{
            keyTitle: 'Gas',
            keyItems: <Map<String, dynamic>>[
              <String, dynamic>{
                keyId: 9,
                keyTitle: 'Landlord/Homeowner Gas Safety Record',
                keyRoute: routeFormLandlord,
                'form_cert_type': FormCertType.gas,
              },
              <String, dynamic>{
                keyId: 11,
                keyTitle: 'Warning Notice',
                keyRoute: routeFormWarningNotice,
                'form_cert_type': FormCertType.gas,
              },
              <String, dynamic>{
                keyId: 31,
                keyTitle: 'Breakdown Service',
                keyRoute: routeFormBreakdownService,
                'form_cert_type': FormCertType.gas,
              },
              <String, dynamic>{
                keyId: 15,
                keyTitle: 'Maintenance Service',
                keyRoute: routeFormMaintenanceService,
                'form_cert_type': FormCertType.gas,
              },
              <String, dynamic>{
                keyId: 13,
                keyTitle: 'Gas Test & Purge',
                keyRoute: routeFormGasTestPurge,
                'form_cert_type': FormCertType.gas,
              },
              if (currentMode == AppMode.dev)
                <String, dynamic>{
                  keyId: 26,
                  keyTitle:
                      'Landlord Gas Safety record for the Leisure Ipndustry',
                  keyRoute: routeFormLeisureIndustry,
                  'form_cert_type': FormCertType.gas,
                },
            ],
          },
        if (homeController.isHaveElectrical)
          <String, dynamic>{
            keyTitle: 'Electrical',
            keyItems: <Map<String, dynamic>>[
              <String, dynamic>{
                keyId: 1,
                keyTitle: 'Portable Appliance Testing (PAT)',
                keyRoute: routeFormPortableTest,
                'form_cert_type': FormCertType.electrical,
              },
              <String, dynamic>{
                keyId: 4,
                keyTitle: 'Electrical Danger Notice',
                keyRoute: routeFormDangerNotice,
                'form_cert_type': FormCertType.electrical,
              },
              <String, dynamic>{
                keyId: 3,
                keyTitle: 'Domestic EIC',
                keyRoute: routeFormDomesticEic,
                'form_cert_type': FormCertType.electrical,
              },
              <String, dynamic>{
                keyId: 5,
                keyTitle: 'EICR',
                keyRoute: routeFormEICR,
                'form_cert_type': FormCertType.electrical,
              },
              <String, dynamic>{
                keyId: 2,
                keyTitle: 'Minor Works',
                keyRoute: routeFormMinorWorks,
                'form_cert_type': FormCertType.electrical,
              },
              <String, dynamic>{
                keyId: 32,
                keyTitle: 'Electrical Isolation',
                keyRoute: routeFormElectricalIsolation,
                'form_cert_type': FormCertType.electrical,
              },
            ],
          },
      ];

  @override
  void onReady() {
    super.onReady();

    if (homeController.isUserSubscribe) {
      getFormsTemplates();
    }
  }

  // bool isNoTemp = false;
  void searchTemplate(Map<String, dynamic> formInfo) {
    consoleLog(formInfo);
    // consoleLog(profileController.electricNumber, key: 'profile_electricNumber');
    // consoleLog(profileController.gasNumber, key: 'profile_gasNumber');
    if (formInfo['form_cert_type'] == FormCertType.electrical) {
      if (homeController.electricNumber != null) {
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
      } else {
        Get.bottomSheet(
          ShowNumberMassageSheet(
            text1:
                "It looks like you haven't provided your board information yet. To create electrical certificates, we need your electrical board selection and your license number.",
            text2:
                'This information is crucial to maintain the validity and compliance of your certificates. You can update this information in your account settings. If you need help finding your license numbers or have any other questions, please refer to our help section or contact our support team.',
            btnText: 'Go To Enter License Number',
            onPress: () {
              if (Get.isBottomSheetOpen!) {
                Get.back();
              }
              Get.toNamed(
                routeUpdateCertNumber,
                arguments: <String, dynamic>{
                  'is_gas': false,
                },
              );
            },
          ),
          isScrollControlled: true,
        );
      }
    } else if (formInfo['form_cert_type'] == FormCertType.gas) {
      if (homeController.gasNumber != null) {
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
      } else {
        Get.bottomSheet(
          ShowNumberMassageSheet(
            text1:
                "It looks like you haven't provided your board information yet. To create gas certificates, we need your Gas Safe Register number.",
            text2:
                'This information is crucial to maintain the validity and compliance of your certificates. You can update this information in your account settings. If you need help finding your license numbers or have any other questions, please refer to our help section or contact our support team.',
            btnText: ' Go To Enter Gas Safe Register Number',
            onPress: () {
              if (Get.isBottomSheetOpen!) {
                Get.back();
              }
              Get.toNamed(
                routeUpdateCertNumber,
                arguments: <String, dynamic>{
                  'is_gas': true,
                },
              );
            },
          ),
          isScrollControlled: true,
        );
      }
    }

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

    Get.offAndToNamed(routeSearchForCustomer);
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
    // startLoading();
    consoleLog(formInfo);
    // get data
    ApiRequest(
      path: '/forms/templates/$tempId/show',
      className: 'AddFormTemplateController/onPressEdit',
      requestFunction: onSelectFormTemplate,
      withLoading: true,
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
        Get.offAndToNamed(routeSearchForCustomer);
        update();

        // dismissLoading();
      },
    );
  }
}
