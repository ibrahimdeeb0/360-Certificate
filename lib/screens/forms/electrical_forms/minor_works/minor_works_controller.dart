import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../general_exports.dart';

class MinorWorksController extends GetxController {
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
  bool isCertificateCreated = false;
  //
  TextEditingController otherInputController = TextEditingController();
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

  bool r1 = false;
  bool r2 = false;
  DateTime? selectedDate;

  Map<String, dynamic> formData = <String, dynamic>{
    formKeyDeclaration: <String, dynamic>{
      formKeyEngineerName: '',
      formKeyEngineerDate: '',
      formKeyEngineerPosition: '',
      formKeyCustomerName: '',
      formKeyCustomerDate: '',
    },

    // screen1 part1
    formKeyDescriptionMinorWorks: '',
    formKeyDateCompleted: '',
    formKeySystemType: 'N/A',
    formKeyZsDistributionBoard: '',
    // screen1 part2
    formKeyEarthingConductor: 'N/A',
    // screen1 part3
    formKeyWater: 'N/A',
    formKeyGas: 'N/A',
    formKeyOil: 'N/A',
    formKeyProtectiveOther: '',
    formKeyCommentsExistingInstallation: '',
    formKeyPageNo: '',
    formKeyDetailsDepartures: 'N/A',
    formKeyDateCircuitAlteredExtended: '',
    formKeyDateDetailsPermittedExceptions: '',
    formKeyRiskAssessmentAttachedMinor: 'Yes',

    // screen2 part1
    formKeyDBConsumerUnit: '',
    formKeyLocationAndType: '',
    formKeyCircuitNumber: '',
    formKeyCircuitDescription: '',
    formKeyInstallationReferenceMethod: '',
    formKeyNumberSizeOfConductors: '',
    // screen2 part2
    formKeyLive: '',
    formKeyCpc: '',
    // screen2 part3
    formKeyOvercurrentBSEN: '',
    formKeyOvercurrentType: '',
    formKeyOvercurrentRating: '',
    // screen2 part4
    formKeyRCDBSEN: '',
    formKeyRCDType: '',
    formKeyRCDRating: '',
    formKeyRatedResidualOperatingCurrent: '',
    //screen2 part5
    formKeyAFDDBSEN: '',
    formKeyAFDDType: '',
    formKeyAFDDRating: '',
    //screen2 part6
    formKeySPDBSEN: '',
    formKeySPDType: '',

    //screen3 part1
    formKeyContinuityMinor: '',
    formKeyProtectiveConductorInput: '',
    formKeyProtectiveConductorR: '',
    //screen3 part2
    formKeyRingLL: '',
    formKeyRingNN: '',
    formKeyRingCPC: '',
    //screen3 part3
    formKeyInsulationLL: '',
    formKeyInsulationLE: '',
    formKeyTestVoltage: '',
    //screen3 part4
    formKeyPolaritySatisfactory: 'N/A',
    formKeyEarthFaultLoopImpedanceZs: '',
    //screen3 part5
    formKeyRCDTest: 'N/A',
    formKeyRCDDisconnectionTime: '',
    //screen3 part6
    formKeyAFDDTest: 'N/A',
    formKeySPDFunctionality: 'N/A',
    //screen3 part7
    formKeyMultifunction: '',
    //screen3 part8
    formKeyTestInstrumentOther: '',
  };

  Map<String, dynamic> formBody = <String, dynamic>{
    'form_id': '',
    keyData: <String, dynamic>{},
  };

  List<Widget> get listFormSections => <Widget>[
        const MinorWorksPage1(),
        const MinorWorksPage2(),
        const MinorWorksPage3(),
        const MinorWorksPage4(),
      ];

  //*----------------- Images and Notes Attachments ----------------*//
  List<FormImageClass> imagesData = <FormImageClass>[];
  List<FormNoteClass> notesData = <FormNoteClass>[];

  // List<Map<String, dynamic>> formAttachmentsData = <Map<String, dynamic>>[];

  //*------------------------------------------------*//
  @override
  void onInit() {
    super.onInit();
    //*----------initial values------------*//
    formData[formKeyDeclaration][formKeyEngineerName] =
        '${profileController.userProfileData['first_name']} ${profileController.userProfileData['last_name']}';

    onSelectDeclarationDate(
        formKeyDeclaration, formKeyEngineerDate, DateTime.now());

    onSelectDeclarationDate(
        formKeyDeclaration, formKeyCustomerDate, DateTime.now());

    onSelectDate(formKeyDateCompleted, DateTime.now());
    //*----------------------*//
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

      isCertificateCreated = true;

      update();
    }

    //? If Certificate not Created
    if (isCertificateCreated == false) {
      onCreateCertificate();
    }

    update();
  }
  //*---------------------------------------------*//

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
      if (selectedId == listFormSections.length - 1) {
        // last screen
        consoleLog('Last Pages');
        onCompleteCertificate();
      } else if (fromSave) {
        onUpdateCertificate();
      } else {
        selectedId = selectedId + 1;
      }
    }
    update();
    scrollController.jumpTo(0.0);
  }

  void onBack() {
    if (selectedId == 0) {
      // first screen
      Get.back();
    } else {
      selectedId = selectedId - 1;
      update();
    }
    scrollController.jumpTo(0.0);
  }

  void onChangeFormDataValue(String? key, dynamic value) {
    formData[key!] = value;
  }

  void onChangDeclarationData(String? part, String? key, dynamic value) {
    formData[part!][key!] = value;
  }

  void onSelectDeclarationDate(String? part, String? key, DateTime value) {
    formData[part!][key!] = '$value'.formatDate;
    selectedDate = value;
    update();
  }

  void onSelectDate(String? key, DateTime value) {
    formData[key!] = '$value'.formatDate;
    selectedDate = value;
    update();
  }

  void selectedProtective({bool pressIsR1 = false}) {
    if (pressIsR1) {
      r1 = true;
      r2 = false;
    } else {
      r1 = false;
      r2 = true;
    }
    update();
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

  void onSaveData() {
    if (formBody[keyData] == <String, dynamic>{} || formBody[keyData] == null) {
      formBody[keyData] = formData;
    } else {
      formBody[keyData] = <String, dynamic>{};
      formBody[keyData] = formData;
    }
    update();
  }

  // Future<void> onStoreFormImages() async {
  //   hideKeyboard();
  //   if (imagesData.isNotEmpty) {
  //     for (FormImageClass item in imagesData) {
  //       startLoading();

  //       ApiRequest(
  //         path: '/store-image',
  //         method: ApiMethods.post,
  //         className: 'MinorWorksController/onStoreFormImages',
  //         requestFunction: onStoreFormImages,
  //         withLoading: true,
  //         body: await addFormDataToJson(
  //           jsonObject: <String, dynamic>{
  //             'type': 'form',
  //             'type_id': 2,
  //           },
  //           file: item.file,
  //           fileKey: 'image',
  //         ),
  //       ).request(
  //         onSuccess: (dynamic data, dynamic response) {
  //           update();
  //         },
  //         // onError: (error) {},
  //       );
  //     }
  //   }
  // }

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

  // *****************  Press Finish ****************

  Future<void> onCreateCertificate() async {
    hideKeyboard();
    onSaveData();

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
  }
}
