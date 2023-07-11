import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class CompleteProfileDone extends StatelessWidget {
  const CompleteProfileDone({
    required this.controller,
    super.key,
  });
  final CompleteProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CompleteProfileController>(
        init: CompleteProfileController(),
        builder: (CompleteProfileController controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    0.08.boxHeight,
                    SvgPicture.asset(
                      iconSetupDone,
                      color: Colors.green[600],
                    ),
                    const CommonText(
                      "Congratulations, you've successfully set up your 360 Connect Certificate account!",
                      marginVertical: 0.03,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.bold,
                      fontSize: fontH1,
                    ),
                    if (!(controller.toggleElectricalHaveLicense) ||
                        !(controller.gasRegisterNumber))
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CommonText(
                            "You are now on a 7-day free trial during which you can create up to 20 certificates. We hope you'll find our platform user-friendly and valuable for your business needs.",
                            textAlign: TextAlign.start,
                            fontColor: Colors.grey[700],
                            marginBottom: 0.02,
                            fontSize: fontH3,
                          ),
                          CommonText(
                            "However, we've noticed you still have some missing information. Please remember to fill in your license number(s) as soon as possible in your account settings. Without this information, you won't be able to create certificates.",
                            textAlign: TextAlign.start,
                            fontColor: Colors.grey[700],
                            marginBottom: 0.02,
                            fontSize: fontH3,
                          ),
                          CommonText(
                            "We're delighted to have you on board and we look forward to supporting your engineering services. If you have any questions or need any assistance, don't hesitate to contact our support team. Happy certifying",
                            textAlign: TextAlign.start,
                            fontColor: Colors.grey[700],
                            marginBottom: 0.01,
                            fontSize: fontH3,
                          ),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CommonText(
                            "You are now ready to start creating certificates. As part of our welcome, you are on a 7-day free trial during which you can create up to 20 certificates. We hope you'll find our platform user-friendly and beneficial for your business needs.",
                            textAlign: TextAlign.start,
                            fontColor: Colors.grey[700],
                            marginBottom: 0.02,
                            fontSize: fontH3,
                          ),
                          CommonText(
                            "We're thrilled to have you on board. Should you have any questions or require any assistance, our support team is always here to help. Happy certifying!",
                            textAlign: TextAlign.start,
                            fontColor: Colors.grey[700],
                            marginBottom: 0.01,
                            fontSize: fontH3,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonButton(
                    onPress: controller.pressDone,
                    marginBottom: 0.015,
                    text: 'Get Started !',
                    marginHorizontal: 0.04,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
