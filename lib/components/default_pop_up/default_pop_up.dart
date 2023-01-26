import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class ButtonSettings {
  const ButtonSettings({
    this.onPress,
    this.title,
    this.style,
  });

  final Function()? onPress;
  final String? title;
  final CommonButtonStyle? style;
}

class DefaultPopUp extends StatelessWidget {
  const DefaultPopUp({
    this.content,
    this.cancelButtonSettings,
    this.okButtonSettings,
    this.neverButtonSettings,
    this.showNeverButton = false,
    Key? key,
  }) : super(key: key);

  final Map<String, dynamic>? content;
  final ButtonSettings? cancelButtonSettings;
  final ButtonSettings? okButtonSettings;
  final ButtonSettings? neverButtonSettings;
  final bool showNeverButton;

  @override
  Widget build(BuildContext context) {
    consoleLog(content);
    return Align(
      child: CommonContainer(
        style: CommonContainerModel(
          backgroundColor: AppColors.white,
          borderRadius: 0.015,
          width: 1,
          marginHorizontal: 0.06,
          paddingVertical: 0.02,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (content?[keyImageUrl] == null ||
                '${content?[keyImageUrl]}'.contains('svg'))
              SvgPicture.network(
                content?[keyImageUrl],
                height: DEVICE_HEIGHT * 0.25,
                fit: BoxFit.cover,
              )
            else
              CachedImage(
                image: content?[keyImageUrl],
                height: DEVICE_HEIGHT * 0.25,
                fit: BoxFit.cover,
              ),
            CommonText(
              content?[keyText] ?? keyAllowLocation.tr,
              style: appTextStyles.h2Style(),
              containerStyle: const CommonContainerModel(
                width: 0.8,
                marginTop: 0.02,
                marginBottom: 0.04,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CommonButton(
                  text: okButtonSettings?.title ?? keyGoToSettings.tr,
                  onPress: okButtonSettings?.onPress?.call,
                ),
                CommonButton(
                  text: cancelButtonSettings?.title ?? keyCancel.tr,
                  onPress: () {
                    cancelButtonSettings?.onPress?.call() ?? Get.back();
                  },
                ),
              ],
            ),
            if (showNeverButton)
              CommonText(
                neverButtonSettings?.title ?? keyNeverShowIt.tr,
                onPress: neverButtonSettings?.onPress?.call,
                containerStyle: CommonContainerModel(
                  touchEffect: TouchableEffect(
                    type: TouchTypes.opacity,
                  ),
                  marginTop: 0.02,
                ),
                style: appTextStyles.h4GreyMediumStyle().copyWith(
                      fontColor: const Color.fromARGB(255, 9, 144, 255),
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
