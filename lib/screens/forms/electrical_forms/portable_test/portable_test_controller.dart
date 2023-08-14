import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../general_exports.dart';

class PortableTestController extends GetxController {
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
  File? customerSignature;
  Uuid uuid = const Uuid();

  bool isFromCertificate = false;

  bool isCertificateCreated = false;

  DateTime? selectedDate;

  //
  FormImagesAttachmentsController formImagesAttachmentsController =
      FormImagesAttachmentsController();
  FormNotesAttachmentsController formNotesAttachmentsController =
      FormNotesAttachmentsController();

  List<dynamic> applianceData = <dynamic>[];
  Map<String, dynamic> applianceSummaryData = <String, dynamic>{};

  Map<String, dynamic> formData = <String, dynamic>{
    formKeyLimitationsTesting: <String, dynamic>{
      formKeyLimitationsOfTesting: '',
    },
    formKeyDeclaration: <String, dynamic>{
      formKeyLimitationsAgreedTesting: '',
      formKeyNameInspectionBy: '',
      formKeyDateInspectionBy: '',
    },
    formKeyApplianceSummaryData: <dynamic, dynamic>{},
    formKeyAppliance: <dynamic>[],
  };

  Map<String, dynamic> formBody = <String, dynamic>{
    'form_id': '',
    keyData: <String, dynamic>{},
  };

  List<Widget> get listFormSections => <Widget>[
        const PortableTestPage1(),
        const PortableTestPage2(),
      ];

  List<String> get listSectionsTitle => <String>[
        'Part 1 : Appliances Details',
        'Part 2 : Signature  Details',
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

    formData[formKeyDeclaration][formKeyNameInspectionBy] =
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
    formData[part!][key!] = '$value'.formatDate;
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

  void onPressBack() {
    if (selectedId > 0) {
      selectedId = selectedId - 1;
      update();
    } else {
      Get.bottomSheet(
        CancelAddCustomerSheet(
          message: 'Would you like cancel process',
          onPressFirstBtn: () {
            hideKeyboard();
            Get
              ..back()
              ..back();
          },
        ),
        isScrollControlled: true,
      );
    }

    if (selectedId != 0 && scrollController.positions.isNotEmpty) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    }
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

  // *****************  Store Form Attachments Functions **************** //
  bool isStorImgDone = false;
  Future<void> onStoreFormImagesAttachment() async {
    // consoleLog('store Images Attachments');
    hideKeyboard();
    if (formImagesAttachmentsController.imagesData.isNotEmpty) {
      for (FormImageClass item in formImagesAttachmentsController.imagesData) {
        ApiRequest(
          method: ApiMethods.post,
          path: '/certificates/create/attachment',
          className: 'PortableTestController/onStoreFormImagesAttachment',
          requestFunction: onStoreFormImagesAttachment,
          withLoading: true,
          body: <String, dynamic>{
            'certificate_id': certId,
            'image_id': item.imageId,
            // true included ? no exclude : yes exclude
            'exclude': item.isNotIncluded ? 'yes' : 'no',
            // 'note_title': '',
            if (item.note != null) 'note_body': item.note,
            'attachment_type_id': 1
          },
        ).request(
          onSuccess: (dynamic data, dynamic response) {
            update();
          },
        );
      }

      isStorImgDone = true;
      onStoreFormNotesAttachment();
    } else {
      isStorImgDone = true;
      onStoreFormNotesAttachment();
    }
  }

  //
  bool isStorNoteDone = false;
  Future<void> onStoreFormNotesAttachment() async {
    // consoleLog('store Notes Attachments');
    hideKeyboard();
    if (formNotesAttachmentsController.notesData.isNotEmpty) {
      for (FormNoteClass item in formNotesAttachmentsController.notesData) {
        ApiRequest(
          method: ApiMethods.post,
          path: '/certificates/create/attachment',
          className: 'PortableTestController/onStoreFormNotesAttachment',
          requestFunction: onStoreFormNotesAttachment,
          withLoading: true,
          formatResponse: true,
          body: <String, dynamic>{
            'certificate_id': certId,
            'exclude': item.type == 'Private Certificate Note' ? 'yes' : 'no',
            // 'note_title': '',
            'note_body': item.note,
            'attachment_type_id': 2,
          },
        ).request(
          onSuccess: (dynamic data, dynamic response) {
            update();
          },
        );
      }
      isStorNoteDone = true;
    } else {
      isStorNoteDone = true;
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

  // ***************** clear  ****************
  void clearSignature() {
    signatureBytes = null;
    signatureBytesImage = null;
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
    formData[formKeyApplianceSummaryData] = applianceSummaryData;
  }

  // *****************  Press Finish ****************

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

    consoleLogPretty(certData, key: 'form_data');

    ApiRequest(
      method: ApiMethods.post,
      path: keyCreateForm,
      className: 'LandlordSafetyController/onCreateCertificate',
      requestFunction: onCreateCertificate,
      withLoading: true,
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
    onSaveApplianceData();

    if (!isStorImgDone && !isStorNoteDone) {
      onStoreFormImagesAttachment();
    }

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
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
  }

  Future<void> onCompleteCertificate() async {
    hideKeyboard();

    if (signatureBytes != null) {
      onSaveData();
      onSaveApplianceData();

      final Map<String, dynamic> certData = <String, dynamic>{
        ...formBody,
        'customer_id': customerId,
        'status_id': idCompleted,
        'site_id': siteId,
      };

      if (!isStorImgDone && !isStorNoteDone) {
        onStoreFormImagesAttachment();
      }

      consoleLogPretty(certData);

      startLoading();
      ApiRequest(
        method: ApiMethods.post,
        path: '/certificates/$certId/update',
        className: 'LandlordSafetyController/onCompleteCertificate',
        formatResponse: true,
        requestFunction: onCompleteCertificate,
        // withLoading: true,

        body: certData,
      ).request(onSuccess: (dynamic data, dynamic response) async {
        myAppController.clearCertFormInfo();
        // certificatesController.getAllCert();
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
}
