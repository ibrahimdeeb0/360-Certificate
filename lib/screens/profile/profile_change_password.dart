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
            },
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles.copyWith(
              paddingTop: 0.025,
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CommonInput(
                          text: 'Current Password',
                          hint: 'Current Password',
                          controller: controller.currentPassController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          onChanged: (dynamic a) {
                            //  controller.isEnablePass();
                          },
                        ),
                        CommonInput(
                          text: 'New Password',
                          hint: 'New Password',
                          controller: controller.newPassController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                        ),
                        // CustomInput(
                        //   title: 'New Password',
                        //   hint: 'New Password',
                        //   controller: controller.newPassController,
                        //   textInputType: TextInputType.visiblePassword,
                        //   textInputAction: TextInputAction.next,
                        // ),
                        CommonInput(
                          text: 'Confirm New Password',
                          hint: 'Confirm New Password',
                          controller: controller.confirmNewPassController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.go,
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
