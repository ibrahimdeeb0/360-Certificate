import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class ContentPart1 extends StatelessWidget {
  const ContentPart1({
    // required this.controller,
    super.key,
  });

  // final dynamic controller;

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<CompleteProfileController>()) {
      return GetBuilder<CompleteProfileController>(
        init: CompleteProfileController(),
        builder: (CompleteProfileController controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              0.03.ph,
              ...controller.listAllForms.map(
                (Map<String, dynamic> item) => CustomSelectCheckbox(
                  title: item[keyName],
                  wihBottomBorder: false,
                  onPress: () => controller.onSelectForm(item),
                  isSelected: controller.selectedForms
                      .where(
                          (Map<String, dynamic> e) => e[keyId] == item[keyId])
                      .isNotEmpty,
                ),
              ),
              0.3.ph,
              CommonText(
                "If this doesn't apply to your business you can press skip",
                textAlign: TextAlign.start,
                inlineSpans: const <InlineSpan>[],
                rowCrossAxisAlignment: CrossAxisAlignment.start,
                marginHorizontal: 0.02,
                fontColor: Colors.grey[700],
                leftChild: Padding(
                  padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.015),
                  child: SvgPicture.asset(iconAlert),
                ),
                containerStyle: appContainerStyles.cardStyle,
              ),
            ],
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
