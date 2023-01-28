import 'package:package_info_plus/package_info_plus.dart';

import '../../general_exports.dart';

class MoreController extends GetxController {
  bool isTileExpanded = false;

  String? appVersion;

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
