import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class LandlordPage4 extends StatelessWidget {
  const LandlordPage4({
    super.key,
    // this.controller,
  });

  // final LandlordSafetyController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const CommonText(
          'Test Gas Appliances',
          fontSize: 34,
          fontWeight: FontWeight.bold,
          marginHorizontal: 0.04,
          marginTop: 0.08,
        ),
        CommonContainer(
          onPress: () {
            Get.to(() => const LandlordAppliances());
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
                'Appliance/Inspection Details',
                fontSize: fontH1,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                bottomChild: SizedBox(),
                containerStyle: CommonContainerModel(
                  width: 0.6,
                  marginLeft: 0.02,
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
  }
}
