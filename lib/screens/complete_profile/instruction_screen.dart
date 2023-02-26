import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class Instruction extends StatelessWidget {
  const Instruction({
    required this.controller,
    super.key,
  });
  final CompleteProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                0.08.ph,
                SvgPicture.asset(iconSetup),
                const CommonText(
                  'Hello, Nick',
                  marginVertical: 0.03,
                  fontWeight: FontWeight.bold,
                  fontSize: fontBigTitle,
                ),
                CommonText(
                  'First we would like to thank you for joining the 360 connect community allowing other traders like you help run their business.',
                  textAlign: TextAlign.start,
                  fontColor: Colors.grey[700],
                  marginBottom: 0.01,
                  fontSize: fontH3,
                ),
                CommonText(
                  'Over the next few steps want to take some details to help set-up your account!',
                  textAlign: TextAlign.start,
                  fontColor: Colors.grey[700],
                  marginBottom: 0.01,
                  fontSize: fontH3,
                ),
                CommonText(
                  "Just so you know to build our community stronger we take data very serious. We don't sell or share any data you have in our system.",
                  textAlign: TextAlign.start,
                  fontColor: Colors.grey[700],
                  marginBottom: 0.01,
                  fontSize: fontH3,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommonButton(
                  onPress: () {
                    controller.setupStatus = SetupStatus.fill;
                    controller.update();
                    consoleLog(controller.setupStatus);
                  },
                  marginBottom: 0.015,
                  child: const CommonText(
                    'Get Started',
                    marginHorizontal: 0.02,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    rightChild: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
                CommonButton(
                  text: 'Close my account',
                  fontColor: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  onPress: () {},
                  overlayColor: Colors.grey,
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  marginBottom: 0.02,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
