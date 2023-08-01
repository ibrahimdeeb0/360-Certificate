import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class Instruction2 extends StatelessWidget {
  const Instruction2({
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
            padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                0.07.boxHeight,
                SvgPicture.asset(iconSetup),
                const CommonText(
                  "Ready to set up your account? We'll need a few details:",
                  marginVertical: 0.03,
                  fontWeight: FontWeight.bold,
                  fontSize: fontH2,
                  textAlign: TextAlign.start,
                ),
                const CommonText(
                  "1 - The certificates you're activating",
                  marginBottom: 0.015,
                  rowMainAxisSize: MainAxisSize.max,
                  textAlign: TextAlign.start,
                ),
                const CommonText(
                  '2 - Your company info',
                  marginBottom: 0.015,
                ),
                const CommonText(
                  '3 - Your professional license details, like NAPIT or Gas Safe registration',
                  marginBottom: 0.04,
                  rowMainAxisSize: MainAxisSize.max,
                  textAlign: TextAlign.start,
                ),
                CommonText(
                  '',
                  textAlign: TextAlign.start,
                  inlineSpans: <InlineSpan>[
                    TextSpan(
                      text: 'Post-setup, enjoy a  ',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: fontFamilyType,
                        fontSize: fontH3,
                      ),
                    ),
                    TextSpan(
                      text: '7-day trial ',
                      style: TextStyle(
                        color: Colors.orange[700],
                        fontFamily: fontFamilyType,
                        fontSize: fontH2,
                      ),
                    ),
                    TextSpan(
                      text:
                          'where you can create up to 20 certificates. Love our service? Just add your card details post-trial to stay active, continue creating certificates, and ensure easy compliance.',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: fontFamilyType,
                        fontSize: fontH3,
                      ),
                    ),
                  ],
                ),
                // CommonText(
                //   'If you find 360 connect certificate valuable and wish to continue using our service after the trial, you will need to enter your card details to keep your account active. this will allow you to keep creating certificates, staying connected, and ensuring compliance easily and effectively.',
                //   textAlign: TextAlign.start,
                //   fontColor: Colors.grey[700],
                //   marginBottom: 0.01,
                //   marginTop: 0.02,
                //   fontSize: fontH3,
                // ),
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
                  onPress: () {
                    // Get.offAllNamed(routeLogin);
                    myAppController.onSignOut();
                  },
                  overlayColor: Colors.grey[300],
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
