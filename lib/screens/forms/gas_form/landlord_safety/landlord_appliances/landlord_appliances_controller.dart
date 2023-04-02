import '../../../../../general_exports.dart';

class LandlordAppliancesController extends GetxController {
  List<dynamic> applianceData = <dynamic>[];

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

  void onChangeApplianceValues(String? key, dynamic value) {
    applianceDetailsData[key!] = value;
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
}
