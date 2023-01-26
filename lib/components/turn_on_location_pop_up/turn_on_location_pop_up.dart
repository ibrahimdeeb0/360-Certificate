import 'package:app_settings/app_settings.dart';

import '../../general_exports.dart';
import '../default_pop_up/index.dart';

dynamic turnOnLocationRequest({
  bool enableService = false,
  TurnOnLocationController? turnOnLocationController,
}) {
  openPopUp(
    GetBuilder<TurnOnLocationController>(
        init: turnOnLocationController,
        builder: (TurnOnLocationController controller) {
          return DefaultPopUp(
            okButtonSettings: ButtonSettings(
              onPress: () {
                if (enableService) {
                  AppSettings.openLocationSettings();
                } else {
                  AppSettings.openAppSettings();
                }
              },
              title: keyGoToSettings.tr,
            ),
            showNeverButton: true,
            neverButtonSettings: ButtonSettings(
              onPress: controller.onPressDoNotShowAgain,
            ),
          );
        }),
  );
}
