import 'package:easy_signature_pad/easy_signature_pad.dart';

import '../../../../../general_exports.dart';

class MinorWorksPage4 extends StatelessWidget {
  const MinorWorksPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinorWorksController>(
      init: MinorWorksController(),
      builder: (MinorWorksController controller) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              'Part 4: Declaration',
              fontColor: AppColors.primary,
              fontSize: fontH2,
              marginBottom: 0.02,
            ),
            CommonText(
              'I CERTIFY that the work covered by this certificate does not impair the safety of the existing installation and that the work has been designed, constructed, inspected and tested in accordance with BS 7671: 2018, amended to 2020 2022 date) and that to the best of my knowledge and belief, at the time of my inspection, complied with BS 7671: 2018+A2:2022 except as detailed in PART 2 of this certificate.',
              fontColor: Colors.grey[700],
              fontSize: fontH3,
              textAlign: TextAlign.start,
              marginBottom: 0.015,
            ),
            CommonInput(
              topLabelText: 'Name (CAPITAL)',
              marginTop: 0.01,
              marginBottom: 0.02,
              value: controller.formData[formKeyDeclaration]
                  [formKeyEngineerName],
              onChanged: (String value) => controller.dataSignature(
                  formKeyDeclaration, formKeyEngineerName, value),
              enabled: false,
            ),
            Align(
              child: CommonText(
                onPress: () => Get.bottomSheet(
                  elevation: 0.0,
                  BottomSheetContainer(
                    style: appContainerStyles.bottomSheetContainer().copyWith(
                          marginHorizontal: 0.05,
                          height: 0.55,
                          marginBottom: 0.2,
                          borderRadius: 0.06,
                          paddingBottom: 0.02,
                          clipBehavior: Clip.hardEdge,
                        ),
                    child: Column(
                      children: <Widget>[
                        const CommonText(
                          'Signature',
                          fontSize: fontH2,
                        ),
                        const CommonText(
                          'Draw your signature below',
                          fontSize: fontH2,
                        ),
                        SizedBox(
                          height: DEVICE_HEIGHT * 0.01,
                        ),
                        EasySignaturePad(
                          onChanged: (String image) {
                            controller.setImage(image);
                          },
                          height: DEVICE_WIDTH ~/ 1.5,
                          width: DEVICE_WIDTH ~/ 1.2,
                          strokeWidth: 4.0,
                          borderRadius: 10.0,
                          borderColor: Colors.grey,
                        ),
                        SizedBox(
                          height: DEVICE_HEIGHT * 0.01,
                        ),
                        CommonButton(
                          text: 'Save',
                          onPress: controller.onSendSignatureReportForm,
                        ),
                      ],
                    ),
                  ),
                  isScrollControlled: true,
                  enableDrag: false,
                ),
                'Tap Here To Sign',
                fontWeight: FontWeight.w500,
                fontColor: Color(AppColors.grey).withOpacity(0.8),
                containerStyle: CommonContainerModel(
                  width: 0.9,
                  height: 0.08,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  alignment: Alignment.center,
                  borderWidth: 1,
                  borderRadius: 0.01,
                  borderColor: Color(AppColors.grey).withOpacity(0.2),
                  touchEffect: TouchableEffect(
                    type: TouchTypes.opacity,
                  ),
                ),
              ),
            ),
            if (controller.signatureBytesImage != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  IconButton(
                    onPressed: controller.clearSignature,
                    icon: Icon(
                      Icons.highlight_remove_sharp,
                      color: Colors.red,
                      size: 0.08.flexWidth,
                    ),
                  ),
                  SizedBox(
                    height: DEVICE_WIDTH / 2,
                    width: DEVICE_WIDTH,
                    child: Image.memory(
                      controller.signatureBytesImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            CommonText(
              'for and on behalf of the Contractor identified in PART 1 of this Certificate',
              textAlign: TextAlign.start,
              fontColor: Colors.grey[500],
            ),
            const CommonInput(
              topLabelText: 'Position:',
              marginBottom: 0.02,
            ),
            const CommonInput(
              topLabelText: 'Date:',
              hint: 'Select Date',
              suffix: Icon(Icons.calendar_today_outlined),
              marginBottom: 0.02,
              enabled: false,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
              height: 0.05.flexHeight,
            ),
            0.01.boxHeight,
            CommonContainer(
              // style: appContainerStyles.formSectionsStyle,
              marginTop: 0.02,
              child: Column(
                children: <Widget>[
                  CommonText(
                    'The results of the inspection and testing reviewed by the Qualified Supervisor',
                    fontColor: Color(AppColors.primary),
                    textAlign: TextAlign.start,
                  ),
                  CommonInput(
                    topLabelText: 'Name (CAPITAL)',
                    marginTop: 0.01,
                    marginBottom: 0.02,
                    value: controller.formData[formKeyDeclaration]
                        [formKeyClientName],
                    onChanged: (String value) => controller.dataSignature(
                        formKeyDeclaration, formKeyClientName, value),
                  ),
                  Align(
                    child: CommonText(
                      onPress: () => Get.bottomSheet(
                        elevation: 0.0,
                        BottomSheetContainer(
                          style: appContainerStyles
                              .bottomSheetContainer()
                              .copyWith(
                                marginHorizontal: 0.05,
                                height: 0.55,
                                marginBottom: 0.2,
                                borderRadius: 0.06,
                                paddingBottom: 0.02,
                                clipBehavior: Clip.hardEdge,
                              ),
                          child: Column(
                            children: <Widget>[
                              const CommonText(
                                'Signature',
                                fontSize: fontH2,
                              ),
                              const CommonText(
                                'Draw your signature below',
                                fontSize: fontH2,
                              ),
                              SizedBox(
                                height: DEVICE_HEIGHT * 0.01,
                              ),
                              EasySignaturePad(
                                onChanged: (String image) {
                                  controller.setCustomerImage(image);
                                },
                                height: DEVICE_WIDTH ~/ 1.5,
                                width: DEVICE_WIDTH ~/ 1.2,
                                strokeWidth: 4.0,
                                borderRadius: 10.0,
                                borderColor: Colors.grey,
                              ),
                              SizedBox(
                                height: DEVICE_HEIGHT * 0.01,
                              ),
                              CommonButton(
                                text: 'Save',
                                onPress: controller.saveCustomerSignature,
                              ),
                            ],
                          ),
                        ),
                        isScrollControlled: true,
                        enableDrag: false,
                      ),
                      'Tap Here To Sign',
                      fontWeight: FontWeight.w500,
                      fontColor: Color(AppColors.grey).withOpacity(0.8),
                      containerStyle: CommonContainerModel(
                        width: 0.9,
                        height: 0.08,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        alignment: Alignment.center,
                        borderWidth: 1,
                        borderRadius: 0.01,
                        borderColor: Color(AppColors.grey).withOpacity(0.2),
                        touchEffect: TouchableEffect(
                          type: TouchTypes.opacity,
                        ),
                      ),
                    ),
                  ),
                  if (controller.signatureBytes2 != null &&
                      controller.customerSignatureBytes != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        IconButton(
                          onPressed: controller.clearCustomerSignature,
                          icon: Icon(
                            Icons.highlight_remove_sharp,
                            color: Colors.red,
                            size: 0.08.flexWidth,
                          ),
                        ),
                        SizedBox(
                          height: DEVICE_WIDTH / 2,
                          width: DEVICE_WIDTH,
                          child: Image.memory(
                            controller.customerSignatureBytes!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  0.01.boxHeight,
                  const CommonInput(
                    topLabelText: 'Date:',
                    hint: 'Select Date',
                    suffix: Icon(Icons.calendar_today_outlined),
                    marginBottom: 0.02,
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 3,
                    height: 0.05.flexHeight,
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
