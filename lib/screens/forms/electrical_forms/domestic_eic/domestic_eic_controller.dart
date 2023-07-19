import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../general_exports.dart';

class DomesticEicController extends GetxController {
  int? formId;
  int? certId;
  int? customerId;
  int? siteId;
  bool? isEditForm;
  bool? isTemplate;
  bool? isEditTemplate;
  bool? isUpdateCert;
  dynamic tempData;
  String? templateName;

  int selectedId = 0;
  ScrollController scrollController = ScrollController();
  Uint8List? signatureBytes;
  Uint8List? signatureBytesImage;
  Uint8List? signatureBytes2;
  File? customerSignature;
  Uint8List? customerSignatureBytes;
  String? htmlContent;
  String? pdfFilePath;
  Uuid uuid = const Uuid();

  bool isCertificateCreated = false;

  DateTime? selectedDate;

  List<dynamic> distrBoardDataBase = <dynamic>[];

  Map<String, dynamic> formData = <String, dynamic>{
    formKeyPart1: <String, dynamic>{
      formKeyExtendsOfTheInstallation: '',
      formKeyInstallationNew: 'N/A',
      formKeyInstallationAddition: 'N/A',
      formKeyInstallationAlternation: 'N/A',
    },
    formKeyPart2: <String, dynamic>{
      formKeyAmendedTo: '',
      formKeyAsAmended: '',
    },
    formKeyPart3: <String, dynamic>{
      formKeyNextInspection: '',
    },
    formKeyPart4: <String, dynamic>{
      formKeyCommentsOnInstallation: '',
    },
    formKeyPart5: <String, dynamic>{
      formKeyScheduleOfAdditionalRecords: '',
      formKeyRiskAssessmentAttached: 'N/A',
      formKeyRiskAssessment: '',
    },
    formKeyPart6: <String, dynamic>{
      formKeyTypesTNCS: 'N/A',
      formKeyTypesTNS: 'N/A',
      formKeyTypesTT: 'N/A',
      formKeyTypesOther: 'N/A',
      formKey1Phase2wire: 'N/A',
      formKey1Phase3wire: 'N/A',
      formKey2Phase3wire: 'N/A',
      formKey3Phase4wire: 'N/A',
      formKeyNumberConductorsOther: 'N/A',
      formKeyAcOrDc: '',
      formKeyNominalVoltage: '',
      formKeyUo: '',
      formKeyNominalFrequency: '',
      formKeyExternalEarthFault: '',
      formKeySinglePhaseFault: '',
      formKey3PhaseFault: '',
      formKeyPrimarySupplyBS: '',
      formKeyPrimarySupplyType: '',
      formKeyPrimarySupplyRatedCurrent: '',
      formKeyPrimarySupplyShortCircuit: '',
    },
    formKeyPart7: <String, dynamic>{
      formKeyDistributorFacility: 'N/A',
      formKeyInstallationEarth: 'N/A',
      formKeyEarthElectrodeType: 'N/A',
      formKeyEarthElectrodeLocation: 'N/A',
      formKeyEarthElectrodeResistance: 'N/A',
      formKeyMethodMeasurement: 'N/A',
      formKeyMeasuredZe: '',
      formKeyMaximumDemand: '',
      formKeyNumberOfSmokeAlarms: '',
      formKeyProtectiveMeasures: 'ADS',
    },
    formKeyPart8: <String, dynamic>{
      formKeyMainSwitchTypeBS: '',
      formKeyMainSwitchNumberPoles: '',
      formKeyMainSwitchVoltageRating: '',
      formKeyMainSwitchRatedCurrent: '',
      formKeyRCDMainSwitchOperationCurrent: '',
      formKeyRCDMainSwitchRatedTime: '',
      formKeyRCDMainSwitchOperationTime: '',
      formKeySupplyConductorMaterial: '',
      formKeySupplyConductorCSA: '',
    },
    formKeyPart9: <String, dynamic>{
      formKeyEarthingConductorConductorMaterial: '',
      formKeyEarthingConductorConductorCSA: '',
      formKeyEarthingConductorConductorCheck: 'N/A',
      formKeyMainProtectiveConductorMaterial: '',
      formKeyMainProtectiveConductorCSA: '',
      formKeyMainProtectiveLocation: '',
      formKeyWaterInstallation: 'N/A',
      formKeyGasInstallation: 'N/A',
      formKeyOilInstallation: 'N/A',
      formKeyStructuralSteel: 'N/A',
      formKeyOtherServices: 'N/A',
    },
    formKeyPart10: <String, dynamic>{
      formKeyMFT: '',
      formKeyEarthFaultLoop: '',
      formKeyInsulationResistance: '',
      formKeyContinuity: '',
      formKeyRCD: '',
      formKeyOther: '',
    },
    formKeyPart11: <String, dynamic>{
      formKeySchedule1: 'N/A',
      formKeySchedule2: 'N/A',
      formKeySchedule3: 'N/A',
      formKeySchedule4: 'N/A',
      formKeySchedule5: 'N/A',
      formKeySchedule6: 'N/A',
      formKeySchedule7: 'N/A',
      formKeySchedule8: 'N/A',
      formKeySchedule9: 'N/A',
      formKeySchedule10: 'N/A',
      formKeySchedule11: 'N/A',
      formKeySchedule12: 'N/A',
      formKeySchedule13: 'N/A',
      formKeySchedule14: 'N/A',
    },
    formKeyPart12: <String, dynamic>{
      formKeyDetailsOfCircuits: '',
    },
    formKeyDeclaration: <String, dynamic>{
      formKeyNameInspectionBy: '',
      formKeyDateInspectionBy: '',
      formKeyNameReviewedBy: '',
      formKeyDateReviewedBy: '',
    },
    formKeyDistributionBoardsData: <dynamic>[],
  };

  Map<String, dynamic> formBody = <String, dynamic>{
    'form_id': '',
    keyData: <String, dynamic>{},
  };

  List<Widget> get listFormSections => <Widget>[
        const DomesticEicPage1(),
        const DomesticEicPage2(),
        const DomesticEicPage3(),
        const DomesticEicPage4(),
        const DomesticEicPage5(),
        const DomesticEicPage6(),
        const DomesticEicPage7(),
        const DomesticEicPage8(),
        const DomesticEicPage9(),
        const DomesticEicPage10(),
        const DomesticEicPage11(),
      ];

  //* Circuit - Page Numbers *//
  String pagesNum() {
    if (isTemplate!) {
      if (selectedId == listFormSections.length - 2) {
        return '${listFormSections.length - 1}/${listFormSections.length - 1}';
      } else {
        return '${selectedId + 1}/${listFormSections.length - 1}';
      }
    } else {
      if (selectedId == listFormSections.length) {
        return '${listFormSections.length}/${listFormSections.length}';
      } else {
        return '${selectedId + 1}/${listFormSections.length}';
      }
    }
  }

  bool isFromCertificate = false;

  @override
  void onInit() {
    super.onInit();
    isFromCertificate = Get.arguments?[formKeyFromCertificate] ?? false;
    customerId = myAppController.certFormInfo[keyCustomerId];
    siteId = myAppController.certFormInfo[keySiteId];
    formId = myAppController.certFormInfo[keyFormId];
    formBody[keyFormId] = myAppController.certFormInfo[keyFormId];
    isTemplate =
        myAppController.certFormInfo[keyFormStatus] == FormStatus.template;
    isUpdateCert = myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.editCert;
    isEditTemplate = myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.editTemp;

    consoleLog(myAppController.certFormInfo, key: 'general_form_data');

    //? get Template Data
    if (myAppController.certFormInfo[keyTemplateData] != null &&
        isTemplate! == false) {
      tempData = myAppController.certFormInfo[keyTemplateData][keyData];
    }
    //? set Template Data to form body
    if (myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.setTemp) {
      consoleLog('Set Template', key: 'Set_Template');
      formBody = myAppController.certFormInfo[keyTemplateData][keyData];

      if (formBody[keyData].isNotEmpty) {
        formData = formBody[keyData];
      }
      distrBoardDataBase = formData[formKeyDistributionBoardsData];

      update();
    }
    //? create new template
    if (myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.newTemp) {
      consoleLog('New Template', key: 'New_Template');
      templateName = myAppController.certFormInfo[keyNameTemp];
    }
    //? Update Template
    if (myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.editTemp) {
      consoleLog('Edit Template', key: 'Edit_Template');
      tempData = myAppController.certFormInfo[keyTemplateData];
      templateName = myAppController.certFormInfo[keyNameTemp];
      formBody = myAppController.certFormInfo[keyTemplateData][keyData];

      if (formBody[keyData].isNotEmpty) {
        formData = formBody[keyData];
      }

      distrBoardDataBase = formData[formKeyDistributionBoardsData];

      update();
    }

    //? Edit Certificate
    if (myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.editCert) {
      consoleLog('Edit Certificate', key: 'Edit_Certificate');
      certId = myAppController.certFormInfo[keyCertId];
      formId = myAppController.certFormInfo[keyFormId];
      customerId = myAppController.certFormInfo[keyCustomerId];
      siteId = myAppController.certFormInfo[keySiteId];
      formBody[keyFormId] = myAppController.certFormInfo[keyFormId];
      formBody[keyData] = myAppController.certFormInfo[keyTemplateData];
      //
      if (formBody[keyData].isNotEmpty) {
        formData = formBody[keyData];
      }
      distrBoardDataBase = formData[formKeyDistributionBoardsData];

      isCertificateCreated = true;

      update();
    }

    formData[formKeyDeclaration][formKeyNameInspectionBy] =
        '${profileController.userDataProfile['first_name']} ${profileController.userDataProfile['last_name']}';
    update();
  }

  void onSelectDate(String? part, String? key, DateTime value) {
    formData[part!][key!] = '$value'.split(' ')[0];
    update();
    selectedDate = value;
  }

  void onChangeFormDataValue(String? part, String? key, dynamic value) {
    formData[part!][key!] = value;
  }

  void onNext({bool fromSave = false}) {
    if (isTemplate!) {
      if (listFormSections.length - 2 == selectedId) {
        consoleLog('Last Pages In Template');
        onSaveTemplate();
      } else {
        selectedId = selectedId + 1;
        update();
      }
    } else {
      if (listFormSections.length - 1 == selectedId) {
        consoleLog('Last Pages');
        onCompleteCertificate();
      } else {
        if (selectedId == 0 && (isCertificateCreated == false)) {
          onCreateCertificate();
          isCertificateCreated = true;
        } else if (fromSave && (isCertificateCreated == false)) {
          onCreateCertificate();
        } else if (fromSave && (isCertificateCreated == true)) {
          onUpdateCertificate();
        } else {
          selectedId = selectedId + 1;
        }

        update();
      }
    }

    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void onPressBack() {
    if (selectedId > 0) {
      selectedId = selectedId - 1;
      update();
    } else {
      Get.back();
    }

    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  String finalPageButton() {
    if (isTemplate!) {
      if (selectedId < listFormSections.length - 2) {
        return 'Next';
      } else {
        return 'Save';
      }
    } else {
      if (selectedId < listFormSections.length - 1) {
        return 'Next';
      } else {
        return 'Complete';
      }
    }
  }

  String textRiskAssessment =
      'OMISSION OF RCD FOR SOCKET \nOUTLET(S) NOT EXCEEDING 20A \n\nDate of Risk Assessment: 26-04-2023 \n\nPerson(s) Who Could Be Harmed?: \n\nWhat is Being Done To Control The Risk?: \n\nAction to be Taken By Who?: \n\nWhen Should Action Be Taken?: \n\nRisk Assessment Completed By: Test2 Position: Testing';

  void setRiskText() {
    formData[formKeyPart5][formKeyRiskAssessment] = textRiskAssessment;
    update();
  }

  // *****************  signature functions **************** //

  // ***************** add  **************** //
  Future<void> setImage(String bytes) async {
    if (bytes.isNotEmpty) {
      final Uint8List convertedBytes = base64Decode(bytes);
      signatureBytes = convertedBytes;
      update();
    } else {
      signatureBytes = null;
      update();
    }
    // storeFormData();
  }

  Future<void> setCustomerImage(String bytes) async {
    if (bytes.isNotEmpty) {
      final Uint8List convertedBytes = base64Decode(bytes);
      signatureBytes2 = convertedBytes;
      update();
    } else {
      signatureBytes2 = null;
      update();
    }
    // storeFormData();
  }

  // ***************** clear  ****************
  void clearSignature() {
    signatureBytes = null;
    signatureBytesImage = null;
    // storeFormData();
    update();
  }

  void clearCustomerSignature() {
    signatureBytes2 = null;
    customerSignatureBytes = null;
    // storeFormData();
    update();
  }

  // ***************** send   ****************
  Future<void> onSendSignatureReportForm() async {
    if (signatureBytes != null) {
      startLoading();
      final Directory directory = await getApplicationDocumentsDirectory();
      final File pathOfImage =
          await File('${directory.path}/sign.png').create();
      await pathOfImage.writeAsBytes(signatureBytes!);

      ApiRequest(
        method: ApiMethods.post,
        path: addSignature,
        className:
            'ElectricalInstallationConditionReportController/onSendSignatureReportForm',
        requestFunction: onSendSignatureReportForm,
        body: await addFormDataToJson(
          file: pathOfImage,
          jsonObject: <String, dynamic>{},
          fileKey: 'sign',
        ),
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          signatureBytesImage = signatureBytes;
          update();
          dismissLoading();
          Get.back();
        },
      );
    } else {
      showMessage(
        description: 'Please draw your signature',
        textColor: AppColors.red,
      );
    }
  }

  // convert customer Signature to File
  Future<void> saveCustomerSignature() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File pathOfImage =
        await File('${directory.path}/${uuid.v1()}_customer_sign.png').create();

    if (signatureBytes2 != null) {
      customerSignature = await pathOfImage.writeAsBytes(signatureBytes2!);

      if (signatureBytes2 != null) {
        customerSignatureBytes = signatureBytes2!;
      }
    } else {
      showMessage(
        description: 'Please draw Contractor signature',
        textColor: AppColors.red,
      );
    }

    update();
    consoleLog(customerSignature, key: 'customerSignature');
    Get.back();
  }

  void onSaveData() {
    if (formBody[keyData] == <String, dynamic>{} || formBody[keyData] == null) {
      formBody[keyData] = formData;
    } else {
      formBody[keyData] = <String, dynamic>{};
      formBody[keyData] = formData;
    }
    update();
  }

  void onSaveApplianceData() {
    // formKeyDistributionBoardsData
    formData[formKeyDistributionBoardsData] = distrBoardDataBase;
  }

  // *****************  Press Finish ****************

  void testData() {
    hideKeyboard();
    onSaveData();
    onSaveApplianceData();
    consoleLogPretty(formBody);
  }

  Future<void> onCreateCertificate() async {
    hideKeyboard();
    onSaveData();
    onSaveApplianceData();

    final Map<String, dynamic> certData = <String, dynamic>{
      'customer_id': customerId,
      'status_id': idPending,
      'site_id': siteId,
      ...formBody,
    };

    consoleLogPretty(certData);

    ApiRequest(
      method: ApiMethods.post,
      path: keyCreateForm,
      className: 'LandlordSafetyController/onCreateCertificate',
      requestFunction: onCreateCertificate,
      // withLoading: true,
      formatResponse: true,

      body: certData,
      // await addFormDataToJson(
      //   fileKey: 'customer_signature',
      //   file: customerSignature,
      //   jsonObject: certData,
      // ),
    ).request(
      onSuccess: (dynamic data, dynamic response) async {
        certId = data['form_data']['id'];
        update();
      },
    );
  }

  Future<void> onUpdateCertificate() async {
    hideKeyboard();
    onSaveData();
    onSaveApplianceData();

    final Map<String, dynamic> certData = <String, dynamic>{
      ...formBody,
      'customer_id': customerId,
      'status_id': idInProgress,
      'site_id': siteId,
    };

    startLoading();
    ApiRequest(
      method: ApiMethods.post,
      path: '/certificates/$certId/update',
      className: 'EicrController/onUpdateCertificate',
      requestFunction: onUpdateCertificate,
      // withLoading: true,
      body: certData,
    ).request(
      onSuccess: (dynamic data, dynamic response) async {
        myAppController.clearCertFormInfo();
        // certificatesController.getAllCert();
        // homeController.getCertCount();
        profileController.getUserProfileData();
        homeController.getAllUserData();

        if (isFromCertificate) {
          Get.back();
          Get.find<CertificateDetailsController>().getCompetedCert();
        } else {
          Get.offNamed(
            routeCertificateDetails,
            arguments: <String, dynamic>{
              keyId: certId,
              'customer_id': customerId,
              'site_id': siteId,
            },
          );
        }
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
  }

  Future<void> onCompleteCertificate() async {
    hideKeyboard();
    onSaveData();
    onSaveApplianceData();

    final Map<String, dynamic> certData = <String, dynamic>{
      ...formBody,
      'customer_id': customerId,
      'status_id': idCompleted,
      'site_id': siteId,
    };

    if (signatureBytes != null) {
      startLoading();
      ApiRequest(
        method: ApiMethods.post,
        path: '/certificates/$certId/update',
        className: 'LandlordSafetyController/onCompleteCertificate',
        formatResponse: true,
        requestFunction: onCompleteCertificate,
        // withLoading: true,

        body: signatureBytes2 != null
            ? await addFormDataToJson(
                fileKey: 'customer_signature',
                file: customerSignature,
                jsonObject: certData,
              )
            : certData,
      ).request(onSuccess: (dynamic data, dynamic response) async {
        myAppController.clearCertFormInfo();
        // certificatesController.getAllCert();
        profileController.getUserProfileData();
        homeController.getAllUserData();

        if (isFromCertificate) {
          Get.back();
          Get.find<CertificateDetailsController>().getCompetedCert();
        } else {
          Get.offNamed(
            routeCertificateDetails,
            arguments: <String, dynamic>{
              keyId: certId,
              'customer_id': customerId,
              'site_id': siteId,
            },
          );
        }
      }, onError: (dynamic error) {
        dismissLoading();
      });
    } else {
      if (!Get.isSnackbarOpen) {
        showMessage(
          description: 'All signatures required',
          textColor: AppColors.red,
        );
      }
    }
  }

  // *****************  Template ****************

  void onSaveTemplate() {
    consoleLog('Save Template');
    openDialog(
      onCancel: Get.back,
      onConfirm: storeTemplate,
    );
  }

  Future<void> storeTemplate() async {
    hideKeyboard();
    onSaveData();
    onSaveApplianceData();

    startLoading();
    if (isEditTemplate!) {
      // ignore: missing_required_param
      ApiRequest(
        method: ApiMethods.put,
        path: '/forms/templates/${tempData[keyId]}/update',
        className: 'LandlordSafetyController/storeTemplate',
        requestFunction: storeTemplate,
        body: <String, dynamic>{
          'name': templateName,
          'form_id': tempData['form_id'],
          'data': formBody,
        },
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          myAppController.clearCertFormInfo();
          Get.put(FormTemplateController()).getFormsTemplates();
          Get
            ..back()
            ..back();
        },
      );
    } else {
      // ignore: missing_required_param
      ApiRequest(
        method: ApiMethods.post,
        path: keyStoreFormTemplate,
        className: 'LandlordSafetyController/storeTemplate',
        requestFunction: storeTemplate,
        body: <String, dynamic>{
          'name': templateName,
          'form_id': formId,
          'data': formBody,
        },
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          myAppController.clearCertFormInfo();
          Get.put(FormTemplateController()).getFormsTemplates();
          // dismissLoading();
          Get
            ..back()
            ..back()
            ..back();
        },
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    myAppController.clearCertFormInfo();
    scrollController.dispose();
  }
}
