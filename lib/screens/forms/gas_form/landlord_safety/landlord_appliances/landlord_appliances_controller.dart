import '../../../../../general_exports.dart';

class LandlordAppliancesController extends GetxController {
  List<dynamic> applianceData = <dynamic>[];

  Map<String, dynamic>? selectedApplianceData;
  int? index;

  TextEditingController otherInputController = TextEditingController();

  Map<String, dynamic> applianceDetailsData = <String, dynamic>{
    formKeyApplianceNumber: '',
    formKeyApplianceDesignation: '',
    formKeyApplianceType: '',
    formKeyApplianceModel: '',
    formKeyApplianceMake: '',
    formKeyApplianceOwnedBy: '',
    formKeyApplianceInspected: '',
    formKeyApplianceFlueType: '',
    //
    formKeyApplianceOperatingPressure: '',
    formKeyApplianceOperatingOfSafety: '',
    formKeyApplianceVentilationSatisfactory: '',
    formKeyApplianceVisualCondition: '',
    formKeyApplianceFlueOperation: '',
    formKeyApplianceCombustionAnalyses: '',
    formKeyApplianceServiced: '',
    formKeyApplianceSafeToUse: '',
    //
    formKeyApplianceApprovedCo: '',
    formKeyApplianceIsCoAlarm: '',
    formKeyApplianceCOAlarmTest: '',
  };

  @override
  void onInit() {
    super.onInit();
    // applianceDetailsData[formKeyTypeOfWiringA] = index! + 1;
    update();
    applianceData = Get.find<LandlordSafetyController>().applianceData;
  }

  @override
  void onReady() {
    super.onReady();
    if (applianceData.isEmpty) {
      onCreateAppliance();
    }
  }

  void onChangeApplianceValues(String? key, dynamic value) {
    applianceDetailsData[key!] = value;
    updateApplianceData();
  }

  void resetApplianceData() {
    applianceDetailsData = <String, dynamic>{
      formKeyApplianceNumber: '',
      formKeyApplianceDesignation: '',
      formKeyApplianceType: '',
      formKeyApplianceModel: '',
      formKeyApplianceMake: '',
      formKeyApplianceOwnedBy: '',
      formKeyApplianceInspected: '',
      formKeyApplianceFlueType: '',
      //
      formKeyApplianceOperatingPressure: '',
      formKeyApplianceOperatingOfSafety: '',
      formKeyApplianceVentilationSatisfactory: '',
      formKeyApplianceVisualCondition: '',
      formKeyApplianceFlueOperation: '',
      formKeyApplianceCombustionAnalyses: '',
      formKeyApplianceServiced: '',
      formKeyApplianceSafeToUse: '',
      //
      formKeyApplianceApprovedCo: '',
      formKeyApplianceIsCoAlarm: '',
      formKeyApplianceCOAlarmTest: '',
    };
    update();
  }

  void onCreateAppliance() {
    resetApplianceData();
    applianceData.add(
      <String, dynamic>{
        ...applianceDetailsData,
        keyId: applianceData.length + 1,
      },
    );
    update();
  }

  void onDeleteAppliance(dynamic data) {
    applianceData.remove(data);
    update();
  }

  void onSaveApplianceValues() {
    applianceData.add(applianceDetailsData);
  }

  void updateApplianceData() {
    applianceData[index!] = <String, dynamic>{
      ...applianceData[index!],
      ...applianceDetailsData
    };
  }

  void setValues() {
    applianceDetailsData = selectedApplianceData!;
    update();
  }

  bool isSave = false;
  void toggleSave(bool value) {
    isSave = !isSave;
    update();
    if (value == true) {
      applianceDetailsData[formKeyApplianceSafeToUse] = 'yes';
    } else {
      applianceDetailsData[formKeyApplianceSafeToUse] = 'no';
    }

    consoleLog(applianceDetailsData[formKeyApplianceSafeToUse]);
  }

  @override
  void onClose() {
    Get.find<LandlordSafetyController>().applianceData = applianceData;
    consoleLog(Get.find<LandlordSafetyController>().applianceData);
    consoleLog('Save DB Data Done', key: 'Saved_appliances_Data');
    super.onClose();
  }
}
