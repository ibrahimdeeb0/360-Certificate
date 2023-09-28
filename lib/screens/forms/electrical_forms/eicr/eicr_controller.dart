import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../general_exports.dart';

class EicrController extends GetxController {
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
  bool renderItem = false;
  List<Map<String, dynamic>>? selectedImages = <Map<String, dynamic>>[];
  Uuid uuid = const Uuid();

  DateTime currentTime = DateTime.now();

  TextEditingController otherController = TextEditingController();
  ScrollController scrollController = ScrollController();

  // common data for all forms
  Uint8List? signatureBytes;
  Uint8List? signatureBytesImage;
  Uint8List? signatureBytes2;
  File? customerSignature;
  Uint8List? customerSignatureBytes;
  String? htmlContent;
  String? pdfFilePath;

  List<String> whoIsReceiving = <String>[];
  TextEditingController dateController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  List<dynamic> distrBoardDataBase = <dynamic>[];
  List<dynamic> observationsDataBase = <dynamic>[];

  Map<String, dynamic> gazSafetyData = <String, dynamic>{
    'remedial_works_completed': false,
    // declaration section
    formKeyEICRdeclaration: <String, dynamic>{
      formKeyInspectedName: '',
      formKeyInspectedDate: '',
      formKeyInspectedPosition: '',
      formKeyReportContractor: '',
      formKeyReportName: '',
      formKeyReportDate: '',
    },
    // Page 1
    formKeyReasonProducingA: '',
    formKeyDateTestingA: '',
    formKeyOccupierB: '',
    formKeyDomesticB: 'N/A',
    formKeyCommercialB: 'N/A',
    formKeyIndustrialB: 'N/A',
    formKeyOtherB: 'N/A',
    formKeyIfOtherB: '',
    formKeyEstimatedAgeB: '',
    formKeyEvidenceYesB: 'N/A',
    formKeyEvidenceNoB: 'N/A',
    formKeyEvidenceNotApparentB: 'N/A',
    formKeyIfYesB: '',
    formKeyInstallationAvailableYesB: 'N/A',
    formKeyInstallationAvailableNoB: 'N/A',
    formKeyDateLastInspectionB: '',
    // Page 2
    formKeyExtentElectricalC: '',
    formKeyAgreedLimitationsC: '',
    formKeyAgreedLimitationsWithC: '',
    formKeyPositionC: '',
    formKeyOperationalLimitationC: '',
    formKeyGeneralConditionD: '',
    formKeyOverallAssessmentD: '',
    formKeyAlternativeSourceD: 'N/A',
    //
    formKeyMonthYearRecommendationsE: '',
    formKeyYearsRecommendationsE: '',
    formKeyMonthRecommendationsE: '',
    formKeyReasonRecommendationsE: '',
    formKeyScheduleInspectionE: 'N/A',
    formKeyScheduleTestE: 'N/A',
    // Page 3
    formKeyConfirmationSupplyF: 'N/A',
    formKeyTNCSF: 'N/A',
    formKeyTNSF: 'N/A',
    formKeyTTF: 'N/A',
    formKeyTNCF: 'N/A',
    formKeyITF: 'N/A',
    formKeyACF: 'N/A',
    formKeyDCF: 'N/A',
    formKey1Phase2WireF: 'N/A',
    formKey1Phase3WireF: 'N/A',
    formKey2WireF: 'N/A',
    formKey2Phase3WireF: 'N/A',
    formKey3WireF: 'N/A',
    formKey3Phase3WireF: 'N/A',
    formKey3Phase4WireF: 'N/A',
    formKeyOtherF: 'N/A',
    formKeyNominalVoltageF: '',
    formKeyNominalFrequencyFF: '50',
    formKeyEarthFaultLoopF: '',
    formKeyPFC: '',
    formKeyBSF: '',
    formKeyTypeF: 'N/A',
    formKeyRatedCurrentF: 'N/A',
    formKeyShortCircuitCapacityF: 'N/A',
    // Page 5
    formKeyDistributorFacilityG: 'N/A',
    formKeyInstallationEarthElectrodeG: 'N/A',
    formKeyTypeG: '',
    formKeyElectrodeResistanceG: '',
    formKeyLocationTheEarthElectrodeG: '',
    formKeyConductorMaterialH1: 'Copper',
    formKeyConductorCsaH1: '',
    formKeyContinuityCheckH1: 'N/A',
    formKeyConductorMaterialH2: 'Copper',
    formKeyConductorCsaH2: '',
    formKeyContinuityCheckH2: 'N/A',
    formKeyWaterInstallationPipesH: 'N/A',
    formKeyGasInstallationH: 'N/A',
    formKeyOilInstallationPipesH: 'N/A',
    formKeyStructuralSteelH: 'N/A',
    formKeyOtherServicesH: 'N/A',
    // Page 6
    formKeyTypeBsI: '',
    formKeyNoPolesI: '',
    formKeySupplyConductorMaterialI: 'Copper',
    formKeySupplyConductorCsaI: '',
    formKeyVoltageRatingI: '',
    formKeyRatedCurrentI: '',
    formKeyRcdOperationCurrentI: 'N/A',
    formKeyRatedTimeDelayI: 'N/A',
    formKeyRcdOperationTimeI: 'N/A',
    // Page 8 - 16
    formKeyEarthFaultJ: '',
    formKeyInsulationResistanceJ: '',
    formKeyContinuityJ: '',
    formKeyRcdJ: '',
    formKeyMftJ: '',
    formKeyOtherJ: '',
    // Page 9 N/A Buttons
    formKey1_1Cable: 'N/A',
    formKey1_2Head: 'N/A',
    formKey1_3Arrangement: 'N/A',
    formKey1_4Consumer: 'N/A',
    formKey1_5Isolator: 'N/A',
    formKey1_6Appropriate: 'N/A',
    formKey2_0Generators: 'N/A',
    formKey3_1: 'N/A',
    formKey3_2: 'N/A',
    formKey3_3: 'N/A',
    formKey3_4: 'N/A',
    formKey3_5: 'N/A',
    formKey3_6: 'N/A',
    formKey3_7: 'N/A',
    formKey3_8: 'N/A',
    formKey4_1: 'N/A',
    formKey4_2: 'N/A',
    formKey4_3: 'N/A',
    formKey4_4: 'N/A',
    formKey4_5: 'N/A',
    formKey4_6: 'N/A',
    formKey4_7: 'N/A',
    formKey4_8: 'N/A',
    formKey4_9: 'N/A',
    formKey4_10: 'N/A',
    formKey4_11: 'N/A',
    formKey4_12: 'N/A',
    formKey4_13: 'N/A',
    formKey4_14: 'N/A',
    formKey4_15: 'N/A',
    formKey4_16: 'N/A',
    formKey4_17: 'N/A',
    formKey4_18: 'N/A',
    formKey4_19: 'N/A',
    formKey4_20: 'N/A',
    formKey4_21: 'N/A',
    formKey4_22: 'N/A',
    formKey5_1: 'N/A',
    formKey5_2: 'N/A',
    formKey5_3: 'N/A',
    formKey5_4: 'N/A',
    formKey5_5: 'N/A',
    formKey5_6: 'N/A',
    formKey5_7: 'N/A',
    formKey5_8: 'N/A',
    formKey5_9: 'N/A',
    formKey5_10: 'N/A',
    formKey5_11: 'N/A',
    formKey5_12_1: 'N/A',
    formKey5_12_2: 'N/A',
    formKey5_12_3: 'N/A',
    formKey5_12_4: 'N/A',
    formKey5_12_5: 'N/A',
    formKey5_13: 'N/A',
    formKey5_14: 'N/A',
    formKey5_15: 'N/A',
    formKey5_16: 'N/A',
    formKey5_17_1: 'N/A',
    formKey5_17_2: 'N/A',
    formKey5_17_3: 'N/A',
    formKey5_17_4: 'N/A',
    formKey5_18: 'N/A',
    formKey5_19: 'N/A',
    formKey5_20: 'N/A',
    formKey5_21: 'N/A',
    formKey6_1: 'N/A',
    formKey6_2: 'N/A',
    formKey6_3: 'N/A',
    formKey6_4: 'N/A',
    formKey6_5: 'N/A',
    formKey6_6: 'N/A',
    formKey6_7: 'N/A',
    formKey6_8: 'N/A',
    formKey7_1: 'N/A',
    formKey8_1: 'N/A',
    //*--*//
    formKey8_2Input: '',
    formKey8_2BTN: 'N/A',
    formKey8_3Input: '',
    formKey8_3BTN: 'N/A',
    formKey8_4Input: '',
    formKey8_4BTN: 'N/A',
    formKey8_5Input: '',
    formKey8_5BTN: 'N/A',
    formKey8_6Input: '',
    formKey8_6BTN: 'N/A',
    formKey8_7Input: '',
    formKey8_7BTN: 'N/A',
    formKey8_8Input: '',
    formKey8_8BTN: 'N/A',
    formKey8_9Input: '',
    formKey8_9BTN: 'N/A',
    formKey8_10Input: '',
    formKey8_10BTN: 'N/A',
    formKey8_11Input: '',
    formKey8_11BTN: 'N/A',
    formKey8_12Input: '',
    formKey8_12BTN: 'N/A',
    formKey8_13Input: '',
    formKey8_13BTN: 'N/A',
    formKey8_14Input: '',
    formKey8_14BTN: 'N/A',
    formKey8_15Input: '',
    formKey8_15BTN: 'N/A',
    formKey8_16Input: '',
    formKey8_16BTN: 'N/A',
    formKey8_17Input: '',
    formKey8_17BTN: 'N/A',
    formKey8_18Input: '',
    formKey8_18BTN: 'N/A',
    formKey8_19Input: '',
    formKey8_19BTN: 'N/A',
    formKey8_20Input: '',
    formKey8_20BTN: 'N/A',
    formKey8_21Input: '',
    formKey8_21BTN: 'N/A',
    formKey8_22Input: '',
    formKey8_22BTN: 'N/A',
    formKey8_23Input: '',
    formKey8_23BTN: 'N/A',
    formKey8_24Input: '',
    formKey8_24BTN: 'N/A',
    formKey8_25Input: '',
    formKey8_25BTN: 'N/A',
    formKey8_26Input: '',
    formKey8_26BTN: 'N/A',
    formKey8_27Input: '',
    formKey8_27BTN: 'N/A',
    formKey8_28Input: '',
    formKey8_28BTN: 'N/A',
    formKey8_29Input: '',
    formKey8_29BTN: 'N/A',
    formKey8_30Input: '',
    formKey8_30BTN: 'N/A',
    formKey8_31Input: '',
    formKey8_31BTN: 'N/A',
    formKey8_32Input: '',
    formKey8_32BTN: 'N/A',
    formKey8_33Input: '',
    formKey8_33BTN: 'N/A',
    allDistributionBoardData: <dynamic>[],
    allObservationData: <dynamic>[],
    formKeyRemarks: '',
  };

  Map<String, dynamic> formBody = <String, dynamic>{
    'form_id': '',
    keyData: <String, dynamic>{
      'who_is_receiving': '',
      'date': '',
      'comment': '',
      'signature': '',
      formKeyGazSafetyData: <Map<String, dynamic>>[],
    },
  };

  //*---- Widgets ---- */

  List<Widget> get listFormSections => <Widget>[
        const EICRSectionA(),
        const EICRSectionB(),
        const EICRSectionC(),
        const EICRSectionD(),
        const EICRSectionE(),
        const EICRSectionF(),
        const EICRSectionG(),
        const EICRSectionH(),
        const EICRSectionI(),
        const EICRSectionDB(),
        const EICRSectionJ(),
        const EICRSectionKPart1(),
        const EICRSectionKPart2(),
        const EICRSectionKPart3(),
        const EICRSectionKPart4(),
        const EICRSectionKPart5(),
        const EICRSectionKPart6(),
        const EICRSectionKPart7(),
        const EICRSectionInputField(),
        const EICRFinalPage(),
      ];

  //*---- Functions Body ------------------------------------------- */

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
    if (myAppController.certFormInfo[keyTemplateData] != null &&
        isTemplate! == false) {
      tempData = myAppController.certFormInfo[keyTemplateData][keyData];
    }

    // formBody['form_id'] = currentFormData[keyId];
    if (myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.setTemp) {
      // set Template Data to form body
      formBody = myAppController.certFormInfo[keyTemplateData][keyData];

      if (formBody[keyData][formKeyGazSafetyData].isNotEmpty) {
        gazSafetyData = formBody[keyData][formKeyGazSafetyData][0];
      }
      distrBoardDataBase = gazSafetyData[allDistributionBoardData];
      observationsDataBase = gazSafetyData[allObservationData];
      update();
    }
    if (myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.newTemp) {
      templateName = myAppController.certFormInfo[keyNameTemp];
    }
    if (myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.editTemp) {
      tempData = myAppController.certFormInfo[keyTemplateData];
      templateName = myAppController.certFormInfo[keyNameTemp];
      formBody = myAppController.certFormInfo[keyTemplateData][keyData];

      if (formBody[keyData][formKeyGazSafetyData].isNotEmpty) {
        gazSafetyData = formBody[keyData][formKeyGazSafetyData][0];
      }
      distrBoardDataBase = gazSafetyData[allDistributionBoardData];
      observationsDataBase = gazSafetyData[allObservationData];
      update();
    }
    if (myAppController.certFormInfo[keyFormDataStatus] ==
        FormDataStatus.editCert) {
      certId = myAppController.certFormInfo[keyCertId];
      formId = myAppController.certFormInfo[keyFormId];
      customerId = myAppController.certFormInfo[keyCustomerId];
      siteId = myAppController.certFormInfo[keySiteId];
      formBody['form_id'] = myAppController.certFormInfo[keyFormId];
      formBody[keyData] = myAppController.certFormInfo[keyTemplateData];
      if (formBody[keyData][formKeyGazSafetyData].isNotEmpty) {
        gazSafetyData = formBody[keyData][formKeyGazSafetyData][0];
      }
      distrBoardDataBase = gazSafetyData[allDistributionBoardData];
      observationsDataBase = gazSafetyData[allObservationData];
      isCertificateCreated = false;

      update();
    }

    gazSafetyData[formKeyEICRdeclaration][formKeyInspectedName] =
        '${profileController.userProfileData['first_name']} ${profileController.userProfileData['last_name']}';

    update();
  }

  @override
  Future<void> onReady() async {
    gazSafetyData[formKeyYearsRecommendationsE] = currentTime.year;
    gazSafetyData[formKeyEICRdeclaration][formKeyInspectedDate] =
        '$currentTime'.formatDate;
    gazSafetyData[formKeyEICRdeclaration][formKeyReportDate] =
        '$currentTime'.formatDate;
    super.onReady();
  }

  void onAddImage(dynamic data) {
    if (selectedImages!
        .where((Map<String, dynamic> element) => element['id'] == data['id'])
        .isNotEmpty) {
      selectedImages!
          .where((Map<String, dynamic> element) => element['id'] == data['id'])
          .toList()[0] = data;
    } else {
      selectedImages!.add(data);
    }
    update();
  }

  //*----------Section E Part 5---------*//
  void onConfirmDate({
    required DateTime dateTime,
    required FormDateType type,
  }) {
    switch (type) {
      case FormDateType.recommendation:
        {
          gazSafetyData[formKeyYearsRecommendationsE] =
              dateTime.toString().formatDate;
        }
        break;

      case FormDateType.inspectedBy:
        {
          gazSafetyData[formKeyEICRdeclaration][formKeyInspectedDate] =
              dateTime.toString().formatDate;
        }
        break;

      case FormDateType.reportBy:
        {
          gazSafetyData[formKeyEICRdeclaration][formKeyReportDate] =
              dateTime.toString().formatDate;
        }
        break;
    }

    update();
  }

  void onSelectYear(int value) {
    gazSafetyData[formKeyYearsRecommendationsE] = '$value';
    gazSafetyData[formKeyMonthRecommendationsE] = '';
    gazSafetyData[formKeyMonthYearRecommendationsE] = 'years';
    consoleLog(gazSafetyData[formKeyMonthYearRecommendationsE], key: 'years');
    update();
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
  }

  void onSelectMonth(String value) {
    gazSafetyData[formKeyMonthRecommendationsE] = value;
    gazSafetyData[formKeyYearsRecommendationsE] = '';
    gazSafetyData[formKeyMonthYearRecommendationsE] = 'months';
    consoleLog(gazSafetyData[formKeyMonthYearRecommendationsE], key: 'month');
    update();
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
  }

  //* Circuit - Page Numbers *//
  String pagesNum() {
    if (isTemplate!) {
      if (selectedId == listFormSections.length - 1) {
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
  // *****************  Auto Save  functions **************** //
  //******************************************************* */

  void onChangeFormDataValue(String? key, dynamic value) {
    gazSafetyData[key!] = value;
  }

  void onChangeDeclarationValue(String? key, dynamic value) {
    gazSafetyData[formKeyEICRdeclaration][key!] = value;
  }

  bool isCertificateCreated = true;
  void onPressNext({bool fromSave = false}) {
    if (isTemplate!) {
      if (listFormSections.length - 2 == selectedId) {
        onSaveTemplate();
      } else {
        selectedId = selectedId + 1;
        update();
      }
    } else {
      if (listFormSections.length - 1 == selectedId) {
        // consoleLog('this is last Page');
        onCompleteCertificate();
      } else {
        // if (listFormSections.length - 1 < selectedId)
        // consoleLog('this is Pre last Page');
        if ((selectedId == 0 || fromSave) && isCertificateCreated) {
          onCreateCertificate();
          isCertificateCreated = false;
        } else if (fromSave) {
          onUpdateCertificate();
        } else {
          selectedId = selectedId + 1;
          update();
        }
      }
    }

    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  // storeFormData();

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
      if (selectedId == listFormSections.length - 2) {
        return 'Save';
      } else {
        return 'Next';
      }
    } else {
      if (selectedId < listFormSections.length - 1) {
        return 'Next';
      } else {
        return 'Complete';
      }
    }
  }

  //*----------Template---------------*//
  void onSaveTemplate() {
    consoleLog('Save Template');
    openDialog(
      onCancel: Get.back,
      onConfirm: storeTemplate,
    );
  }

  Future<void> storeTemplate() async {
    hideKeyboard();
    saveDbCircuitsDataOnFormBody();
    saveObservationsDataBaseBody();
    onPressSave();
    startLoading();
    if (isEditTemplate!) {
      // ignore: missing_required_param
      ApiRequest(
        method: ApiMethods.put,
        path: '/forms/templates/${tempData['id']}/update',
        className: 'ElectricalDangerNotificationController/storeDangerTemplate',
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
        className: 'EICR/storeTemplate',
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

  //*********** Save Db Circuits data to Form body *************/
  void saveDbCircuitsDataOnFormBody() {
    gazSafetyData[allDistributionBoardData] = distrBoardDataBase;
    update();
  }

  //******** Save ObservationsDataBase data to Form body **********/
  void saveObservationsDataBaseBody() {
    gazSafetyData[allObservationData] = observationsDataBase;
    update();
  }

  void onPressSave() {
    if (formBody[keyData][formKeyGazSafetyData] == <Map<String, dynamic>>[] ||
        formBody[keyData][formKeyGazSafetyData] == null) {
      formBody[keyData][formKeyGazSafetyData].add(
        <String, dynamic>{
          ...gazSafetyData,
          'id': (formBody[keyData][formKeyGazSafetyData].length + 1).toString(),
        },
      );
      update();
    } else {
      formBody[keyData][formKeyGazSafetyData] = <Map<String, dynamic>>[];
      formBody[keyData][formKeyGazSafetyData].add(
        <String, dynamic>{
          ...gazSafetyData,
          'id': (formBody[keyData][formKeyGazSafetyData].length + 1).toString(),
        },
      );
      update();
    }
    // storeFormData();
  }

  // for Checkbox Values  whoIsReceiving
  void onUpdateArrayWhoIsReceiving(String? key, dynamic value) {
    if (whoIsReceiving.contains(value)) {
      whoIsReceiving.remove(value);
    } else {
      whoIsReceiving.add(value);
    }
    consoleLog(whoIsReceiving);
    // storeFormData();
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
        className: 'EICRController/onSendSignatureReportForm',
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
    saveDbCircuitsDataOnFormBody();
    saveObservationsDataBaseBody();
    onPressSave();

    final Map<String, dynamic> certData = <String, dynamic>{
      ...formBody,
      'customer_id': customerId,
      'status_id': idPending,
      'site_id': siteId,
    };

    // consoleLogPretty(certData, key: 'all data create');

    ApiRequest(
      method: ApiMethods.post,
      path: keyCreateForm,
      className: 'EicrController/onCreateCertificate',
      requestFunction: onCreateCertificate,
      // withLoading: true,
      formatResponse: true,

      body: selectedImages!.isEmpty
          ? certData
          : await addArrayToFormData(
              jsonObject: certData,
              imagesArray: selectedImages,
              customerSignature: customerSignature,
            ),
    ).request(
      onSuccess: (dynamic data, dynamic response) async {
        certId = data['form_data']['id'];
        update();
      },
    );
  }

  Future<void> onUpdateCertificate() async {
    hideKeyboard();
    saveDbCircuitsDataOnFormBody();
    saveObservationsDataBaseBody();
    onPressSave();
    final Map<String, dynamic> certData = <String, dynamic>{
      ...formBody,
      'customer_id': customerId,
      'status_id': idInProgress,
      'site_id': siteId,
    };
    // consoleLogPretty(certData, key: 'all data update');

    startLoading();
    ApiRequest(
      method: ApiMethods.post,
      path: '/certificates/$certId/update',
      className: 'EicrController/onUpdateCertificate',
      requestFunction: onUpdateCertificate,
      // withLoading: true,
      body: selectedImages!.isEmpty
          ? certData
          : await addArrayToFormData(
              jsonObject: certData,
              imagesArray: selectedImages,
              customerSignature: customerSignature,
            ),
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
  }

  Future<void> onCompleteCertificate() async {
    hideKeyboard();
    saveDbCircuitsDataOnFormBody();
    saveObservationsDataBaseBody();
    onPressSave();
    final Map<String, dynamic> certData = <String, dynamic>{
      ...formBody,
      'customer_id': customerId,
      'status_id': idCompleted,
      'site_id': siteId,
    };
    // consoleLogPretty(certData, key: 'all data complete');

    if (signatureBytes != null) {
      startLoading();
      ApiRequest(
        method: ApiMethods.post,
        path: '/certificates/$certId/update',
        className: 'EicrController/onCompleteCertificate',
        formatResponse: true,
        requestFunction: onCompleteCertificate,
        // withLoading: true,

        body: signatureBytes2 != null
            ? await addArrayToFormData(
                jsonObject: certData,
                imagesArray: selectedImages,
                customerSignature: customerSignature,
              )
            : certData,
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

  @override
  void onClose() {
    super.onClose();
    myAppController.clearCertFormInfo();
  }
}
