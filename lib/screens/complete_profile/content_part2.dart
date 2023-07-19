import '../../general_exports.dart';

class ContentPart2 extends StatelessWidget {
  const ContentPart2({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<CompleteProfileController>()) {
      return GetBuilder<CompleteProfileController>(
        init: CompleteProfileController(),
        builder: (CompleteProfileController controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              0.02.boxHeight,

              if (controller.formCertType == FormCertType.electrical)
                const ElectricalCompliance(),
              if (controller.formCertType == FormCertType.gas)
                const GasCompliance(),
              //
              if (controller.formCertType == FormCertType.electricalAndGas)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CommonText(
                      'Electrical Certificates',
                      fontColor: Colors.orange[800],
                      marginBottom: 0.02,
                      fontSize: fontH2,
                    ),
                    const ElectricalCompliance(
                      message:
                          "Great, you've chosen to create both electrical and gas certificates. We'll need your relevant board selection and the license number for the electrical certificates and your Gas Safe Register number for the gas certificates.",
                      boardMessage:
                          'First, please select your board for the electrical certificates from the list below:',
                      licenseMessage:
                          "Now, please enter your license number for the chosen board. If you don't have it on hand, you can add it later from your account settings, Please note that you won't be able to create certificates without valid license numbers.",
                    ),
                    CommonText(
                      'Gas Certificates',
                      fontColor: Colors.orange[800],
                      marginBottom: 0.02,
                      marginTop: 0.01,
                      fontSize: fontH2,
                    ),
                    const GasCompliance(
                      hideBoxMessage: true,
                      licenseMessage:
                          "Next, for your Gas certificates, please enter your Gas Safe Register number. Again, if you don't have this on hand, you can add it later from your account settings.",
                    ),
                  ],
                ),
            ],
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}

class GasCompliance extends StatelessWidget {
  const GasCompliance({
    super.key,
    this.licenseMessage,
    this.hideBoxMessage = false,
  });
  final String? licenseMessage;
  final bool hideBoxMessage;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteProfileController>(
      init: CompleteProfileController(),
      builder: (CompleteProfileController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (!hideBoxMessage)
              CommonContainer(
                style: appContainerStyles.cardStyle,
                marginBottom: 0.03,
                child: CommonText(
                  "Great, you've chosen to create gas certificates. For this, we'll need your Gas Safe Register number.",
                  textAlign: TextAlign.start,
                  fontSize: fontH3,
                  fontColor: Colors.grey[700],
                ),
              ),
            AttentionMessage(
              message: licenseMessage ??
                  "Please enter your Gas Safe Register number below. If you don't have it on hand, you can add it later from your account settings. Please note that you won't be able to create certificates without a valid Gas Safe Register number.",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (controller.gasRegisterNumber)
                    CommonInput(
                      topLabelText: 'Gas Safe Register Number',
                      hint: '0800 408 5500',
                      marginBottom: 0.015,
                      controller: controller.gasNumberController,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 0.65.flexWidth,
                        child: const CommonText(
                          "You don't have Gas Safe Register Number",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.gasRegisterNumber =
                              !(controller.gasRegisterNumber);
                          controller.update();
                        },
                        child: CommonText(
                          controller.gasRegisterNumber ? 'Skip' : 'Open',
                          fontColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class ElectricalCompliance extends StatelessWidget {
  const ElectricalCompliance({
    super.key,
    this.message,
    this.boardMessage,
    this.licenseMessage,
  });
  final String? message;
  final String? boardMessage;
  final String? licenseMessage;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteProfileController>(
      init: CompleteProfileController(),
      builder: (CompleteProfileController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.cardStyle,
              marginBottom: 0.03,
              child: CommonText(
                message ??
                    "Great, you've chosen to create electrical certificates. To ensure your compliance, we'll need you to select your board and enter your license number.",
                textAlign: TextAlign.start,
                fontSize: fontH3,
                fontColor: Colors.grey[700],
              ),
            ),
            CommonText(
              boardMessage ?? 'Please select your board from the list below:',
              marginBottom: 0.02,
              textAlign: TextAlign.start,
              rowMainAxisSize: MainAxisSize.max,
            ),
            ...controller.listElectricBoard.map(
              (Map<String, dynamic> item) => CustomCheckBox(
                title: item[keyName],
                onPress: () => controller.onSelectElectricBoard(item),
                isSelected: controller.selectedElectricBoard
                    .where((Map<String, dynamic> element) =>
                        element[keyId] == item[keyId])
                    .isNotEmpty,
              ),
            ),
            AttentionMessage(
              message: licenseMessage ??
                  "After you've made your selection, please enter your license number. If you don't have it on hand, you can add it later from your account settings. Please note that you won't be able to create certificates without a valid license number.",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (controller.toggleElectricalHaveLicense)
                    CommonInput(
                      topLabelText: 'License Number',
                      hint: 'DN8735',
                      controller: controller.electricalLicenseController,
                    ),
                  CommonText(
                    "You don't have license number",
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rowMainAxisSize: MainAxisSize.max,
                    rightChild: TextButton(
                      onPressed: () {
                        controller.toggleElectricalHaveLicense =
                            !(controller.toggleElectricalHaveLicense);
                        controller.update();
                      },
                      child: CommonText(
                        controller.toggleElectricalHaveLicense
                            ? 'Skip'
                            : 'Open',
                        fontColor: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    this.isSelected = false,
    this.title = '',
    this.onPress,
  });
  final bool isSelected;
  final String? title;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress,
      marginBottom: 0.02,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 0.8.flexWidth,
            child: CommonText(
              title ?? '',
              fontSize: fontTitle,
              fontColor: isSelected ? AppColors.primary : Colors.grey[700],
              rowMainAxisAlignment: MainAxisAlignment.start,
              rowMainAxisSize: MainAxisSize.max,
              textAlign: TextAlign.start,
            ),
          ),
          if (isSelected)
            Icon(
              Icons.check_box,
              color: Color(AppColors.primary),
            )
          else
            Icon(
              Icons.check_box_outline_blank,
              color: Colors.grey[600],
            ),
        ],
      ),
    );
  }
}
