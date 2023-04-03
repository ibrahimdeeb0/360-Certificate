import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../general_exports.dart';

class LandlordSafetyController extends GetxController {
  int? formId;
  int? certId;
  int? customerId;
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

  bool isCertificateCreated = true;

  DateTime? selectedDate;
  void onSelectDate(String? part, String? key, DateTime value) {
    formData[part!][key!] = '$value'.split(' ')[0];
    update();
    selectedDate = value;
  }

  List<dynamic> applianceData = <dynamic>[];

  Map<String, dynamic> formData = <String, dynamic>{
    formKeyPart1: <String, dynamic>{
      formKeyNameP1: '',
      formKeyAddress1P1: '',
      formKeyAddress2P1: '',
      formKeyPostcodeP1: '',
    },
    formKeyPart2: <String, dynamic>{
      formKeyAddress1P2: '',
      formKeyAddress2P2: '',
      formKeyPostcodeP2: '',
    },
    formKeyPart3: <String, dynamic>{
      formKeyDetailsOfWorkP3: '',
    },
    formKeyPart4: <String, dynamic>{
      formKeyPipeworkVisualP4: 'N/A',
      formKeyPipeworkOutcomeSupplyP4: 'N/A',
      formKeyPipeworkEmergencyP4: 'N/A',
      formKeyPipeworkOutcomeTightnessP4: 'N/A',
      formKeyPipeworkProtectiveP4: 'N/A',
    },
    formKeyPart5: <String, dynamic>{
      formKeyDefectsIdentified1: '',
      formKeyDefectsIdentified2: '',
      formKeyDefectsIdentified3: '',
      formKeyDefectsIdentified4: '',
      formKeyDefectsIdentified5: '',
      //
      formKeyWarningNotice1: 'N/A',
      formKeyWarningNotice2: 'N/A',
      formKeyWarningNotice3: 'N/A',
      formKeyWarningNotice4: 'N/A',
      formKeyWarningNotice5: 'N/A',
    },
    formKeyPart6: <String, dynamic>{
      formKeyRecordRemedialAction: '',
    },
    formKeyPart7: <String, dynamic>{
      formKeyNextSafetyCheckBy: '',
    },
    formKeyDeclaration: <String, dynamic>{
      formKeyRecordIssueBy: '',
      formKeyReceivedBy: '',
    },
    formKeyAppliance: <dynamic>[],
  };

  Map<String, dynamic> formBody = <String, dynamic>{
    'form_id': '',
    formKeyFormData: <String, dynamic>{},
  };

  List<Widget> get listFormSections => <Widget>[
        // controller: Get.put(LandlordSafetyController())
        const LandlordPage1(),
        const LandlordPage2(),
        const LandlordPage3(),
        const LandlordPage4(),
        const LandlordPage5(),
      ];

  //* Circuit - Page Numbers *//
  String pagesNum() {
    if (selectedId == listFormSections.length) {
      return '${listFormSections.length}/${listFormSections.length}';
    } else {
      return '${selectedId + 1}/${listFormSections.length}';
    }
  }

  void onChangeFormDataValue(String? part, String? key, dynamic value) {
    formData[part!][key!] = value;
  }

  void onNext() {
    if (listFormSections.length - 1 == selectedId) {
      consoleLog('Last Pages');
    } else {
      selectedId = selectedId + 1;
      update();
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
    if (selectedId < listFormSections.length - 1) {
      return 'Next';
    } else {
      return 'Complete';
    }
    // if (isTemplate!) {
    //   if (selectedId == 21) {
    //     return 'Save';
    //   } else {
    //     return 'Next';
    //   }
    // } else {
    //    if (selectedId < listFormSections.length - 1) {
    //     return 'Next';
    //   } else {
    //     return 'Complete';
    //   }
    // }
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
    if (formBody[formKeyFormData] == <String, dynamic>{} ||
        formBody[formKeyFormData] == null) {
      formBody[formKeyFormData] = formData;
    } else {
      formBody[formKeyFormData] = <String, dynamic>{};
      formBody[formKeyFormData] = formData;
    }
    update();
  }

  void onSaveApplianceData() {
    formData[formKeyAppliance] = applianceData;
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
      ...formBody,
      'customer_id': customerId,
      'status_id': idPending,
    };

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
      'status_id': idPending,
    };

    startLoading();
    ApiRequest(
      method: ApiMethods.post,
      path: '/certificates/$certId/update',
      className: 'EicrController/onUpdateCertificate',
      requestFunction: onUpdateCertificate,
      // withLoading: true,
      body: certData,
    ).request(onSuccess: (dynamic data, dynamic response) async {
      myAppController.clearCertFormInfo();
      certificatesController.getAllCert();
      homeController.getCertCount();
      profileController.getProfileData();
      Get.offAllNamed(routeHomeBottomBar);
    }, onError: (dynamic error) {
      dismissLoading();
    });
  }

  Future<void> onCompleteCertificate() async {
    hideKeyboard();
    onSaveData();
    onSaveApplianceData();

    final Map<String, dynamic> certData = <String, dynamic>{
      ...formBody,
      'customer_id': customerId,
      'status_id': idPending,
    };

    if (signatureBytes != null && signatureBytes2 != null) {
      startLoading();
      ApiRequest(
        method: ApiMethods.post,
        path: '/certificates/$certId/update',
        className: 'LandlordSafetyController/onCompleteCertificate',
        formatResponse: true,
        requestFunction: onCompleteCertificate,
        // withLoading: true,

        body: await addFormDataToJson(
          fileKey: 'customer_signature',
          file: customerSignature,
          jsonObject: certData,
        ),
      ).request(onSuccess: (dynamic data, dynamic response) async {
        myAppController.clearCertFormInfo();
        certificatesController.getAllCert();
        homeController.getCertCount();
        profileController.getProfileData();
        Get.offAllNamed(routeHomeBottomBar);
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

  @override
  void onInit() {
    super.onInit();
    customerId = myAppController.certFormInfo[keyCustomerId];
    formId = myAppController.certFormInfo[keyFormId];
    formBody[keyFormId] = myAppController.certFormInfo[keyFormId];
    isTemplate =
        myAppController.certFormInfo[keyFormStatus] == FormStatus.template;
    isUpdateCert = myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.editCert;
    isEditTemplate = myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.editTemp;

    //? get Template Data
    if (myAppController.certFormInfo[keyTemplateData] != null &&
        isTemplate! == false) {
      tempData = myAppController.certFormInfo[keyTemplateData][keyData];
    }
    //? set Template Data to form body
    // if (myAppController.certFormInfo[keyFormDataStatus] ==
    //     FormDataStatus.setTemp) {
    //   formBody = myAppController.certFormInfo[keyTemplateData][keyData];

    //   if (formBody[keyData][formKeyGazSafetyData].isNotEmpty) {
    //     gazSafetyData = formBody[keyData][formKeyGazSafetyData][0];
    //   }
    //   distrBoardDataBase = gazSafetyData[allDistributionBoardData];
    //   observationsDataBase = gazSafetyData[allObservationData];
    //   update();
    // }
    //? create new template
    if (myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.newTemp) {
      templateName = myAppController.certFormInfo[keyNameTemp];
    }
    // Update Template
    // if (myAppController.certFormInfo[keyFormDataStatus] ==
    //     FormDataStatus.editTemp) {
    //   tempData = myAppController.certFormInfo[keyTemplateData];
    //   templateName = myAppController.certFormInfo[keyNameTemp];
    //   formBody = myAppController.certFormInfo[keyTemplateData][keyData];

    //   if (formBody[keyData][formKeyGazSafetyData].isNotEmpty) {
    //     gazSafetyData = formBody[keyData][formKeyGazSafetyData][0];
    //   }
    //   distrBoardDataBase = gazSafetyData[allDistributionBoardData];
    //   observationsDataBase = gazSafetyData[allObservationData];
    //   update();
    // }

    // Edit Certificate
    if (myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.editCert) {
      certId = myAppController.certFormInfo[keyCertId];
      formId = myAppController.certFormInfo[keyFormId];
      customerId = myAppController.certFormInfo[keyCustomerId];
      formBody[keyFormId] = myAppController.certFormInfo[keyFormId];
      formBody[keyData] = myAppController.certFormInfo[keyTemplateData];
      //
      if (formBody[formKeyFormData].isNotEmpty) {
        formData = formBody[formKeyFormData];
      }
      applianceData = formBody[formKeyAppliance];

      isCertificateCreated = false;

      update();
    }
  }
}
