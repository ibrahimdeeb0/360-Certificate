import 'package:easy_signature_pad/easy_signature_pad.dart';

import '../../../../../general_exports.dart';

class WarningNoticePage3 extends StatelessWidget {
  const WarningNoticePage3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarningNoticeController>(
      init: WarningNoticeController(),
      builder: (WarningNoticeController controller) {
        return Column(
          children: <Widget>[
            // CommonButton(
            //   onPress: () {
            //     consoleLog(controller.applianceData);
            //   },
            // ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              child: Column(
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: '',
                    text: 'Engineer’s Signature',
                  ),
                  CommonInput(
                    topLabelText: 'Name (CAPITAL)',
                    marginTop: 0.01,
                    marginBottom: 0.02,
                    value: controller.formData[formKeyDeclaration]
                        [formKeyEngineerName],
                    enabled: false,
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
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginTop: 0.0,
              child: Column(
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: '',
                    text: 'Customer Signature',
                  ),
                  CommonInput(
                    topLabelText: 'Name (CAPITAL)',
                    marginTop: 0.01,
                    // marginBottom: 0.01,
                    value: controller.formData[formKeyDeclaration]
                        [formKeyCustomerName],
                    onChanged: (String value) =>
                        controller.onChangeFormDataValue(
                            formKeyDeclaration, formKeyCustomerName, value),
                  ),
                  CommonInput(
                    topLabelText: 'Date :',
                    marginBottom: 0.02,
                    enabled: false,
                    value: controller.formData[formKeyDeclaration]
                        [formKeyCustomerDate],
                    onTap: () {
                      CommonDatePicker.showDatePicker(
                        context,
                        currentTime: DateTime.now(),
                        onConfirm: (DateTime date) {
                          controller.onSelectDate(
                            formKeyDeclaration,
                            formKeyCustomerDate,
                            date,
                          );
                        },
                      );
                    },
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
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
