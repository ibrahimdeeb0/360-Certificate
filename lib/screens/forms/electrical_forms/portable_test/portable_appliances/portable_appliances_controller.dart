import '../../../../../general_exports.dart';

class PortableAppliancesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  TextEditingController otherInputController = TextEditingController();
  late TabController tabController;
  int tabIndex = 0;
  int? applianceIndex;

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
    // formKeyTotalApplianceNumber: '',
    // formKeyAppliancePassed: '',
    // formKeyApplianceFailed: '',
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

  List<dynamic> appliancesData = <dynamic>[];

  Map<String, dynamic>? selectedApplianceSummary;
  Map<String, dynamic>? selectedApplianceData;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabItems.length, vsync: this);
    appliancesData = Get.find<PortableTestController>().applianceData;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    if (appliancesData.isEmpty) {
      onCreateAppliance();
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
      formKeyTestResult: 'PASSED',
      formKeyRepairCode: '',
    };
    update();
  }

  // **------  -----------** //
  void onCreateAppliance() {
    resetApplianceData();
    appliancesData.add(
      <String, dynamic>{
        ...applianceDetails,
        // keyId: appliancesData.length + 1,
      },
    );
    update();
    consoleLogPretty(appliancesData, key: 'appliances_data');
  }

  void onDeleteAppliance(dynamic data) {
    appliancesData.remove(data);
    update();
  }

  void onSaveApplianceValues() {
    appliancesData.add(applianceDetails);
  }

  void updateApplianceData() {
    appliancesData[applianceIndex!] = <String, dynamic>{
      ...appliancesData[applianceIndex!],
      ...applianceDetails
    };
  }

  void setValues() {
    applianceDetails = selectedApplianceData!;
    update();
  }

  void setAppliancesNumberID() {
    for (dynamic data in appliancesData) {
      data['appliance_number'] = appliancesData.indexOf(data) + 1;
    }
  }

  void setPassFailData() {
    applianceSummary[formKeyAppliancePassed] = appliancesData
        .where((dynamic element) => element['test_result'] == 'PASSED')
        .toList()
        .length;

    applianceSummary[formKeyApplianceFailed] = appliancesData
        .where((dynamic element) => element['test_result'] != 'PASSED')
        .toList()
        .length;

    applianceSummary[formKeyTotalApplianceNumber] = appliancesData.length;

    consoleLogPretty(applianceSummary, key: 'appliance_summary');
  }

  @override
  void onClose() {
    tabController.dispose();
    setAppliancesNumberID();
    setPassFailData();
    Get.find<PortableTestController>().applianceData = appliancesData;
    consoleLog(
        Get.find<PortableTestController>().applianceData = appliancesData,
        key: 'appliances_data');
    super.onClose();
  }
}
