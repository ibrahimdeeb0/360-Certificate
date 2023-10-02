import '../../../../../general_exports.dart';

class DistributionBoardController extends GetxController
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
    const CircuitDetailsP1(),
    const CircuitDetailsP2(),
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

  //**-------Lists ------------------ */
  List<String> listDbRef = <String>[
    'DB1',
    'DB2',
    'DB3',
    'DB4',
    'SUB MAIN',
    'Other',
  ];
  List<String> listTypeBSEN = <String>[
    '88 type gG',
    '88 type mG',
    '88 type aM',
    '3036 (S-E)',
    '1361 type 1',
    '1361 type 2',
    '1362',
    '60898 type B',
    '60898 type C',
    '60898 type D',
    '3871 type 1',
    '3871 type 2',
    '3871 type 3',
    '3871 type 4',
    '3871 type B',
    '3871 type C',
    '3871 type D',
    '60947 - 2 MCCB',
    '60947 - 2 ACB',
    '60947 - 2 type D',
    '60947 type B',
    '60947 type C',
    '4293 RCD',
    '61008 RCD',
    '61009 type B',
    '61009 type C',
    '61009 type D',
    '5419 Isolator',
    '60947 - 3 Isolator',
    'N/A',
    'LIMITED',
    'Other',
  ];
  List<String> listRating = <String>[
    '50',
    '60',
    '63',
    '80',
    '100',
    'N/A',
    'Other',
  ];
  List<String> listSupplyConductors = <String>[
    '6',
    '10',
    '16',
    '25',
    '35',
    '50',
    'Other',
  ];
  List<String> listEarth = <String>[
    '4',
    '6',
    '10',
    '16',
    'Other',
  ];
  List<String> listLocations = <String>[
    'Hall',
    'Stairway',
    'Landing',
    'Front Room',
    'Rear Room',
    'Shop Front',
    'Shop Rear',
    'Office',
    'Front Office',
    'Back Office',
    'Other',
  ];
  List<String> listSuppliedFrom = <String>[
    'Main Board',
    'Mains',
    'Sub Mains',
    'DB1',
    'DB2',
    'DB3',
    'DB4',
    'DB5',
    'Other',
  ];
  List<String> listNoOfPhases = <String>[
    'Single',
    'Three',
    'Other',
  ];
  List<String> listBSEN = <String>[
    'Fuse HRC - Type gG',
    'Fuse HRC - Type mG',
    'Fuse HRC - Type aG',
    'Fuse (Semi - enclosed)',
    'Fuse HRC - Type 1',
    'Fuse HRC - Type 2',
    'Fuse HRC Obsolete',
    'MCB Type B',
    'MCB Type C',
    'MCB Type D',
    'MCB - Type 1',
    'MCB - Type 2',
    'MCB - Type 3',
    'MCB - Type 4',
    'MCB - Type B',
    'MCB - Type C',
    'MCB - Type D',
    'MCB Obsolete Type',
    'MCCB',
    'MCCB Obsolete Type',
    'ACB ',
    'ACB Obsolete Type',
    'RCD/RCBO - Type B',
    '61009 RCD/RCBO - Type C',
    'RCD/RCBO - Type D',
    'Isolator',
    'HBC - Type 1',
    'Fuse HBC - Type 1',
    'Fuse HBC',
    'N/A',
    'L/M',
    'Other',
  ];
  List<String> listRatingBSEN = <String>[
    '3',
    '5',
    '6',
    '7.5',
    '10',
    '15',
    '16',
    '20',
    '25',
    '30',
    '32',
    '40',
    '45',
    '50',
    '60',
    '63',
    '80',
    '100',
    '125',
    'N/A',
    'Other',
  ];
  List<String> listCircuitDesignation = <String>[
    'Ring Circuit',
    '1st Floor Lights',
    '2st Floor Lights',
    '3st Floor Lights',
    '4st Floor Lights',
    '5st Floor Lights',
    '1st & Ground Floor Socket',
    'Alarm',
    'Bathroom Shower',
    'Circuit Not Tested',
    'Conveyor Sockets',
    'Cooker',
    'Downstairs Lights',
    'Downstairs Socket',
    'Emergency Lights',
    'En-Suite Shower',
    'Fire Alarm',
    'Flood Lights',
    'Ground Floor Lights',
    'Garage Supply',
    'House Lights',
    'House Ring Main',
    'Hall Lights',
    'Immersion Heater',
    'Kitchen Sockets',
    'Kitchen & Garage Lights',
    'Kitchen & Garage Sockets',
    'Lim',
    'Lights',
    'Lights in Extension',
    'Light Rooms 1,2,3',
    'Lights Garage',
    'Lights Utility Room',
    'Loft',
    'Loft Sockets',
    'Loft Lights',
    'Old Immersion',
    'Old Water Heater',
    'RCD Module',
    'R.C.D',
    'Spare',
    'Sub Main 1',
    'Sub Main 2',
    'Sub Main 3',
    'Sub Main 4',
    'Shower',
    'Shower 1',
    'Shower 2',
    'Shower 3',
    'Shower 4',
    'Shower 5',
    'Upstairs',
    'Shower Bedroom',
    'Shower Near DB',
    'Shower Private Room',
    'Smoke Detectors',
    'Sockets Garage',
    'Sockets',
    'Sockets Outhouse',
    'Sockets Utility Room',
    'Supply to Outbuilding',
    'Tails',
    'Unknown',
    'Upstairs Sockets',
    'Upstairs Lights',
    'Other',
  ];
  List<String> listTypeOfWiring = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'Other'
  ];
  List<String> listConductorLive = <String>[
    '1.0',
    '1.5',
    '2.5',
    '4',
    '6',
    '10',
    '16',
    '25',
    '35',
    '50',
    '70',
    '95',
    '120',
    '150',
    '185',
    '240',
    '300',
    '400',
    '500',
    '630',
    'N/A',
    'Other'
  ];
  List<String> listConductorCSA = <String>[
    '1.0',
    '1.5',
    '2.5',
    '4',
    '6',
    '10',
    '16',
    '25',
    '35',
    '50',
    '70',
    '95',
    '120',
    '150',
    '185',
    '240',
    '300',
    '400',
    '500',
    '630',
    'Conduit',
    'Trunking',
    'Armour',
    'MICC',
    'N/A',
    'Other'
  ];
  List<String> listMaxDiscTime = <String>[
    '0.2',
    '0.4',
    '5',
    'Other',
  ];
  List<String> listTypeBSEN2 = <String>[
    '60898',
    '3036',
    '1261',
    '1262',
    '88',
    '3871',
    '60947',
    '4293',
    '61008',
    '61009',
    '5419',
    '60947',
    'N/A',
    'LIMITED',
    'Other',
  ];
  List<String> listTypeCurrentDevice = <String>[
    'A',
    'B',
    'C',
    'D',
    'gG',
    'P',
    'K',
    'Z',
    'ACB',
    'aM',
    'mG',
    '(S-E)',
    '1',
    '2',
    '3',
    '4',
    'Other'
  ];
  List<String> listShortCircuitCapacity = <String>[
    '1',
    '1.5',
    '2',
    '3',
    '4',
    '4.5',
    '5',
    '6',
    '7.5',
    '9',
    '10',
    '12.5',
    '15',
    '16',
    '16.5',
    '18',
    '20',
    '22',
    '25',
    '32',
    '33',
    '35',
    '40',
    '45',
    '50',
    '80',
    'N/A',
    'Other',
  ];
  List<String> listTypeRCD = <String>[
    'AC',
    'A',
    'B',
    'F',
    'Type 1',
    'Type 2',
    'N/A',
    'Other',
  ];
  List<String> listRCDAtDelta = <String>[
    '30',
    '100',
    'N/A',
    'Other',
  ];
  List<String> listNumberPoint = <String>[
    'N/A',
    'LIM',
    'Other',
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
    distrBoardDataBase = Get.find<EicrController>().distrBoardDataBase;
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
  // int lastId = 0;
  void onCreateChildeCircuit() {
    // lastId =
    //     lastId <= selectedParentDistrBoardData?[listChildCircuitData].length + 1
    //         ? (selectedParentDistrBoardData?[listChildCircuitData].length + 1)
    //         : (lastId + 1);

    //*---- Create New Circuit ----*//
    selectedParentDistrBoardData?[listChildCircuitData].add(
      <String, dynamic>{
        ...childCircuitData,
        'circuit_reference_a':
            '${selectedParentDistrBoardData?[listChildCircuitData].last[keyId] + 1}',
        keyId:
            selectedParentDistrBoardData?[listChildCircuitData].last[keyId] + 1,
      },
    );
    update();
    consoleLogPretty(selectedParentDistrBoardData?[listChildCircuitData].last);
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
    Get.find<EicrController>().distrBoardDataBase = distrBoardDataBase;
    consoleLog(Get.find<EicrController>().distrBoardDataBase);
    consoleLog('Save DB Data Done', key: 'Saved_DB_Data');
    super.onClose();
  }
}
