import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteProfileController>(
      init: CompleteProfileController(),
      builder: (CompleteProfileController controller) {
        return Scaffold(
          appBar: Header(
            title: '',
            withShadow: false,
            onPressBack: controller.onPressBack,
            actionItem: ActionItem(
              type: ActionType.support,
              onPress: () => consoleLog('value'),
            ),
          ),
          backgroundColor: Colors.white,
          body: CommonContainer(
            paddingHorizontal: 0.04,
            paddingBottom: 0.03,
            child: controller.viewGuides
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: SvgPicture.asset(
                              iconGuides,
                              width: DEVICE_WIDTH * 0.8,
                            ),
                          ),
                          CommonText(
                            'ahm_guides'.tr,
                            fontSize: fontH1,
                            marginTop: 0.01,
                            marginBottom: 0.03,
                          ),
                          const DotText(),
                          const DotText(),
                          const DotText(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CommonText(
                            'accept_term'.tr,
                            containerStyle: const CommonContainerModel(),
                            marginHorizontal: 0.01,
                            fontColor: Colors.black87,
                            onPress: controller.changeCheck,
                            leftChild: Icon(
                              controller.isAccepted
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: controller.isAccepted
                                  ? Color(AppColors.primary)
                                  : Colors.black,
                            ),
                          ),
                          CommonButton(
                            text: 'login'.tr,
                            marginTop: 0.03,
                            enabled: controller.isAccepted,
                            onPress: controller.onLogin,
                          ),
                        ],
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: DEVICE_HEIGHT * 0.02),
                      CommonText(
                        'enter_full_name'.tr,
                        fontSize: fontH1,
                        marginBottom: 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <CommonInput>[
                          CommonInput(
                            width: 0.42,
                            hint: 'first_name'.tr,
                            controller: controller.firstNameController,
                            onChanged: controller.onChanged,
                          ),
                          CommonInput(
                            width: 0.42,
                            hint: 'last_name'.tr,
                            controller: controller.lastNameController,
                            onChanged: controller.onChanged,
                          ),
                        ],
                      ),
                      // Button
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: CommonButton(
                          enabled: controller.isButtonEnable,
                          onPress: controller.onPressComplete,
                          marginTop: 0.03,
                          child: CommonText(
                            'next'.tr,
                            fontColor: controller.isButtonEnable
                                ? Colors.white
                                : Colors.black,
                            rowCrossAxisAlignment: CrossAxisAlignment.center,
                            marginHorizontal: 0.01,
                            leftChild: Icon(
                              Icons.arrow_back_sharp,
                              color: controller.isButtonEnable
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class DotText extends StatelessWidget {
  const DotText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonText(
      'this_text'.tr,
      marginHorizontal: 0.02,
      leftChild: Icon(
        Icons.circle,
        size: DEVICE_WIDTH * 0.02,
      ),
    );
  }
}
