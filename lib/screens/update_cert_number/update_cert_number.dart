import '../../general_exports.dart';

class UpdateCertNumber extends StatelessWidget {
  const UpdateCertNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: 'Important Numbers'),
      body: GetBuilder<UpdateCertNumberController>(
        init: UpdateCertNumberController(),
        builder: (UpdateCertNumberController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (!controller.isGas && (controller.isBoth == null))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonText(
                          'For Electrical Certificates',
                          fontColor: AppColors.primary,
                          marginBottom: 0.01,
                          marginTop: 0.03,
                        ),
                        AttentionMessage(
                          message:
                              "Please note that you won't be able to create certificates without valid license numbers.",
                          child: CommonInput(
                            topLabelText: 'License Number',
                            hint: 'type here',
                            controller: controller.electricalNumController,
                          ),
                        ),
                      ],
                    ),
                  if (controller.isGas && (controller.isBoth == null))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonText(
                          'For Gas Certificates',
                          fontColor: AppColors.primary,
                          marginBottom: 0.01,
                          marginTop: 0.03,
                        ),
                        AttentionMessage(
                          message:
                              " Please note that you won't be able to create certificates without a valid Gas Safe Register number.",
                          child: CommonInput(
                            topLabelText: 'Gas Safe Register Number',
                            hint: 'Please enter the gas registration number',
                            controller: controller.gasNumController,
                            maxLength: 7,
                          ),
                        ),
                      ],
                    ),
                  if (controller.isBoth != null && controller.isBoth == true)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonText(
                          'For Electrical Certificates',
                          fontColor: AppColors.primary,
                          marginBottom: 0.01,
                          marginTop: 0.03,
                        ),
                        AttentionMessage(
                          message:
                              "Please note that you won't be able to create certificates without valid license numbers.",
                          child: CommonInput(
                            topLabelText: 'License Number',
                            hint: 'type here',
                            controller: controller.electricalNumController,
                          ),
                        ),
                        CommonText(
                          'For Gas Certificates',
                          fontColor: AppColors.primary,
                          marginBottom: 0.01,
                          marginTop: 0.03,
                        ),
                        AttentionMessage(
                          message:
                              " Please note that you won't be able to create certificates without a valid Gas Safe Register number.",
                          child: CommonInput(
                            topLabelText: 'Gas Safe Register Number',
                            hint: 'Please enter the gas registration number',
                            controller: controller.gasNumController,
                            maxLength: 7,
                          ),
                        ),
                      ],
                    ),
                  CommonButton(
                    onPress: controller.onUpdateCertNumber,
                    text: 'Save',
                    marginBottom: 0.02,
                    marginTop: 0.05,
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
