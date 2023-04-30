import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class PortableTestPage1 extends StatelessWidget {
  const PortableTestPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PortableTestController>(
      init: PortableTestController(),
      builder: (PortableTestController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CommonText(
              'Appliances',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              marginHorizontal: 0.04,
              marginTop: 0.08,
            ),
            CommonContainer(
              onPress: () {
                Get.to(() => const PortableAppliances());
              },
              style: appContainerStyles.formSectionsStyle,
              paddingHorizontal: 0.04,
              touchEffect: TouchableEffect(
                type: TouchTypes.opacity,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CommonContainer(
                    // backgroundColor: Colors.green,
                    child: SvgPicture.asset(
                      icoCheckList,
                      width: 0.03.flexWidth,
                      height: 0.08.flexHeight,
                    ),
                  ),
                  const CommonText(
                    'Add Appliances',
                    fontSize: fontH1,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    bottomChild: SizedBox(),
                    containerStyle: CommonContainerModel(
                      width: 0.6,
                      marginLeft: 0.02,
                      alignment: AlignmentDirectional.topStart,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
