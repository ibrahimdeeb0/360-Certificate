import '../../../general_exports.dart';

class UpdateLicenseNumbers extends StatelessWidget {
  const UpdateLicenseNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Header(
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
                        CommonText(
                          '',
                          marginTop: 0.01,
                          marginBottom: 0.01,
                          fontSize: fontH3,
                          textAlign: TextAlign.start,
                          // fontColor: Color(AppColors.primary),
                          inlineSpans: <InlineSpan>[
                            const TextSpan(
                              text: 'You are selected the ',
                            ),
                            TextSpan(
                              text:
                                  '${controller.selectedBoard?[keyName] ?? ''}',
                              style:
                                  TextStyle(color: Color(AppColors.deepOrange)),
                            ),
                            const TextSpan(
                              text: ' do you want change it ?',
                            ),
                          ],
                          rightChild: Switch(
                            value: controller.isBoardFrom,
                            onChanged: (bool value) {
                              controller.isBoardFrom = value;
                              controller.update();
                              consoleLog(controller.isBoardFrom);
                            },
                            activeColor: Colors.green,
                          ),
                        ),
                        if (controller.isBoardFrom == true)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const CommonText(
                                'Please select your board from the list below:',
                                marginBottom: 0.02,
                                marginTop: 0.03,
                                textAlign: TextAlign.start,
                                rowMainAxisSize: MainAxisSize.max,
                              ),
                              ...controller.listElectricBoard.map(
                                (Map<String, dynamic> item) =>
                                    CustomRadioSelection(
                                  title: item[keyName],
                                  onPress: () {
                                    controller.onSelectElectricBoard(item);
                                  },
                                  isSelected: controller.selectedNewBoard ==
                                      item['id'].toString(),
                                ),
                              ),
                              0.03.boxHeight,
                            ],
                          ),
                        0.02.boxHeight,
                        AttentionMessage(
                          message:
                              "Please note that you won't be able to create Certificates without valid license number",
                          child: CommonInput(
                            topLabelText: 'License number',
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
                            hint: 'Please Add Gas Reg Number',
                            // value: homeController.gasNumber,
                            controller: controller.gasNumController,
                            maxLength: 7,
                          ),
                        ),
                      ],
                    ),
                  0.08.boxHeight,
                  CommonButton(
                    onPress: () {
                      // consoleLog(controller.electricalNumController.text);
                      // consoleLog(homeController.electricNumber);
                      if (controller.electricalNumController.text !=
                              homeController.electricNumber ||
                          controller.gasNumController.text !=
                              homeController.gasNumber) {
                        controller.onUpdateCertNumber();
                      }

                      if (controller.isBoardFrom &&
                          (controller.selectedNewBoard != null)) {
                        controller.onUpdateBoardFrom();
                      }

                      Get.back();
                    },
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
