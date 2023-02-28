import '../../../general_exports.dart';

class AddFormTemplateController extends GetxController {
  TextEditingController templateController = TextEditingController();

  List<dynamic> listAllForms = <dynamic>[
    <String, dynamic>{
      keyId: 1,
      keyName: 'Portable Appliance Testing',
    },
    <String, dynamic>{
      keyId: 3,
      keyName: 'Domestic Electrical Installation Certificate'
    },
    <String, dynamic>{
      keyId: 4,
      keyName: 'Electrical Danger Notification',
    },
    <String, dynamic>{
      keyId: 5,
      keyName: 'Domestic Electrical installation Condition report',
    },
    <String, dynamic>{
      keyId: 9,
      keyName: 'Landlord/Homeowner Gas Safety Record',
    },
  ];

  List<dynamic> allServices = <dynamic>[];

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

  void onCreate() {
    myAppController.certFormInfo[keyFormId] = selectedForm?[keyId];
    myAppController.certFormInfo[keyNameTemp] = templateController.text.trim();
    myAppController.certFormInfo[keyFormStatus] = FormStatus.template;
    myAppController.certFormInfo[keyFormDataStatus] = FormDataStatus.newTemp;

    consoleLog(myAppController.certFormInfo[keyFormStatus],
        key: 'general_form_data');

    Get.toNamed(routeFormEICR);
  }
}
