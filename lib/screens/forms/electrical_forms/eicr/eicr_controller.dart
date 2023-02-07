import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

import '../../../../general_exports.dart';

class EicrController extends GetxController {
  EicrController({
    this.jobId,
    this.serviceId,
    this.isTemplate = false,
    this.templateName,
    this.tempData,
    this.updateTemp = false,
  });

  int selectedId = 0;
  int numFinalPage = 2;
  bool isTemplate;
  String? templateName;
  dynamic tempData;
  bool updateTemp;

  bool renderItem = false;
  int? jobId;
  int? serviceId;
  List<Map<String, dynamic>>? selectedImages = <Map<String, dynamic>>[];

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

  final Map<String, dynamic> currentFormData = homeController.formsData
      .where(
        (dynamic element) =>
            element[keyName] ==
            formNameDomesticElectricalInstallationConditionReport,
      )
      .toList()
      .first;

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
    formKeyRecommendationsE: '',
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
  List<dynamic> listFormSections = <dynamic>[
    <String, dynamic>{
      'id': 0,
      'name': 'a',
      'title': 'Part 1.  Reason for producing this report',
    },
    <String, dynamic>{
      'id': 1,
      'name': 'b',
      'title':
          'Part 2.  Details of the installation which is the subject of this report',
    },
    <String, dynamic>{
      'id': 2,
      'name': 'c',
      'title': 'Part 3.  Extent and limitations of inspection and testing',
    },
    <String, dynamic>{
      'id': 3,
      'name': 'd',
      'title': 'Part 4.  Summary of the installation of the installation',
    },
    <String, dynamic>{
      'id': 4,
      'name': 'e',
      'title': 'Part 5.  Recommendations',
    },
    <String, dynamic>{
      'id': 5,
      'name': 'f',
      'title': 'Part 6.  Supply characteristics & earthing arrangements',
    },
    <String, dynamic>{
      'id': 6,
      'name': 'g',
      'title':
          'Part 7.  Particulars of installation referred to in this report',
    },
    <String, dynamic>{
      'id': 7,
      'name': 'h',
      'title': 'Part 8.  Main protective conductors',
    },
    <String, dynamic>{
      'id': 8,
      'name': 'i',
      'title': 'Part 9.  Main Switch/Switch-Fuse/Circuit Breaker/RCD',
    },
    <String, dynamic>{
      'id': 9,
      'name': 'db',
      'title': 'Part 10.  Distribution Boards',
    },
    <String, dynamic>{
      'id': 10,
      'name': 'j',
      'title': 'Part 11.  Test Instruments used',
    },
    //
    <String, dynamic>{
      'id': 11,
      'name': 'k1',
      'title': '',
    },
    <String, dynamic>{
      'id': 12,
      'name': 'k2',
      'title': '',
    },
    <String, dynamic>{
      'id': 13,
      'name': 'k3',
      'title': '',
    },
    <String, dynamic>{
      'id': 14,
      'name': 'k4',
      'title': '',
    },
    <String, dynamic>{
      'id': 15,
      'name': 'k5',
      'title': '',
    },
    <String, dynamic>{
      'id': 16,
      'name': 'k6',
      'title': '',
    },
    <String, dynamic>{
      'id': 17,
      'name': 'k7',
      'title': '',
    },
    <String, dynamic>{
      'id': 18,
      'name': 'input_field',
      'title': '',
    },
    <String, dynamic>{
      'id': 19,
      'name': 'observations',
      'title': 'Part 11.  Observations',
    },
    <String, dynamic>{
      'id': 20,
      'name': 'remark',
      'title': 'Part 12.  Remark',
    },
    <String, dynamic>{
      'id': 21,
      'name': 'final_page',
      'title': '',
    },
  ];

  Widget returnedSection({
    required EicrController controller,
    required String sectionName,
  }) //
  {
    switch (sectionName) {
      case 'a':
        {
          return EICRSectionA(
            controller: controller,
          );
        }

      case 'b':
        {
          return EICRSectionB(
            controller: controller,
          );
        }
      case 'c':
        {
          return EICRSectionC(
            controller: controller,
          );
        }

      case 'd':
        {
          return EICRSectionD(
            controller: controller,
          );
        }
      case 'e':
        {
          return EICRSectionE(
            controller: controller,
          );
        }

      case 'f':
        {
          return EICRSectionF(
            controller: controller,
          );
        }

      case 'g':
        {
          return EICRSectionG(
            controller: controller,
          );
        }

      case 'h':
        {
          return EICRSectionH(
            controller: controller,
          );
        }

      case 'i':
        {
          return EICRSectionI(
            controller: controller,
          );
        }

      case 'db':
        {
          return EICRSectionDB(
            controller: controller,
          );
        }

      case 'j':
        {
          return EICRSectionJ(
            controller: controller,
          );
        }

      case 'k1':
        {
          return EICRSectionKPart1(
            controller: controller,
          );
        }

      case 'k2':
        {
          return EICRSectionKPart2(
            controller: controller,
          );
        }

      case 'k3':
        {
          return EICRSectionKPart3(
            controller: controller,
          );
        }

      case 'k4':
        {
          return EICRSectionKPart4(
            controller: controller,
          );
        }

      case 'k5':
        {
          return EICRSectionKPart5(
            controller: controller,
          );
        }

      case 'k6':
        {
          return EICRSectionKPart6(
            controller: controller,
          );
        }

      case 'k7':
        {
          return EICRSectionKPart7(
            controller: controller,
          );
        }
      case 'input_field':
        {
          return EICRSectionInputField(
            controller: controller,
          );
        }
      case 'observations':
        {
          return SectionObservation(
            controller: controller,
          );
        }
      case 'remark':
        {
          return EICRRemarkSection(
            controller: controller,
          );
        }
      case 'final_page':
        {
          return EICRFinalPage(
            controller: controller,
          );
        }

      default:
        {
          return const SizedBox();
        }
    }
  }

  void removeSection(
    int id,
    Map<String, dynamic> item,
  ) //
  {
    if (listFormSections
        .where((dynamic element) => element['id'] == id)
        .isNotEmpty) {
      listFormSections.removeWhere((dynamic element) => element['id'] == id);
      update();
    } else if (listFormSections
        .where((dynamic element) => element['id'] == id)
        .isEmpty) {
      listFormSections.insert(item['id'], item);
      update();
    }
    update();
  }

  //*---- Functions Body ------------------------------------------- */

  @override
  void onInit() {
    // removeStoredFormData();
    super.onInit();
    if (tempData != null) {
      formBody = tempData?['data'];
      if (formBody[keyData][formKeyGazSafetyData].isNotEmpty) {
        gazSafetyData = formBody[keyData][formKeyGazSafetyData][0];
      }
      distrBoardDataBase = gazSafetyData[allDistributionBoardData];
      observationsDataBase = gazSafetyData[allObservationData];
      update();
    }
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    formBody['form_id'] = currentFormData[keyId];
    if (isTemplate) {
      numFinalPage = listFormSections.length - 2;
      update();
      removeStoredFormData();
    }
    await checkStorage();
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
  void onConfirmDate(DateTime dateTime) {
    gazSafetyData[formKeyRecommendationsE] =
        dateTime.toString().split(' ').first;
    update();
  }

  //* Circuit - Page Numbers *//
  String pagesNum() {
    if (isTemplate) {
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

  void storeFormData() {
    myAppController.localStorage.saveToStorage(
      key: '$storeFormKey-$jobId-$serviceId-${currentFormData[keyId]}',
      value: <String, dynamic>{
        'formBody': formBody,
        'selectedId': selectedId,
        'renderItem': renderItem,
        'gazSafetyData': gazSafetyData,
        'circuitsData': distrBoardDataBase,
        'observationsDataBase': observationsDataBase,
        'signatureBytes': signatureBytes,
      },
    );
  }

  Future<void> checkStorage() async {
    final Map<String, dynamic>? myData =
        await myAppController.localStorage.getFromStorage(
      key: '$storeFormKey-$jobId-$serviceId-${currentFormData[keyId]}',
    );
    consoleLog(myData, key: 'inData');
    consoleLog(myData != null, key: 'inData');
    Future<void> continueWithData() async {
      formBody = <String, dynamic>{
        ...myData!['formBody'],
        keyData: <String, dynamic>{
          ...myData['formBody'],
          formKeyGazSafetyData: <Map<String, dynamic>>[
            ...formBody[keyData][formKeyGazSafetyData],
            ...myData['formBody'][keyData][formKeyGazSafetyData],
          ],
        },
      };
      selectedId = myData['selectedId'];
      renderItem = myData['renderItem'];
      signatureBytes = myData['signatureBytes'];
      signatureBytesImage = myData['signatureBytes'];
      gazSafetyData = <String, dynamic>{
        ...myData['gazSafetyData'],
        allDistributionBoardData: <dynamic>[
          ...myData['gazSafetyData'][allDistributionBoardData],
        ],
        allObservationData: <dynamic>[
          ...gazSafetyData[allObservationData],
          ...myData['gazSafetyData'][allObservationData],
        ],
        formKeyEICRdeclaration: <String, dynamic>{
          ...gazSafetyData[formKeyEICRdeclaration],
          ...myData['gazSafetyData'][formKeyEICRdeclaration],
        },
      };
      distrBoardDataBase = <dynamic>[
        ...distrBoardDataBase,
        ...myData['circuitsData'],
      ];
      observationsDataBase = <dynamic>[
        ...observationsDataBase,
        ...myData['observationsDataBase'],
      ];
      update();
      Get.back();
    }

    if (myData != null) {
      openDialog(
        description:
            'You entered data before in this form do you want to use it ',
        confirmText: 'Use the data',
        cancelText: 'Remove the data',
        onConfirm: continueWithData,
        onCancel: Get.back,
      );
    }
  }

  void removeStoredFormData() {
    myAppController.localStorage.removeFromStorage(
      key: '$storeFormKey-$jobId-$serviceId-${currentFormData[keyId]}',
    );
  }

  //******************************************************* */

  void onChangeFormDataValue(String? key, dynamic value) {
    gazSafetyData[key!] = value;
  }

  void onChangeDeclarationValue(String? key, dynamic value) {
    gazSafetyData[formKeyEICRdeclaration][key!] = value;
  }

  void onPressNext() {
    if (isTemplate) {
      if (selectedId == 17) {
        selectedId = selectedId + 1;
        update();
        Timer(
          const Duration(milliseconds: 300),
          () {
            renderItem = true;
            update();
          },
        );
      } else if (selectedId == 20) {
        // onSaveTemplate();
      } else {
        selectedId = selectedId + 1;
        update();
      }
    }
    //
    else {
      if (selectedId == 21) {
        consoleLog('this is last Page');
        onPressFinishReportForm();
      } else if (selectedId < 21) {
        if (selectedId == 17) {
          selectedId = selectedId + 1;
          update();
          Timer(
            const Duration(milliseconds: 300),
            () {
              renderItem = true;
              update();
            },
          );
        } else if (selectedId == 18) {
          selectedId = selectedId + 1;
          update();
          Timer(
            const Duration(milliseconds: 300),
            () {
              renderItem = false;
              update();
            },
          );
        } else {
          selectedId = selectedId + 1;
          update();
        }
      }
    }

    storeFormData();
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void onPressBack() {
    if (selectedId > 0) {
      if (selectedId == 19) {
        selectedId = selectedId - 1;
        update();
        Timer(
          const Duration(milliseconds: 300),
          () {
            renderItem = true;
            update();
          },
        );
      } else if (selectedId == 18) {
        selectedId = selectedId - 1;
        update();
        Timer(
          const Duration(milliseconds: 300),
          () {
            renderItem = false;
            update();
          },
        );
      } else {
        selectedId = selectedId - 1;
        update();
      }
    } else {
      Get.back();
    }
    storeFormData();
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  String finalPageButton() {
    if (isTemplate) {
      if (selectedId == 21) {
        return 'Save';
      } else {
        return 'Next';
      }
    }
    //
    else {
      if (selectedId < listFormSections.length - 1) {
        return 'Next';
      } else {
        return 'Save';
      }
    }
  }

  //*----------Template---------------*//
  // void onSaveTemplate() {
  //   consoleLog('Save Template');
  //   openDialog(
  //     onCancel: Get.back,
  //     onConfirm: storeTemplate,
  //   );
  // }

  // Future<void> storeTemplate() async {
  //   saveDbCircuitsDataOnFormBody();
  //   saveObservationsDataBaseBody();
  //   onPressSave();
  //   hideKeyboard();
  //   startLoading();
  //   if (updateTemp) {
  //     // ignore: missing_required_param
  //     ApiRequest(
  //       method: putMethod,
  //       path: '/forms/templates/${tempData['id']}/update',
  //       className: 'ElectricalDangerNotificationController/storeDangerTemplate',
  //       // requestFunction: storeTemplate,
  //       body: <String, dynamic>{
  //         'name': tempData['name'],
  //         'form_id': tempData['form_id'],
  //         'data': formBody,
  //       },
  //     ).request(
  //       onSuccess: (dynamic data, dynamic response) {
  //         Get.find<FormTemplateController>().getFormsTemplates();
  //         Get
  //           ..back()
  //           ..back();
  //       },
  //     );
  //   } else {
  //     // ignore: missing_required_param
  //     ApiRequest(
  //       method: postMethod,
  //       path: keyStoreFormTemplate,
  //       className: 'ElectricalDangerNotificationController/storeDangerTemplate',
  //       // requestFunction: storeTemplate,
  //       body: <String, dynamic>{
  //         'name': templateName,
  //         'form_id': currentFormData[keyId],
  //         'data': formBody,
  //       },
  //     ).request(
  //       onSuccess: (dynamic data, dynamic response) {
  //         Get.find<FormTemplateController>().getFormsTemplates();
  //         // dismissLoading();
  //         Get
  //           ..back()
  //           ..back()
  //           ..back();
  //       },
  //     );
  //   }
  // }

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
    formBody[keyData][formKeyGazSafetyData].add(
      <String, dynamic>{
        ...gazSafetyData,
        'id': (formBody[keyData][formKeyGazSafetyData].length + 1).toString(),
      },
    );
    storeFormData();
    update();
  }

  // for Checkbox Values  whoIsReceiving
  void onUpdateArrayWhoIsReceiving(String? key, dynamic value) {
    if (whoIsReceiving.contains(value)) {
      whoIsReceiving.remove(value);
    } else {
      whoIsReceiving.add(value);
    }
    consoleLog(whoIsReceiving);
    storeFormData();
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
    storeFormData();
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
    storeFormData();
  }

  // ***************** clear  ****************
  void clearSignature() {
    signatureBytes = null;
    signatureBytesImage = null;
    storeFormData();
    update();
  }

  void clearCustomerSignature() {
    signatureBytes2 = null;
    customerSignatureBytes = null;
    storeFormData();
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
    final File pathOfImage = await File(
            '${directory.path}/$storeFormKey-$jobId-$serviceId-${currentFormData[keyId]}_customer_sign.png')
        .create();

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
  Future<void> onPressFinishReportForm() async {
    // formBody[data]['who_is_receiving'] = whoIsReceiving;
    // formBody[data]['date'] = dateController.text;
    // formBody[data]['comment'] = commentController.text;
    saveDbCircuitsDataOnFormBody();
    saveObservationsDataBaseBody();
    onPressSave();

    if (signatureBytes != null) {
      final int formId = homeController.formsData
          .where(
            (dynamic element) =>
                element[keyName] ==
                formNameDomesticElectricalInstallationConditionReport,
          )
          .first[keyId];
      startLoading();
      // ApiRequest(
      //    path: keyCreateForm,
      //   className: 'DomesticEICRController/onPressFinishReportForm',
      //   requestFunction: onPressFinishReportForm,
      //   body: await addArrayToFormData(
      //     jsonObject: <String, dynamic>{
      //       ...formBody,
      //       'job_id': jobId ?? '',
      //       'service_id': serviceId ?? '',
      //     },
      //     imagesArray: selectedImages,
      //     customerSignature: customerSignature,
      //   ),
      // ).request(
      //   onSuccess: (dynamic data, dynamic response) async {
      //     selectedId = 0;
      //     removeStoredFormData();
      //     htmlContent = data['html_content'];
      //     pdfFilePath = await onPressDownloadPdf(
      //       htmlContent: data['html_content'],
      //       pdfTitle: 'form$serviceId$jobId$formId',
      //     );
      //     update();
      //     dismissLoading();
      //   },
      // );
    } else {
      showMessage(
        description: 'Please draw your signature',
        textColor: AppColors.red,
      );
    }
  }
}
