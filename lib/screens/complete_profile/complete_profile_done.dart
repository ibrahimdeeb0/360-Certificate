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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                0.08.ph,
                SvgPicture.asset(iconSetupDone),
                const CommonText(
                  'Great Nick, You are now ready to start using 360 connect!',
                  marginVertical: 0.03,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.bold,
                  fontSize: fontBigTitle,
                ),
                CommonText(
                  'Now you are part of the 360 Connect community. Please share any feedback you have. We do listen!',
                  textAlign: TextAlign.start,
                  fontColor: Colors.grey[700],
                  marginBottom: 0.01,
                  fontSize: fontH3,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonButton(
                onPress: () {
                  controller.onCompleteProfile();
                },
                marginBottom: 0.015,
                text: 'Get Started !',
                marginHorizontal: 0.04,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
