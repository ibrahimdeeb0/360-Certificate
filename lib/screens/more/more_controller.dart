import 'package:package_info_plus/package_info_plus.dart';

import '../../general_exports.dart';

class MoreController extends GetxController {
  bool isTileExpanded = false;

  String? appVersion;

  List<Map<String, dynamic>> moreItems = <Map<String, dynamic>>[
    <String, dynamic>{
      keyTitle: 'Customers',
      keyIcon: iconCustomers,
      keyOnPress: () {},
    },
    <String, dynamic>{
      keyTitle: 'Form Templates',
      keyIcon: iconFormTemplate,
      keyOnPress: () {},
    },
    <String, dynamic>{
      keyTitle: 'My Settings',
      keyIcon: iconSettings,
      keyOnPress: () {},
    },
    <String, dynamic>{
      keyTitle: 'My Subscription',
      keyIcon: iconSubscription,
      keyOnPress: () {},
    },
    <String, dynamic>{
      keyTitle: 'Logout',
      keyIcon: iconLogout,
      keyOnPress: myAppController.onSignOut,
    },
  ];

  @override
  Future<void> onReady() async {
    super.onReady();
    // final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    update();
  }

  void onExpansionChanged({bool expanded = false}) {
    isTileExpanded = expanded;
    update();
  }
}
