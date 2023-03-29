import 'package:easy_signature_pad/easy_signature_pad.dart';

import '../../../../../general_exports.dart';

class LandlordPage5 extends StatelessWidget {
  const LandlordPage5({
    super.key,
    // this.controller,
  });

  // final LandlordSafetyController? controller;

  @override
  Widget build(BuildContext context) {
    final LandlordSafetyController controller =
        Get.put(LandlordSafetyController());
    return Column(
      children: <Widget>[
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          child: Column(
            children: <Widget>[
              CustomTextFormTitle(
                leftText: '',
                text: 'Record Issue By'.toUpperCase(),
              ),
              const CommonInput(
                topLabelText: 'Name (CAPITAL)',
                marginTop: 0.01,
                marginBottom: 0.02,
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
                              // controller.setImage(image);
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
                          const CommonButton(
                            text: 'Save',
                            // onPress: controller.onSendSignatureReportForm,
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
            ],
          ),
        ),
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          marginTop: 0.0,
          child: Column(
            children: <Widget>[
              CustomTextFormTitle(
                leftText: '',
                text: 'Received By'.toUpperCase(),
              ),
              const CommonInput(
                topLabelText: 'Name (CAPITAL)',
                marginTop: 0.01,
                marginBottom: 0.02,
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
                              // controller.setImage(image);
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
                          const CommonButton(
                            text: 'Save',
                            // onPress: controller.onSendSignatureReportForm,
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
            ],
          ),
        ),
      ],
    );
  }
}
