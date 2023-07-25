import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../general_exports.dart';

class MinorWorksController extends GetxController {
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
  List<dynamic> applianceData = <dynamic>[];
  bool r1 = false;
  bool r2 = false;
  DateTime? selectedDate;

  Map<String, dynamic> formData = <String, dynamic>{
    formKeyDeclaration: <String, dynamic>{
      formKeyRecordIssueBy: '',
      formKeyReceivedBy: '',
      formKeyEngineerName: '',
      formKeyEngineerDate: '',
      formKeyClientName: '',
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
    formKeyDetailsDepartures: '',
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

  void onPress() {
    if (selectedId == listFormSections.length - 1) {
      // last screen
    } else {
      selectedId = selectedId + 1;
      update();
    }
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

  void onChangDataSignature(String? part, String? key, dynamic value) {
    formData[part!][key!] = value;
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

  void onSelectDate(String? part, String? key, DateTime value) {
    formData[part!][key!] = '$value'.split(' ')[0];
    update();
    selectedDate = value;
  }
}
