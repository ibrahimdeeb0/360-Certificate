import 'package:easy_signature_pad/easy_signature_pad.dart';

import '../../../../../general_exports.dart';

class PortableTestPage2 extends StatelessWidget {
  const PortableTestPage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PortableTestController>(
      init: PortableTestController(),
      builder: (PortableTestController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginTop: 0.0,
              child: Column(
                children: <Widget>[
                  0.02.ph,
                  const CustomTextFormTitle(
                    leftText: '',
                    text: 'SIGNATURE OF ENGINEER',
                    marginBottom: 0.02,
                  ),
                  const CommonText(
                    'l/We, being the person/s responsible for the PAT testing certify the the electrical appliances details in this certificate and record sheets have been tested for electrical safety in accordance with the IET code of practice for in service and inspection and testing of electrical test equipment.',
                    fontSize: fontH3,
                    textAlign: TextAlign.start,
                    marginBottom: 0.02,
                  ),
                  CommonInput(
                    maxLines: 4,
                    textInputAction: TextInputAction.newline,
                    hint: 'type...',
                    value: controller.formData[formKeyDeclaration]
                        [formKeyLimitationsAgreedTesting],
                    onChanged: (String value) =>
                        controller.onChangeFormDataValue(
                      formKeyDeclaration,
                      formKeyLimitationsAgreedTesting,
                      value,
                    ),
                  ),
                  CommonInput(
                    topLabelText: 'Name (CAPITAL)',
                    marginTop: 0.02,
                    marginBottom: 0.02,
                    value: controller.formData[formKeyDeclaration]
                        [formKeyNameInspectionBy],
                    onChanged: (String value) =>
                        controller.onChangeFormDataValue(
                            formKeyDeclaration, formKeyNameInspectionBy, value),
                    enabled: false,
                  ),
                  CommonInput(
                    topLabelText: 'Date :',
                    marginBottom: 0.02,
                    enabled: false,
                    value: controller.formData[formKeyDeclaration]
                        [formKeyDateInspectionBy],
                    onTap: () {
                      CommonDatePicker.showDatePicker(
                        context,
                        currentTime: DateTime.now(),
                        onConfirm: (DateTime date) {
                          controller.onSelectDate(
                            formKeyDeclaration,
                            formKeyDateInspectionBy,
                            date,
                          );
                        },
                      );
                    },
                    suffix: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey,
                    ),
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
          ],
        );
      },
    );
  }
}
