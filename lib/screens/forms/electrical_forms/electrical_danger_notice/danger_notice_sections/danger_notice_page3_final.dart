import 'package:easy_signature_pad/easy_signature_pad.dart';

import '../../../../../general_exports.dart';

class DangerNoticePage3 extends StatelessWidget {
  const DangerNoticePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DangerNoticeController>(
      init: DangerNoticeController(),
      builder: (DangerNoticeController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // const ApplianceSectionTitle(
                  //   title: 'CONTRACTOR NOTIFYING THE DANGEROUS CONDITION',
                  // ),
                  const CustomTextFormTitle(
                    leftText: '',
                    text: 'CONTRACTOR NOTIFYING THE DANGEROUS CONDITION',
                  ),
                  CommonInput(
                    topLabelText: 'Name (CAPITAL)',
                    marginTop: 0.01,
                    marginBottom: 0.02,
                    value: controller.formData[formKeyDeclaration]
                        [formKeyEngineerName],
                    onChanged: (String value) =>
                        controller.onChangeFormDataValue(
                            formKeyDeclaration, formKeyEngineerName, value),
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
                  CommonInput(
                    topLabelText: 'Position',
                    marginBottom: 0.015,
                    onChanged: (String? value) =>
                        controller.onChangeFormDataValue(
                            formKeyDeclaration, formKeyEngineerPosition, value),
                    value: controller.formData[formKeyDeclaration]
                        [formKeyEngineerPosition],
                  ),
                  CommonInput(
                    topLabelText: 'Enrollment Number (if applicable)',
                    onChanged: (String? value) =>
                        controller.onChangeFormDataValue(
                            formKeyDeclaration, formKeyEnrollmentNumber, value),
                    value: controller.formData[formKeyDeclaration]
                        [formKeyEnrollmentNumber],
                  ),

                  CustomTextFormTitle(
                    leftText: '',
                    text: 'Received By'.toUpperCase(),
                    marginTop: 0.03,
                  ),
                  CommonInput(
                    topLabelText: 'Name (CAPITAL)',
                    marginTop: 0.01,
                    marginBottom: 0.02,
                    value: controller.formData[formKeyDeclaration]
                        [formKeyClientName],
                    onChanged: (String value) =>
                        controller.onChangeFormDataValue(
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
                  CommonInput(
                    topLabelText: 'Position',
                    marginBottom: 0.015,
                    onChanged: (String? value) =>
                        controller.onChangeFormDataValue(
                            formKeyDeclaration, formKeyClientPosition, value),
                    value: controller.formData[formKeyDeclaration]
                        [formKeyClientPosition],
                  ),
                  // CommonInput(
                  //   topLabelText: 'Date',
                  //   onChanged: (String? value) =>
                  //       controller.onChangeFormDataValue(
                  //           formKeyDeclaration, formKeyReceivedDate, value),
                  //   value: controller.formData[formKeyDeclaration]
                  //       [formKeyReceivedDate],
                  // ),
                  CommonInput(
                    topLabelText: 'Date',
                    onTap: () {
                      CommonDatePicker.showDatePicker(
                        context,
                        currentTime: controller.selectedDate ?? DateTime.now(),
                        onConfirm: (DateTime value) {
                          controller.onSelectDate(
                            formKeyDeclaration,
                            formKeyReceivedDate,
                            value,
                          );
                        },
                      );
                    },
                    enabled: false,
                    hint: 'select',
                    marginBottom: 0.02,
                    suffix: const Icon(Icons.keyboard_arrow_down),
                    value: controller.formData[formKeyDeclaration]
                        [formKeyReceivedDate],
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
