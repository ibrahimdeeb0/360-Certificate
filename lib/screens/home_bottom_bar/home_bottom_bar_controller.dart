import '../../general_exports.dart';

class HomeBottomBarController extends GetxController {
  int selectedIndex = 0;
  List<Map<String, dynamic>> bottomBarItems = <Map<String, dynamic>>[
    <String, dynamic>{
      keyTitle: 'Gas',
      keyOnPress: () {},
      keyItems: <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle: 'Landlord/Homeowner Gas Safety Record',
          keyOnPress: () {},
        },
        <String, dynamic>{
          keyTitle: 'Caravan Boat Gas Safety Inspection Record',
          keyOnPress: () {},
        },
        <String, dynamic>{
          keyTitle: 'Warning Notice',
          keyOnPress: () {},
        },
        <String, dynamic>{
          keyTitle: 'Gas Inspection Record',
          keyOnPress: () {},
        },
        <String, dynamic>{
          keyTitle: 'Gas Testing And Purging',
          keyOnPress: () {},
        },
        <String, dynamic>{
          keyTitle: 'Fumes Investigation Report',
          keyOnPress: () {},
        },
        <String, dynamic>{
          keyTitle: 'Service/Maintenance Record',
          keyOnPress: () {},
        },
        <String, dynamic>{
          keyTitle: 'Gas Boiler System Commissioning Checklist',
          keyOnPress: () {},
        },
      ],
    },
    <String, dynamic>{
      keyTitle: 'Electrical',
      keyOnPress: () {},
      keyItems: <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle: 'Portable Appliance Testing',
          keyOnPress: () {},
        },
        <String, dynamic>{
          keyTitle: 'Domestic Electrical Installation Certificate',
          keyOnPress: () {},
        },
        <String, dynamic>{
          keyTitle: 'Electrical Danger Notification',
          keyOnPress: () {},
        },
        <String, dynamic>{
          keyTitle: 'EICR',
          keyOnPress: () {},
        },
      ],
    },
  ];

  void onChangeIndex(int index) {
    selectedIndex = index;
    update();
  }
  // @override
  // void onInit() {
  //   //  implement onInit
  //   super.onInit();
  // }
  // @override
  // void onReady() {
  //   //  implement onReady
  //   super.onReady();
  // }
  // @override
  // void onClose() {
  //   //  implement onClose
  //   super.onClose();
  // }
}
