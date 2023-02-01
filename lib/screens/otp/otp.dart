import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../general_exports.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: '',
        withShadow: false,
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<OTPController>(
        init: OTPController(),
        builder: (OTPController controller) {
          return CommonContainer(
            paddingHorizontal: 0.04,
            paddingTop: 0.02,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommonText(
                  'approve_number'.tr,
                  fontSize: fontH1,
                ),
                CommonText(
                  '${'enter_sent_otp'.tr} ${Get.arguments?[keyTitle]}',
                  marginTop: 0.01,
                  textAlign: TextAlign.start,
                  fontColor: Colors.black87,
                ),
                CommonContainer(
                  paddingHorizontal: 0.1,
                  marginTop: 0.04,
                  child: PinCodeTextField(
                    enableActiveFill: true,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    length: 4,
                    autoFocus: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(DEVICE_WIDTH * 0.02),
                      fieldHeight: DEVICE_WIDTH * 0.12,
                      fieldWidth: DEVICE_WIDTH * 0.11,
                      borderWidth: 2,
                      fieldOuterPadding: EdgeInsets.zero,
                      activeFillColor: Color(AppColors.greyInputs),
                      inactiveFillColor: Color(AppColors.greyInputs),
                      selectedFillColor: Color(AppColors.greyInputs),
                      inactiveColor: Colors.transparent,
                      activeColor: Colors.transparent,
                      selectedColor: Colors.black87,
                    ),
                    animationDuration: const Duration(
                      milliseconds: 300,
                    ),
                    backgroundColor: Color(AppColors.white),
                    cursorColor: Colors.black,
                    cursorHeight: 1,
                    cursorWidth: DEVICE_HEIGHT * 0.02,
                    controller: controller.textEditingController,
                    keyboardType: TextInputType.number,
                    onCompleted: controller.onVerifyLogin,
                    appContext: context,
                    focusNode: controller.focusNode,
                    onChanged: (String value) {
                      consoleLog(value);
                    },
                  ),
                ),
                if (controller.isError)
                  CommonText(
                    'error_otp_code'.tr,
                    marginHorizontal: 0.01,
                    leftChild: const Icon(
                      Icons.info_outline,
                      color: Colors.orange,
                    ),
                    fontSize: 15,
                  ),
                SizedBox(
                  height: DEVICE_HEIGHT * 0.02,
                ),
                if (controller.time == 0)
                  CommonText(
                    'resend_otp_'.tr,
                    textAlign: TextAlign.start,
                    fontColor: AppColors.primary,
                    onPress: controller.resetTimer,
                    fontSize: 15,
                  )
                else
                  CommonText(
                    '${'resend_otp'.tr} 0${controller.time <= 59 ? 0 : ((controller.time / 60)).toStringAsFixed(0)} : ${controller.time % 60 >= 10 ? controller.time % 60 : '0${controller.time % 60}'}',
                    textAlign: TextAlign.start,
                    fontSize: 15,
                    fontColor: Colors.black54,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
