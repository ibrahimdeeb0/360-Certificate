import '../../general_exports.dart';

class ProfileChangePassword extends StatelessWidget {
  const ProfileChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Change Password',
            onPressBack: () {
              hideKeyboard();
              Get.back();
            },
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: DEVICE_HEIGHT * 0.03),
                        CommonInput(
                          topLabelText: 'Current Password',
                          hint: 'Current Password',
                          controller: controller.currentPassController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          onChanged: controller.onCheckChangPass,
                          marginBottom: 0.02,
                        ),
                        CommonInput(
                          topLabelText: 'New Password',
                          hint: 'New Password',
                          controller: controller.newPassController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          marginBottom: 0.02,
                          onChanged: controller.onCheckChangPass,
                        ),
                        // CustomInput(
                        //   title: 'New Password',
                        //   hint: 'New Password',
                        //   controller: controller.newPassController,
                        //   textInputType: TextInputType.visiblePassword,
                        //   textInputAction: TextInputAction.next,
                        // ),
                        CommonInput(
                          topLabelText: 'Confirm New Password',
                          hint: 'Confirm New Password',
                          controller: controller.confirmNewPassController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          onChanged: controller.onCheckChangPass,
                          marginBottom: 0.02,
                        ),
                        // CustomInput(
                        //   title: 'Confirm New Password',
                        //   hint: 'Confirm New Password',
                        //   controller: controller.confirmNewPassController,
                        //   textInputType: TextInputType.visiblePassword,
                        //   textInputAction: TextInputAction.go,
                        // ),
                      ],
                    ),
                  ),
                ),
                CommonButton(
                  enabled: controller.isEnablePass,
                  onPress: () => controller.onPressNewPass(),
                  text: 'Save New Password',
                  width: 1,
                  height: 0.06,
                  marginBottom: 0.02,
                  marginTop: 0.015,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
