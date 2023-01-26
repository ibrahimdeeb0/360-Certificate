import 'package:flutter_switch/flutter_switch.dart';

import '../../general_exports.dart';

class Toggle extends StatelessWidget {
  const Toggle({
    required this.controller,
    Key? key,
    this.onChange,
  }) : super(key: key);

  final ToggleController? controller;
  final Function? onChange;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToggleController>(
      init: controller,
      global: false,
      builder: (ToggleController controller) => FlutterSwitch(
        disabled: controller.disabled!,
        width: DEVICE_WIDTH * 0.07,
        height: DEVICE_HEIGHT * 0.023,
        toggleSize: 16.5,
        padding: 1,
        activeSwitchBorder: Border.all(
          color: Color(AppColors.primary),
          width: 1.5,
        ),
        inactiveSwitchBorder: Border.all(
          color: Color(AppColors.greyLightBorder),
          width: 1.5,
        ),
        activeColor: Color(AppColors.white),
        inactiveColor: Colors.white,
        inactiveToggleColor: Color(AppColors.greyLightBorder),
        toggleColor: Color(AppColors.primary),
        value: controller.isSwitchOn!,
        onToggle: (bool val) {
          controller.onChangeSwitchStatus();
          onChange?.call();
        },
      ),
    );
  }
}
