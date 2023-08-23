import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../general_exports.dart';
import 'index.dart';

class GasTestPurgeController extends GetxController {
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

  FormImagesAttachmentsController formImagesAttachmentsController =
      FormImagesAttachmentsController();
  FormNotesAttachmentsController formNotesAttachmentsController =
      FormNotesAttachmentsController();

  Map<String, dynamic> formData = <String, dynamic>{
    formKeyPart1: <String, dynamic>{
      formKeyServiceMaintenance: 'False',
      formKeyMaintenance: 'False',
      formKeyGasCarriedOut: 'False',
      formKeyGasTightnessTest: 'False',
      formKeyMaintenanceApplianceLocation: '',
      formKeyMaintenanceApplianceType: '',
      formKeyMaintenanceApplianceMake: '',
      formKeyMaintenanceApplianceModel: '',
    },
    formKeyPart2: <String, dynamic>{
      formKeyBurnerInjectors: 'False',
      formKeyBurnerInjectorsInput: '',
      formKeyMaintenanceHeatExchanger: 'False',
      formKeyHeatExchangerInput: '',
      formKeyMaintenanceIgnition: 'False',
      formKeyIgnitionInput: '',
      formKeyElectrics: 'False',
      formKeyElectricsInput: '',
      formKeyControls: 'False',
      formKeyControlsInput: '',
      formKeyGasWaterLeaks: 'False',
      formKeyGasWaterLeaksInput: '',
      formKeySeals: 'False',
      formKeySealsInput: '',
      formKeyGasPipework: 'False',
      formKeyGasPipeworkInput: '',
      formKeyMaintenanceFan: 'False',
      formKeyFanInput: '',
      formKeyFireplaceOpening: 'False',
      formKeyFireplaceOpeningInput: '',
      formKeyClosurePlate: 'False',
      formKeyClosurePlateInput: '',
      formKeyFlamePicture: 'False',
      formKeyFlamePictureInput: '',
      formKeyMaintenanceLocation: 'False',
      formKeyMaintenanceLocationInput: '',
      formKeyStability: 'False',
      formKeyStabilityInput: '',
      formKeyReturnAirPlenum: 'False',
      formKeyReturnAirPlenumInput: '',
    },
    formKeyPart3: <String, dynamic>{
      formKeyMaintenanceVentilation: 'False',
      formKeyMaintenanceVentilationInput: '',
      formKeyFluTermination: 'False',
      formKeyFluTerminationInput: '',
      formKeyFluFlowTest: 'False',
      formKeyFluFlowTestInput: '',
      formKeySpillageTest: 'False',
      formKeySpillageTestInput: '',
      formKeyOperatingPressure: '',
      formKeySafetyDevices: 'False',
      formKeySafetyDevicesInput: '',
      formKeyMaintenanceOther: 'False',
      formKeyOtherInput: '',
    },
    formKeyPart4: <String, dynamic>{
      // formKeyServiceChecks: <String>[],
      formKeySafeToUse: 'False',
      formKeyHasWarningNotice: 'False',
      formKeyInstallationConform: 'False',
      formKeyFollowingRemedial: '',
    },
    formKeyDeclaration: <String, dynamic>{
      formKeyEngineerName: '',
      formKeyEngineerDate: '',
      formKeyEngineerPosition: '',
      formKeyCustomerName: '',
      formKeyCustomerDate: '',
      formKeyCustomerPosition: '',
    },
  };

  Map<String, dynamic> formBody = <String, dynamic>{
    'form_id': '',
    keyData: <String, dynamic>{},
  };

  List<Widget> get listFormSections => <Widget>[
        const GasTestPurgePage1(),
        const GasTestPurgePage2(),
        const GasTestPurgePage3(),
        const GasTestPurgePage4(),
      ];

  List<String> get listSectionsTitle => <String>[
        'Strength Test Details',
        'Tightness Test Details',
        'Purging Procedure Details',
        'Engineers Details',
      ];

  //*------------------------------------------------*//
  @override
  void onInit() {
    super.onInit();
    //*----------initial values------------*//
    formData[formKeyDeclaration][formKeyEngineerName] =
        '${profileController.userProfileData['first_name']} ${profileController.userProfileData['last_name']}';

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

    if (myAppController.certFormInfo[keyFormDataStatus] ==
            FormDataStatus.newForm ||
        myAppController.certFormInfo[keyFormDataStatus] ==
            FormDataStatus.newTemp) {
      onSelectDate(
        part: formKeyDeclaration,
        key: formKeyEngineerDate,
        value: DateTime.now(),
        type: DateType.date,
      );

      onSelectDate(
        part: formKeyDeclaration,
        key: formKeyCustomerDate,
        value: DateTime.now(),
        type: DateType.date,
      );

      // onSelectDate(
      //   part: formKeyPart5,
      //   key: formKeyNextInspectionDate,
      //   value: DateTime.now(),
      //   type: DateType.date,
      // );
    }

    //? If Certificate not Created need to create it
    if (isCertificateCreated == false && !(isTemplate!)) {
      onCreateCertificate();
    }
    update();
  }
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

  void onChangeFormDataValue(String? partKey, String? keyValue, dynamic value) {
    formData[partKey!][keyValue!] = value;
  }

  void onChangDataSignature(String? part, String? key, dynamic value) {
    formData[part!][key!] = value;
  }

  void onToggleCheckBoxValues(String? partKey, String? keyValue) {
    formData[partKey][keyValue] == 'true'
        ? onChangeFormDataValue(
            partKey,
            keyValue,
            '',
          )
        : onChangeFormDataValue(
            partKey,
            keyValue,
            'true',
          );
    update();
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

  void onSelectDate({
    required String part,
    required String key,
    required DateTime value,
    required DateType type,
  }) {
    if (type == DateType.date) {
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String dateValue = formatter.format(value);
      formData[part][key] = dateValue;
      selectedDate = value;
      update();
    } else if (type == DateType.time12Hr) {
      final String dateValue = DateFormat.jm().format(value).toString();
      formData[part][key] = dateValue;
      update();
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

    if (signatureBytes != null) {
      startLoading();

      final Map<String, dynamic> certData = <String, dynamic>{
        ...formBody,
        'customer_id': customerId,
        'status_id': idCompleted,
        'site_id': siteId,
      };

      if (!isStorImgDone && !isStorNoteDone) {
        onStoreFormImagesAttachment();
      }

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

  //////////////////////////scan
  String scanBarcode = 'Unknown';

  /// For Continuous scan
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen(
      (dynamic barcode) => consoleLog(barcode, key: 'the value 1'),
    );
  }

  Future<void> barcodeScan(String? keyPart, String? keyValue) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      consoleLog(barcodeScanRes, key: 'the value 2');
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    scanBarcode = barcodeScanRes;
    onChangeFormDataValue(keyPart!, keyValue!, barcodeScanRes);
    update();
  }
}
