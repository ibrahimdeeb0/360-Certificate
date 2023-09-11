import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../general_exports.dart';

class LeisureIndustryController extends GetxController {
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

  bool isFromCertificate = false;

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

  List<dynamic> applianceData = <dynamic>[];

  FormImagesAttachmentsController formImagesAttachmentsController =
      FormImagesAttachmentsController();
  FormNotesAttachmentsController formNotesAttachmentsController =
      FormNotesAttachmentsController();

  List<String> get listSectionsTitle => <String>[
        'Pipework Inspection Details',
        'Tightness Test Details',
        'Test Gas',
        'Audible CO Alarm',
        'Engineers Details',
      ];

  Map<String, dynamic> formData = <String, dynamic>{
    formKeyPart1: <String, dynamic>{
      formKeyDetailsOfWorkP1: '',
    },
    formKeyPart2: <String, dynamic>{
      formKeyPipeworkVisualP2: 'N/A',
      formKeyPipeworkOutcomeSupplyP2: 'N/A',
      formKeyPipeworkEmergencyP2: 'N/A',
      formKeyPipeworkOutcomeTightnessP2: 'N/A',
      formKeyPipeworkProtectiveP2: 'N/A',
    },
    formKeyPart3: <String, dynamic>{
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
    formKeyPart4: <String, dynamic>{
      formKeyRecordRemedialAction: '',
    },
    formKeyPart5: <String, dynamic>{
      formKeyNextSafetyCheckBy: '',
    },
    formKeyPart6: <String, dynamic>{
      formKeyApplianceApproved1: 'N/A',
      formKeyApplianceIsCo1: 'N/A',
      formKeyApplianceTestCo1: 'N/A',
      formKeyApplianceApproved2: 'N/A',
      formKeyApplianceIsCo2: 'N/A',
      formKeyApplianceTestCo2: 'N/A',
      formKeyApplianceApproved3: 'N/A',
      formKeyApplianceIsCo3: 'N/A',
      formKeyApplianceTestCo3: 'N/A',
      formKeyApplianceApproved4: 'N/A',
      formKeyApplianceIsCo4: 'N/A',
      formKeyApplianceTestCo4: 'N/A',
      formKeyApplianceApproved5: 'N/A',
      formKeyApplianceIsCo5: 'N/A',
      formKeyApplianceTestCo5: 'N/A',

      ///
      formKeyCylinder: 'N/A',
      formKeyGasInstallationPipework: 'N/A',
      formKeyGasTightnessSatisfactory: 'N/A',
      formKeyEmergencyControl: 'N/A',
      formKeyLPGOperating: '',
      formKeyLPGLockup: '',
    },
    formKeyDeclaration: <String, dynamic>{
      formKeyRecordIssueBy: '',
      formKeyReceivedBy: '',
    },
    formKeyAppliance: <dynamic>[],
  };

  Map<String, dynamic> formBody = <String, dynamic>{
    'form_id': '',
    keyData: <String, dynamic>{},
  };

  List<Widget> get listFormSections => <Widget>[
        const LeisurePage2(),
        const LeisurePage3(),
        const LeisurePage4(),
        const LeisurePage5(),
        const LeisurePage6(),
      ];

  //*---------------------------------------------*//

  void onPressNext({bool fromSave = false}) {
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
        if (selectedId == listFormSections.length - 1) {
          // last screen
          consoleLog('Last Pages');
          onCompleteCertificate();
        } else if (fromSave) {
          onUpdateCertificate();
        } else {
          selectedId = selectedId + 1;
        }
        update();
        scrollController.jumpTo(0.0);
      }
    }

    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

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
      applianceData = formBody[keyData][formKeyAppliance];

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

      applianceData = formData[formKeyAppliance];

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
      applianceData = formBody[keyData][formKeyAppliance];

      isCertificateCreated = true;

      update();
    }

    formData[formKeyDeclaration][formKeyRecordIssueBy] =
        '${profileController.userProfileData['first_name']} ${profileController.userProfileData['last_name']}';
    if (myAppController.certFormInfo[keyFormDataStatus] ==
            FormDataStatus.newForm ||
        myAppController.certFormInfo[keyFormDataStatus] ==
            FormDataStatus.newTemp) {
      onSelectDate(formKeyDeclaration, formKeyDateInspectionBy, DateTime.now());
    }

    //? If Certificate not Created need to create it
    if (isCertificateCreated == false && !(isTemplate!)) {
      onCreateCertificate();
    }
    update();
  }

  void onSelectDate(String? part, String? key, DateTime value) {
    formData[part!][key!] = DateFormat('dd-MM-yyyy').format(value);
    // formData[part!][key!] = '$value'.split(' ')[0];
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
        certificatesController.getAllCert();
        homeController.getAllUserData();
        // profileController.getUserProfileData();

        if (isFromCertificate) {
          Get.back();
          Get.find<CertificateDetailsController>().getCertificateDetails();
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
        className: 'LeisureIndustryController/onCompleteCertificate',
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
        // homeController.getCertCount();
        profileController.getUserProfileData();
        homeController.getAllUserData();

        if (isFromCertificate) {
          Get.back();
          Get.find<CertificateDetailsController>().getCertificateDetails();
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
        className: 'LeisureIndustryController/storeTemplate',
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
        className: 'LeisureIndustryController/storeTemplate',
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
  }
}
