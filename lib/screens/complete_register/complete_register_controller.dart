import '../../general_exports.dart';

class CompleteRegisterController extends GetxController {
  int currentIndex = 0;
  List<bool> isCheckedList = <bool>[false, false, false, false, false];

  List<Map<String, dynamic>> activationSelectionS1 = <Map<String, dynamic>>[
    <String, dynamic>{
      keyId: 0,
      keyTitle: 'Electrical Certificate',
      'children': <String>[
        'Portable Appliance Testing (PAT)',
        'Electrical Danger Notice',
        'Domestic EIC',
        'EICR'
      ],
    },
    <String, dynamic>{
      keyId: 1,
      keyTitle: 'Gas Certificates',
      'children': <String>[
        'Landlord/Homeowner Gas Safety Record',
        'Warning Notice',
      ],
    },
  ];

  List<Map<String, dynamic>> activationSelectionS2 = <Map<String, dynamic>>[
    <String, dynamic>{
      keyId: 0,
      keyTitle: 'ELECSA',
    },
    <String, dynamic>{
      keyId: 1,
      keyTitle: 'STROMA',
    },
    <String, dynamic>{
      keyId: 2,
      keyTitle: 'IET (Institution of Engineering and Technology)',
    },
    <String, dynamic>{
      keyId: 3,
      keyTitle: 'JIB (Joint Industry Board)',
    },
    <String, dynamic>{
      keyId: 4,
      keyTitle: 'SELECT (Scotland)',
    },
    <String, dynamic>{
      keyId: 5,
      keyTitle: 'NAPIT',
    },
    <String, dynamic>{
      keyId: 6,
      keyTitle: 'NICEIC',
    },
  ];

  List<Map<String, dynamic>> selectedItems = <Map<String, dynamic>>[];

  void onSelect(Map<String, dynamic> item) {
    if (selectedItems
        .where((Map<String, dynamic> element) => element[keyId] == item[keyId])
        .isNotEmpty) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    update();
  }

  void onPress() {
    if (currentIndex == 4) {
    } else {
      currentIndex++;
      update();
    }
  }

  Widget title() {
    if (currentIndex == 0) {
      return const TextComponent(
        text: 'Certificate Activation Selection',
      );
    } else if (currentIndex == 1) {
      return const Expanded(
        child: TextComponent(text: 'For Electrical Certificates:'),
      );
    } else if (currentIndex == 2) {
      return const Expanded(
        child: TextComponent(text: 'For Gas Certificates:'),
      );
    } else if (currentIndex == 3) {
      return const Expanded(
        child: TextComponent(text: 'For Both Electric And Gas '),
      );
    } else if (currentIndex == 4) {
      return const Expanded(
        child: TextComponent(text: 'Your Company Details'),
      );
    } else {
      return const SizedBox();
    }
  }
}
