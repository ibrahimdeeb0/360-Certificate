import '../../general_exports.dart';

class SubscriptionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late TabController tabController;
  int tabIndex = 0;

  List<dynamic> tabItems = <dynamic>[
    <String, dynamic>{
      keyId: 0,
      'text': 'Monthly',
    },
    <String, dynamic>{
      keyId: 1,
      'text': 'Annual',
    },
  ];

  YearlyPlans? selectedYearPlane;
  MonthlyPlans? selectedMonthPlane;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabItems.length, vsync: this);
  }

  void onSelectTab(int index) {
    tabIndex = index;
    selectedYearPlane = null;
    selectedMonthPlane = null;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
