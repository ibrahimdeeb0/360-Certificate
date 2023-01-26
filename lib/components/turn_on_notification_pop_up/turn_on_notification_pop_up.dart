import 'package:app_settings/app_settings.dart';

import '../../general_exports.dart';
import '../default_pop_up/index.dart';

dynamic turnOnNotificationRequest() {
  openPopUp(
    GetBuilder<TurnOnNotificationRequestController>(
        init: TurnOnNotificationRequestController(),
        builder: (TurnOnNotificationRequestController controller) {
          return DefaultPopUp(
            okButtonSettings: ButtonSettings(
              onPress: AppSettings.openNotificationSettings,
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
