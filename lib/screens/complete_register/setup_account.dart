import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class SetupAccount extends StatelessWidget {
  const SetupAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CompleteRegisterController>(
        init: CompleteRegisterController(),
        builder: (CompleteRegisterController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 0.08.flexHeight),
                    child: SvgPicture.asset(appSettings),
                  ),
                  const CommonText(
                    "To set up your account, we'll need a few important details from you:",
                    fontSize: fontH2,
                    textAlign: TextAlign.start,
                    marginTop: 0.02,
                  ),
                  SizedBox(
                    height: 0.02.flexHeight,
                  ),
                  CommonText(
                    '2 - Your company information',
                    columnCrossAxisAlignment: CrossAxisAlignment.start,
                    marginBottom: 0.02,
                    marginTop: 0.02,
                    fontColor: Colors.grey[700],
                    fontSize: fontTitle,
                    topChild: CommonText(
                      '1 - The types of certificates you wish to activate',
                      fontColor: AppColors.black2,
                      fontSize: fontTitle,
                    ),
                    bottomChild: CommonText(
                      '3 - Your professional license information, such as your NAPIT or Gas Safe registration number',
                      fontColor: AppColors.black2,
                      fontSize: fontTitle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  CommonText(
                    'If you find 360 connect certificate valuable and wish to continue using our service after the trial, you will need to enter your card details to keep your account active. this will allow you to keep creating certificates, staying connected, and ensuring compliance easily and effectively.',
                    fontColor: Colors.grey[600],
                    fontSize: fontH3,
                    textAlign: TextAlign.start,
                    marginTop: 0.02,
                    topChild: CommonText(
                      "Once your account is set up, you'll automatically begin a 7-day trial period. during this trial, you'll be able to create up to 20 certificates.",
                      fontColor: Colors.grey[600],
                      fontSize: fontH3,
                      textAlign: TextAlign.start,
                      marginTop: 0.02,
                    ),
                  ),
                  SizedBox(
                    height: 0.18.flexHeight,
                  ),
                  CommonButton(
                    text: 'Next',
                    onPress: () => Get.to(const CompleteRegisterSteps()),
                  ),
                  SizedBox(
                    height: 0.01.flexHeight,
                  ),
                  const CommonButton(
                    text: 'Close my account ',
                    backgroundColor: Colors.white,
                    fontColor: Colors.black,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
