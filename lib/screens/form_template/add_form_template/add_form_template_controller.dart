import '../../../general_exports.dart';

class AddFormTemplateController extends GetxController {
  TextEditingController templateController = TextEditingController();

  List<Map<String, dynamic>> listAllForms = <Map<String, dynamic>>[
    // <String, dynamic>{
    //   keyId: 1,
    //   keyName: 'Portable Appliance Testing',
    // },
    // <String, dynamic>{
    //   keyId: 3,
    //   keyName: 'Domestic Electrical Installation Certificate'
    // },
    <String, dynamic>{
      keyId: 9,
      keyName: 'Landlord/Homeowner Gas Safety Record',
      keyRoute: routeFormLandlord,
    },
    <String, dynamic>{
      keyId: 11,
      keyName: 'Warning Notice',
      keyRoute: routeFormWarningNotice,
    },
    <String, dynamic>{
      keyId: 1,
      keyName: 'Portable Appliance Testing',
      keyRoute: routeFormPortableTest,
    },
    <String, dynamic>{
      keyId: 4,
      keyName: 'Electrical Danger Notice',
      keyRoute: routeFormDangerNotice,
    },
    <String, dynamic>{
      keyId: 3,
      keyName: 'Domestic EIC',
      keyRoute: routeFormDomesticEic,
    },
    <String, dynamic>{
      keyId: 5,
      keyName: 'EICR',
      keyRoute: routeFormEICR,
    },
    <String, dynamic>{
      keyId: 2,
      keyTitle: 'Minor Works',
      keyRoute: routeFormMinorWorks,
    },
  ];

  List<Map<String, dynamic>> unActiveForms = <Map<String, dynamic>>[
    // <String, dynamic>{
    //   keyId: 1,
    //   keyName: 'Portable Appliance Testing',
    // },

    // <String, dynamic>{
    //   keyId: 4,
    //   keyName: 'Electrical Danger Notification',
    // },
    // <String, dynamic>{
    //   keyId: 5,
    //   keyName: 'Domestic Electrical installation Condition report'
    // },
    // <String, dynamic>{
    //   keyId: 9,
    //   keyName: 'Landlord/Homeowner Gas Safety Record',
    // },
  ];

  Map<String, dynamic>? selectedForm;

  bool isEnable = false;

  // @override
  // void onReady() {
  //   super.onReady();
  //   // update();
  // }

  void inputOnChange(String? value) {
    enableButton();
  }

  void onSelectForm(Map<String, dynamic> item) {
    selectedForm = item;
    update();
    Get.back();
    enableButton();
  }

  void enableButton() {
    isEnable =
        selectedForm != null && templateController.text.trim().isNotEmpty;
    update();
  }

  void onCreate() {
    myAppController.certFormInfo[keyFormId] = selectedForm?[keyId];
    myAppController.certFormInfo[keyNameTemp] = templateController.text.trim();
    myAppController.certFormInfo[keyFormStatus] = FormStatus.template;
    myAppController.certFormInfo[keyFormDataStatus] = FormDataStatus.newTemp;

    // consoleLog(myAppController.certFormInfo[keyFormStatus],
    //     key: 'general_form_data');

    Get.toNamed(selectedForm?[keyRoute]);
  }
}
