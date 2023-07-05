import 'package:flutter_svg/flutter_svg.dart';

import '../../general_exports.dart';

class CompleteRegisterSteps3 extends StatelessWidget {
  const CompleteRegisterSteps3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteRegisterController>(
      init: CompleteRegisterController(),
      builder: (CompleteRegisterController controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonContainer(
                borderRadius: 0.01,
                backgroundColor: Colors.grey[200],
                paddingHorizontal: 0.02,
                paddingVertical: 0.01,
                child: CommonText(
                  "Now that we have your license information, let's move on to your company details. Please provide the following:",
                  textAlign: TextAlign.start,
                  fontSize: fontH3,
                  fontColor: Colors.grey[600],
                ),
              ),
              const CommonInput(
                topLabelText: 'Registered Company Name *',
                hint: 'Registered Company Name',
              ),
              const CommonInput(
                topLabelText: 'Trading Name  (Optional)',
                hint: 'Trading Name',
              ),
              const CommonText(
                'If your company trades under a different name, please enter it here',
                fontColor: Colors.grey,
                textAlign: TextAlign.start,
              ),
              const CommonInput(
                topLabelText: 'Registration Number  (Optional) ',
                hint: "Enter Your Company's Official Registration Number",
              ),
              const CommonInput(
                topLabelText: 'VAT Number  (Optional)',
                hint: 'VAT Number',
              ),
              const CommonText(
                "Upload Your Company's Logo (Optional)",
                marginTop: 0.01,
              ),
              CommonText(
                'This will be displayed on your certificates and profile',
                fontSize: fontH3,
                textAlign: TextAlign.start,
                marginTop: 0.01,
                marginBottom: 0.01,
                fontColor: Colors.grey[400],
              ),
              InkWell(
                onTap: () {
                  // consoleLog('value');
                },
                child: SvgPicture.asset(
                  iconAttachCompLogo,
                  width: DEVICE_WIDTH * 0.25,
                  height: DEVICE_WIDTH * 0.25,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
