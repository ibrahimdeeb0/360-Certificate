import 'package:url_launcher/url_launcher.dart';

import '../../general_exports.dart';

class ForceUpdate extends StatelessWidget {
  const ForceUpdate({
    required this.urlKey,
    required this.forceData,
    required this.checkOffMode,
    Key? key,
  }) : super(key: key);

  final String urlKey;
  final Map<String, dynamic> forceData;
  final Function()? checkOffMode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CommonContainer(
        style: CommonContainerModel(
          maxHeight: 0.5,
          backgroundColor: AppColors.white,
          width: 0.9,
          borderRadius: 0.015,
          paddingHorizontal: 0.02,
          paddingTop: 0.02,
          paddingBottom: 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CommonText(
              forceData[keyMessage],
              containerStyle: const CommonContainerModel(
                  // marginBottom: 0.06,
                  ),
              style: appTextStyles.h3GreyStyle(),
            ),
            CommonContainer(
              style: const CommonContainerModel(
                width: 0.8,
                height: 0.3,
              ),
              child: Image.network(
                '${forceData[keyImage]}',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: CommonButton(
                    text: keyUpdate.tr,
                    onPress: () => launchUrl(
                      Uri.parse(forceData[urlKey]),
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
                ),
                Visibility(
                  visible: forceData[keyIsRequired] == 'false',
                  child: SizedBox(
                    width: DEVICE_WIDTH * 0.02,
                  ),
                ),
                Visibility(
                  visible: forceData[keyIsRequired] == 'false',
                  child: Flexible(
                    child: CommonButton(
                      text: keyCancel.tr,
                      onPress: checkOffMode?.call,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
