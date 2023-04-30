import '../../../../../general_exports.dart';

class PortableAppliancesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late TabController tabController;
  int tabIndex = 0;

  List<dynamic> tabItems = <dynamic>[
    <String, dynamic>{
      'text': 'Appliance Details',
    },
    <String, dynamic>{
      'text': 'Test Result',
    },
  ];

  List<dynamic> tabViewItems = <dynamic>[
    const ApplianceDetailsPage1(),
    const ApplianceDetailsPage2(),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabItems.length, vsync: this);
    // distrBoardDataBase = Get.find<EicrController>().distrBoardDataBase;
    update();
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

  @override
  void onClose() {
    tabController.dispose();
    // Get.find<EicrController>().distrBoardDataBase = distrBoardDataBase;
    // consoleLog(Get.find<EicrController>().distrBoardDataBase);
    // consoleLog('Save DB Data Done', key: 'Saved_DB_Data');
    super.onClose();
  }
}
