import '../../../../../general_exports.dart';

class DBController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  TextEditingController otherInputController = TextEditingController();

  late TabController tabController;

  int tabIndex = 0;

  List<dynamic> tabItems = <dynamic>[
    <String, dynamic>{
      'text': 'Circuit Details',
    },
    <String, dynamic>{
      'text': 'Test Result',
    },
  ];

  List<dynamic> tabViewItems = <dynamic>[
    const CircuitP2(),
    const CircuitP3(),
  ];

  List<Map<String, dynamic>> spdDetails = <Map<String, dynamic>>[
    <String, dynamic>{
      keyId: 0,
      keyName: 'T1',
    },
    <String, dynamic>{
      keyId: 1,
      keyName: 'T2',
    },
    <String, dynamic>{
      keyId: 2,
      keyName: 'T3',
    },
    <String, dynamic>{
      keyId: 3,
      keyName: 'T1+T2',
    },
    <String, dynamic>{
      keyId: 4,
      keyName: 'T12+T3',
    },
    <String, dynamic>{
      keyId: 5,
      keyName: 'N/A',
    },
  ];

  List<int> listNumbers = <int>[];
  List<String> listCircuitReference = <String>[
    '/L1',
    '/L2',
    '/L3',
    'L1/',
    'L2/',
    'L3/',
    'TP',
    '/R',
    '/Y',
    '/B',
  ];

  int circuitNumIndex = 0;
  int circuitTypeIndex = 0;

  // **------Distribution Board Database-----------** //
  List<dynamic> distrBoardDataBase = <dynamic>[];

  Map<String, dynamic>? selectedParentDistrBoardData;
  Map<String, dynamic>? selectedChildCircuitData;

  Map<String, dynamic> parentDistrBoardData = <String, dynamic>{
    formKeyDBRef: 'DB1',
    formKeyZsAtThisBoard: '',
    formKeyBoardIpfBoard: '',
    formKeyBoardMainSwitchTypeBS: '60947',
    formKeyBoardRating: '100',
    formKeyBoardSupplyConductors: '25',
    formKeyBoardEarth: '16',
    formKeyBoardLocation: '',
    formKeyBoardPhaseSequence: 'N/A',
    formKeyBoardSuppliedFrom: 'Mains',
    formKeyBoardNoOfPhases: 'Single',
    formKeyBoardSupplyProtectiveDeviceType: 'BS 1361 Type 2b',
    formKeyBoardRating2: '',
    formKeyBoardSPDDetails: 'T1',
  };
  Map<String, dynamic> childCircuitData = <String, dynamic>{
    formKeyCircuitReferenceA: '1',
    formKeyCircuitDesignationA: '',
    formKeyTypeOfWiringA: '',
    formKeyReferenceMethodA: '',
    formKeyNumberOfPointA: '',
    formKeyLiveB: '',
    formKeyCpcB: '',
    formKeyMaxDisconnectionTimeB: '',
    formKeyTypeBsC: '',
    formKeyTypeC: 'N/A',
    formKeyRatingC: '',
    formKeyShortCircuitC: '',
    formKeyMaxPermittedC: '',
    formKeyTypeBsD: 'N/A',
    formKeyTypeD: 'N/A',
    formKeyRcdD: 'N/A',
    formKeyRatingD: 'N/A',
    //
    formKeyR1E: 'N/A',
    formKeyRnE: 'N/A',
    formKeyR2E: 'N/A',
    formKeyR1R2F: 'N/A',
    formKeyR2F: 'N/A',
    formKeyIrTestVoltageF: '500',
    formKeyLiveLiveF: '', //N/A
    formKeyLiveNeutralF: '',
    formKeyLiveEarthF: '',
    formKeyNeutralEarthF: '',
    formKeyPolarityG: 'PASS',
    formKeyMaximumMeasuredH: '',
    formKeyDisconnectionTimeI: 'N/A',
    formKeyTestButtonI: 'PASS',
    formKeyTestButtonJ: 'PASS',
    'mark_as_completed': false,
  };

  void onToggleCompleted(dynamic value) {
    childCircuitData['mark_as_completed'] = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabItems.length, vsync: this);
    distrBoardDataBase = Get.find<DomesticEicController>().distrBoardDataBase;
    update();
  }

  @override
  void onReady() {
    if (distrBoardDataBase.isEmpty) {
      onCrateParentDbData();
    }
    super.onReady();
    for (int number = 1; (number >= 1 && number <= 100); number++) {
      listNumbers.add(number);
    }
    // consoleLog(listNumbers, key: 'Generating_Numbering');
  }

  void onChangCircuitNum(int index) {
    circuitNumIndex = index;
  }

  void onChangCircuitType(int index) {
    circuitTypeIndex = index;
  }

  void onSelectCircuitReference() {
    onChangeChildeDbValues(
      formKeyCircuitReferenceA,
      // ${listCircuitReference[circuitTypeIndex]}
      '${listNumbers[circuitNumIndex]}',
    );
    consoleLog(childCircuitData[formKeyCircuitReferenceA]);
    update();
    Get.back();
  }

  void onSelectTab(int index) {
    tabIndex = index;
    update();
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  // SPD Value in Add New Board
  void onChangeSpdValue(String? value) {
    parentDistrBoardData[formKeyBoardSPDDetails] = value!;
    update();
  }

  //**----- (Reset Data) Parent and Childe Db Circuits data ----**/
  void resetParentValues() {
    parentDistrBoardData = <String, dynamic>{
      formKeyDBRef: 'DB1',
      formKeyZsAtThisBoard: '',
      formKeyBoardIpfBoard: '',
      formKeyBoardMainSwitchTypeBS: '60947',
      formKeyBoardRating: '100',
      formKeyBoardSupplyConductors: '25',
      formKeyBoardEarth: '16',
      formKeyBoardLocation: '',
      formKeyBoardPhaseSequence: 'N/A',
      formKeyBoardSuppliedFrom: 'Mains',
      formKeyBoardNoOfPhases: 'Single',
      formKeyBoardSupplyProtectiveDeviceType: 'BS 1361 Type 2b',
      formKeyBoardRating2: '',
      formKeyBoardSPDDetails: 'T1',
    };
    update();
  }

  void resetChildValues() {
    tabController.index = 0;
    tabIndex = 0;
    childCircuitData = <String, dynamic>{
      formKeyCircuitReferenceA: '1',
      formKeyCircuitDesignationA: '',
      formKeyTypeOfWiringA: '',
      formKeyReferenceMethodA: '',
      formKeyNumberOfPointA: '',
      formKeyLiveB: '',
      formKeyCpcB: '',
      formKeyMaxDisconnectionTimeB: '',
      formKeyTypeBsC: '',
      formKeyTypeC: 'N/A',
      formKeyRatingC: '',
      formKeyShortCircuitC: '',
      formKeyMaxPermittedC: '',
      formKeyTypeBsD: 'N/A',
      formKeyTypeD: 'N/A',
      formKeyRcdD: 'N/A',
      formKeyRatingD: 'N/A',
      //
      formKeyR1E: 'N/A',
      formKeyRnE: 'N/A',
      formKeyR2E: 'N/A',
      formKeyR1R2F: 'N/A',
      formKeyR2F: 'N/A',
      formKeyIrTestVoltageF: '500',
      formKeyLiveLiveF: '', //N/A
      formKeyLiveNeutralF: '',
      formKeyLiveEarthF: '',
      formKeyNeutralEarthF: '',
      formKeyPolarityG: 'PASS',
      formKeyMaximumMeasuredH: '',
      formKeyDisconnectionTimeI: 'N/A',
      formKeyTestButtonI: 'PASS',
      formKeyTestButtonJ: 'PASS',
      'mark_as_completed': false,
    };
    update();
  }

  //**----- (Set Data) Parent and Childe Data ----**/
  void setParentValues() {
    parentDistrBoardData =
        selectedParentDistrBoardData?[parentDistributionBoardValues];
    update();
  }

  void setChildeValues() {
    childCircuitData = selectedChildCircuitData!;
    update();
    consoleLogPretty(childCircuitData);
  }

  // **------ Parent Db Functions -----------** //
  void onCrateParentDbData() { 
    selectedParentDistrBoardData = null;
    distrBoardDataBase.add(
      <String, dynamic>{
        parentDistributionBoardValues: parentDistrBoardData,
        listChildCircuitData: <Map<String, dynamic>>[
          <String, dynamic>{
            ...childCircuitData,
            keyId: 1,
          }
        ],
        keyId: (distrBoardDataBase.length + 1),
      },
    );
    update();
    consoleLogPretty(distrBoardDataBase);
  }

  void onSaveParentDbValues() {
    selectedParentDistrBoardData?[parentDistributionBoardValues] =
        parentDistrBoardData;
    distrBoardDataBase[distrBoardDataBase.indexWhere((dynamic element) =>
            element[keyId] == selectedParentDistrBoardData?[keyId])] =
        selectedParentDistrBoardData;

    update();
    consoleLogPretty(selectedParentDistrBoardData, key: 'selected_Data');
    Get.back();
  }

  void onDeleteParentDbValues(dynamic data) {
    distrBoardDataBase.remove(data);
    update();
    consoleLogPretty(distrBoardDataBase, key: 'distrBoardDataBase');
  }

  // **------ Childe Circuit Functions -----------** //
  void onCreateChildeCircuit() {
    //*---- Create New Circuit ----*//
    selectedParentDistrBoardData?[listChildCircuitData].add(
      <String, dynamic>{
        ...childCircuitData,
        keyId: selectedParentDistrBoardData?[listChildCircuitData].length + 1,
      },
    );
    update();
    consoleLogPretty(selectedParentDistrBoardData?[listChildCircuitData]);
  }

  void onSaveChildeValues() {
    selectedChildCircuitData = childCircuitData;

    selectedParentDistrBoardData?[listChildCircuitData][
            selectedParentDistrBoardData?[listChildCircuitData].indexWhere(
                (dynamic element) =>
                    element[keyId] == selectedChildCircuitData?[keyId])] =
        selectedChildCircuitData;

    update();
    consoleLogPretty(selectedParentDistrBoardData?[listChildCircuitData],
        key: 'save_value_childe');
  }

  void onDeleteChildeDbValues(dynamic data) {
    selectedParentDistrBoardData?[listChildCircuitData].remove(data);
    update();
    // consoleLogPretty('aa', key: 'distrBoardDataBase');
  }

  //**----- (Change Data) Parent and Childe Data ----**/
  void onChangeParentDbValues(String? key, dynamic value) {
    parentDistrBoardData[key!] = value;
  }

  void onChangeChildeDbValues(String? key, dynamic value) {
    childCircuitData[key!] = value;
  }

  @override
  void onClose() {
    tabController.dispose();
    Get.find<DomesticEicController>().distrBoardDataBase = distrBoardDataBase;
    // consoleLog(Get.find<DomesticEicController>().distrBoardDataBase);
    consoleLog('Save DB Data Done', key: 'Saved_DB_Data');
    super.onClose();
  }
}
