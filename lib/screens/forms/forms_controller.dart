import '../../general_exports.dart';

class FormsController extends GetxController {
  List<dynamic> listTemp = <dynamic>[];
  List<dynamic> allFormsTemplates = <dynamic>[];

  List<Map<String, dynamic>> formItems = <Map<String, dynamic>>[
    <String, dynamic>{
      keyTitle: 'Gas',
      keyItems: <Map<String, dynamic>>[
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Landlord/Homeowner Gas Safety Record',
        },
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Caravan Boat Gas Safety Inspection Record',
        },
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Warning Notice',
        },
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Gas Inspection Record',
        },
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Gas Testing And Purging',
        },
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Fumes Investigation Report',
        },
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Service/Maintenance Record',
        },
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Gas Boiler System Commissioning Checklist',
        },
      ],
    },
    <String, dynamic>{
      keyTitle: 'Electrical',
      keyItems: <Map<String, dynamic>>[
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Portable Appliance Testing',
        },
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Domestic Electrical Installation Certificate',
        },
        <String, dynamic>{
          keyId: 0,
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
  void searchTemplate(Map<String, dynamic> formData) {
    // consoleLog(formData, key: 'formData');
    listTemp = <dynamic>[
      ...allFormsTemplates
          .where((dynamic item) => item['form_id'] == formData[keyId])
    ];
    // consoleLogPretty(listTemp);

    update();

    if (listTemp.isNotEmpty) {
      Get.bottomSheet(
        ShowTemplatesBT(
          formData: formData,
        ),
      );
    } else if (listTemp.isEmpty) {
      myAppController.selectedForm = <String, dynamic>{
        ...formData,
        'form_route': routeFormEICR,
        'is_form_update': false,
      };
      Get.toNamed(
        routeCreateCustomer,
      );

      if (Get.isBottomSheetOpen!) {
        Get.back();
      }
    }

    // consoleLogPretty(listTemp);
  }

  // void goToCreateCert(Map<String, dynamic> formData) {
  //   consoleLog(formData, key: 'form_data');

  //   myAppController.selectedForm = <String, dynamic>{
  //     ...formData,
  //     'form_route': routeFormEICR,
  //   };

  //   Get.toNamed(
  //     routeCreateCustomer,
  //   );

  //   if (Get.isBottomSheetOpen!) {
  //     Get.back();
  //   }
  // }

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

  void onPressView({
    Map<String, dynamic>? formData,
    int? tempId,
  }) {
    startLoading();
    // get data
    ApiRequest(
      path: '/forms/templates/$tempId/show',
      className: 'AddFormTemplateController/onPressEdit',
      requestFunction: onPressView,
      // withLoading: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        if (Get.isBottomSheetOpen!) {
          Get.back();
        }
        myAppController.selectedForm = <String, dynamic>{
          ...formData!,
          'form_route': routeFormEICR,
          'is_form_update': false,
        };
        myAppController.selectedTemplate = data;
        Get.toNamed(routeCreateCustomer);

        update();
        // if (!SmartDialog.config.isExist) {
        //   startLoading();
        // }
      },
    );
  }
}
