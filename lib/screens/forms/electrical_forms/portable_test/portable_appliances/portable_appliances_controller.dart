import '../../../../../general_exports.dart';

class PortableAppliancesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  TextEditingController otherInputController = TextEditingController();
  late TabController tabController;
  int tabIndex = 0;

  List<dynamic> tabItems = <dynamic>[
    <String, dynamic>{
      'text': 'Appliance Details',
    },
    <String, dynamic>{
      'text': 'Test Result',
    },
  ];

  List<dynamic> tabViewItems = <dynamic>[
    const ApplianceDetailsPage1(),
    const ApplianceDetailsPage2(),
  ];

  Map<String, dynamic> applianceSummary = <String, dynamic>{
    formKeyTotalApplianceNumber: '',
    formKeyAppliancePassed: '',
    formKeyApplianceFailed: '',
  };

  Map<String, dynamic> applianceDetails = <String, dynamic>{
    formKeyTotalApplianceNumber: '',
    formKeyAppliancePassed: '',
    formKeyApplianceFailed: '',
    //
    formKeyApplianceNumber: '',
    formKeyApplianceDescription: '',
    formKeyApplianceLocation: '',
    formKeyApplianceClass: '',
    formKeyFormalInspection: '',
    formKeyCombinedInspectionTest: '',
    formKeyPolarity: 'N/A',
    formKeyMeasuredResults: '', //
    formKeyEarthContinuity: '',
    formKeyInsulationTest: '',
    formKeyLoadTest: '',
    formKeyEarthLeakageTest: '',
    formKeyApplianceID: '',
    formKeyVisualCheck: '',
    formKeyFuseRatingAmps: '',
    formKeyTestResult: 'PASS',
    formKeyRepairCode: '',
  };

  List<dynamic> appliancesArray = <dynamic>[];

  Map<String, dynamic>? selectedApplianceSummary;
  Map<String, dynamic>? selectedApplianceData;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabItems.length, vsync: this);
    appliancesArray = Get.find<PortableTestController>().applianceData;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    if (appliancesArray.isEmpty) {
      // onCrateParentData();
    }
  }

  void onSelectTab(int index) {
    tabIndex = index;
    update();
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void onChangeParentValues(String? key, dynamic value) {
    applianceSummary[key!] = value;
  }

  void onChangeChildeValues(String? key, dynamic value) {
    applianceDetails[key!] = value;
  }

  void onChangeResultValues(String? key, dynamic value) {
    applianceDetails[key!] = value;
    update();
    consoleLog(applianceDetails[key]);
  }

  //**----- (Reset Data) Parent and Childe data ----**/
  void resetApplianceData() {
    applianceDetails = <String, dynamic>{
      formKeyTotalApplianceNumber: '',
      formKeyAppliancePassed: '',
      formKeyApplianceFailed: '',
      //
      formKeyApplianceNumber: '',
      formKeyApplianceDescription: '',
      formKeyApplianceLocation: '',
      formKeyApplianceClass: '',
      formKeyFormalInspection: '',
      formKeyCombinedInspectionTest: '',
      formKeyPolarity: 'N/A',
      formKeyMeasuredResults: '', //
      formKeyEarthContinuity: '',
      formKeyInsulationTest: '',
      formKeyLoadTest: '',
      formKeyEarthLeakageTest: '',
      formKeyApplianceID: '',
      formKeyVisualCheck: '',
      formKeyFuseRatingAmps: '',
      formKeyTestResult: 'PASS',
      formKeyRepairCode: '',
    };
    update();
  }

  // **------  -----------** //
  // void onCreateAppliance() {
  //   resetApplianceData();
  //   applianceData.add(
  //     <String, dynamic>{
  //       ...applianceDetailsData,
  //       keyId: applianceData.length + 1,
  //     },
  //   );
  //   update();
  // }

  @override
  void onClose() {
    tabController.dispose();
    Get.find<PortableTestController>().applianceData = appliancesArray;
    consoleLog(
        Get.find<PortableTestController>().applianceData = appliancesArray);
    // consoleLog('Save DB Data Done', key: 'Saved_DB_Data');
    super.onClose();
  }
}
