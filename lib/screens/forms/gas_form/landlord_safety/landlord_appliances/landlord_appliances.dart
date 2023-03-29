import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class LandlordAppliances extends StatelessWidget {
  const LandlordAppliances({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandlordAppliancesController>(
      init: LandlordAppliancesController(),
      builder: (LandlordAppliancesController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: '',
            // rightText: 'Done',
            // withActionText: true,
            // onPressActionText: Get.back,
          ),
          body: CommonContainer(
            width: 1,
            height: 1,
            paddingHorizontal: 0.04,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                  CommonText(
                    'TEST GAS APPLIANCES',
                    fontColor: AppColors.textGrey,
                    fontWeight: FontWeight.w500,
                    rowMainAxisSize: MainAxisSize.max,
                    textAlign: TextAlign.start,
                    containerStyle:
                        const CommonContainerModel(marginBottom: 0.01),
                  ),
                  ApplianceCard(
                    onPress: () => Get.to(
                      () => const LandlordAppliancesDetails(),
                      transition: Transition.leftToRight,
                      duration: const Duration(milliseconds: 300),
                    ),
                  ),
                  CommonButton(
                    onPress: () {
                      Get.to(() => const LandlordAppliancesDetails());
                    },
                    marginVertical: 0.04,
                    child: const CommonText(
                      'Add New Appliance',
                      fontColor: Colors.white,
                      marginHorizontal: 0.02,
                      leftChild: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ApplianceCard extends StatelessWidget {
  const ApplianceCard({
    super.key,
    this.onPress,
    this.text,
    this.id = 1,
  });
  final Function? onPress;
  final String? text;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress,
      style: CommonContainerModel(
        backgroundColor: Color(AppColors.grey).withOpacity(0.1),
        width: 1,
        borderRadius: 0.02,
        paddingTop: 0.015,
        paddingBottom: 0.015,
        paddingHorizontal: 0.03,
        borderWidth: 1,
        borderColor: AppColors.grey,
        touchEffect: TouchableEffect(
          type: TouchTypes.opacity,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset(
            icoBagWork,
            width: 0.025.flexWidth,
            height: 0.07.flexHeight,
          ),
          CommonText(
            'Appliance $id: ',
            fontSize: fontTitle,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
            bottomChild: const SizedBox(),
            containerStyle: const CommonContainerModel(
              width: 0.62,
              marginLeft: 0.02,
              alignment: AlignmentDirectional.topStart,
            ),
            rightChild: const CommonText(
              'Training Room',
              textAlign: TextAlign.start,
              rowMainAxisSize: MainAxisSize.max,
              containerStyle: CommonContainerModel(
                width: 0.36,
                marginLeft: 0.01,
                alignment: AlignmentDirectional.topStart,
              ),
              bottomChild: SizedBox(),
            ),
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
