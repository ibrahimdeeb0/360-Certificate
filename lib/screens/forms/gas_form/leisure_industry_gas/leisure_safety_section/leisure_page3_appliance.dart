import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class LeisurePage4 extends StatelessWidget {
  const LeisurePage4({
    super.key,
    // this.controller,
  });

  // final LeisureSafetyController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CommonText(
          'Test Gas Appliances',
          fontSize: 34,
          fontWeight: FontWeight.bold,
          marginHorizontal: 0.04,
          marginTop: 0.08,
          fontColor: Color(AppColors.primary),
        ),
        GetBuilder<LeisureAppliancesController>(
          init: LeisureAppliancesController(),
          builder: (LeisureAppliancesController controller) {
            return CommonContainer(
              onPress: () {
                Get.to(() => const LeisureAppliances());
              },
              // style: appContainerStyles.formSectionsStyle,
              marginHorizontal: 0.04,
              marginVertical: 0.02,

              touchEffect: TouchableEffect(
                type: TouchTypes.opacity,
              ),
              child: CommonContainer(
                backgroundColor: Colors.grey[100],
                borderRadius: 0.01,
                paddingHorizontal: 0.03,
                paddingVertical: 0.03,
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
            );
          },
        ),
      ],
    );
  }
}
