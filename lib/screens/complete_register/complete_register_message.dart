import 'package:flutter_svg/flutter_svg.dart';

import '../../general_exports.dart';

class CompleteRegisterMessage extends StatelessWidget {
  const CompleteRegisterMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<CompleteRegisterController>(
        init: CompleteRegisterController(),
        builder: (CompleteRegisterController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            marginTop: 0.08,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset(iconSetupDone),
                const CommonText(
                  "Congratulations, you've successfully set up your 360 Connect Certificate account!",
                  textAlign: TextAlign.start,
                  marginVertical: 0.03,
                ),
                CommonText(
                  "You are now ready to start creating certificates. As part of our welcome, you are on a 7-day free trial during which you can create up to 20 certificates. We hope you'll find our platform user-friendly and beneficial for your business needs.",
                  textAlign: TextAlign.start,
                  fontSize: fontH3,
                  fontColor: Colors.grey[600],
                ),
                CommonText(
                  "We're thrilled to have you on board. Should you have any questions or require any assistance, our support team is always here to help. Happy certifying!",
                  textAlign: TextAlign.start,
                  fontSize: fontH3,
                  fontColor: Colors.grey[600],
                  marginTop: 0.02,
                ),
                const Spacer(),
                CommonButton(
                  marginBottom: 0.03,
                  text: 'Start !',
                  onPress: () {},
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
