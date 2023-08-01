import '../../../general_exports.dart';

class UpdateLicenseNumbers extends StatelessWidget {
  const UpdateLicenseNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(
        title: 'License Details',
      ),
      body: GetBuilder<UpdateLicenseNumbersController>(
        init: UpdateLicenseNumbersController(),
        builder: (UpdateLicenseNumbersController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (homeController.isHaveElectrical)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonText(
                          'For Electrical Certificates',
                          marginTop: 0.03,
                          marginBottom: 0.01,
                          fontSize: fontH2,
                          fontColor: Color(AppColors.primary),
                        ),
                        AttentionMessage(
                          message:
                              "Please note that you won't be able to create Certificates without valid license number",
                          child: CommonInput(
                            topLabelText: 'License number',
                            // hint: '',
                            controller: controller.electricalNumController,
                          ),
                        ),
                      ],
                    ),
                  if (homeController.isHaveGas)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonText(
                          'For Gas Certificates',
                          marginTop: 0.03,
                          marginBottom: 0.01,
                          fontSize: fontH2,
                          fontColor: Color(AppColors.primary),
                        ),
                        AttentionMessage(
                          message:
                              "Please note that you won't be able to create Certificates without valid Gas Safe Register number",
                          child: CommonInput(
                            topLabelText: 'Gas Safe Register number',
                            // hint: '',
                            // value: homeController.gasNumber,
                            controller: controller.gasNumController,
                          ),
                        ),
                      ],
                    ),
                  0.13.boxHeight,
                  CommonButton(
                    onPress: controller.onUpdateCertNumber,
                    text: 'Save',
                    marginBottom: 0.03,
                    marginTop: 0.02,
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
