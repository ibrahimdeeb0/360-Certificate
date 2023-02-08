import '../../general_exports.dart';

class RenderFormController extends GetxController {
  int? formId;
  String? templateName;
  bool? updateTemp = false;

  dynamic formController;

  Future<void> checkTemplateType({dynamic tempData}) async {
    final Map<String, dynamic> currentFormData = homeController.formsData
        .where((dynamic element) => element[keyId] == formId)
        .toList()
        .first;

    // consoleLog('Form Name0: ${currentFormData[keyName]}');
    switch (currentFormData[keyName]) {
      case formNameLandlordHomeownerGazSafetyRecord:
      // formController = LandlordHomeownerGasSafetyRecordController(
      //   isTemplate: true,
      //   templateName: templateName,
      //   tempData: tempData,
      //   updateTemp: updateTemp!,
      // );
      // break;

      // case formNamePortableApplianceTesting:
      //   formController = PortableApplianceTestingController(
      //     isTemplate: true,
      //     templateName: templateName,
      //     tempData: tempData,
      //     updateTemp: updateTemp!,
      //   );
      //   break;

      // case formNameElectricalDangerNotification:
      //   formController = ElectricalDangerNotificationController(
      //     isTemplate: true,
      //     templateName: templateName,
      //     tempData: tempData,
      //     updateTemp: updateTemp!,
      //   );
      //   break;

      // case formNameDomesticElectricalInstallationCertificate:
      //   formController = DomesticElectricalInstallationCertificateController(
      //     isTemplate: true,
      //     templateName: templateName,
      //     tempData: tempData,
      //     updateTemp: updateTemp!,
      //   );
      //   break;

      case formNameDomesticElectricalInstallationConditionReport:
        formController = EicrController(
          isTemplate: true,
          templateName: templateName,
          tempData: tempData,
          updateTemp: updateTemp!,
        );
        break;

      default:
        formController = EicrController(
          isTemplate: true,
          templateName: templateName,
          tempData: tempData,
          updateTemp: updateTemp!,
        );
    }
    update();
    // consoleLog('Form Controller: $formController');
  }

  Future? checkTemplateWidget() {
    final Map<String, dynamic> currentFormData = homeController.formsData
        .where((dynamic element) => element[keyId] == formId)
        .toList()
        .first;

    // consoleLog('Form Name1: ${currentFormData[keyName]}');

    switch (currentFormData[keyName]) {
      // case formNameLandlordHomeownerGazSafetyRecord:
      //   return LandlordHomeownerGasSafetyRecord(
      //     formController: formController,
      //   );
      // case formNamePortableApplianceTesting:
      //   return PortableApplianceTesting(
      //     formController: formController,
      //   );

      // case formNameElectricalDangerNotification:
      //   return ElectricalDangerNotification(
      //     formController: formController,
      //   );

      // case formNameDomesticElectricalInstallationCertificate:
      //   return DomesticElectricalInstallationCertificate(
      //     formController: formController,
      //   );

      // case formNameDomesticElectricalInstallationConditionReport:
      //   return EICR(
      //     formController: formController,
      //   );

      case formNameDomesticElectricalInstallationConditionReport:
        return Get.to(
          () => const EICR(
              // formController: formController,
              ),
        );
      // EICR(
      //   formController: formController,
      // );

      default:
        return Get.to(
          () => const EICR(
              // formController: formController,
              ),
        );
    }
  }
}
