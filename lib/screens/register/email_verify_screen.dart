import '../../../general_exports.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (RegisterController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: CommonContainer(
              style: appContainerStyles.containerStyles,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.25),
                  CommonContainer(
                    child: Column(
                      children: <Widget>[
                        Image.asset(imageEmailVerify),
                        CommonText(
                          'Verify Your Email Address',
                          style: appTextStyles.h1StyleBlack().copyWith(),
                          marginVertical: 0.04,
                          bottomChild: Padding(
                            padding: EdgeInsets.only(
                              bottom: DEVICE_HEIGHT * 0.02,
                            ),
                            child: CommonText(
                              '${Get.arguments['email']}',
                              style: appTextStyles.h2MediumStyle().copyWith(
                                    fontColor: AppColors.textGrey,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.2),
                  CommonButton(
                    onPress: () => Get
                      ..back()
                      ..back(),
                    text: 'Go Login',
                    marginVertical: 0.025,
                    width: 1,
                    height: 0.06,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
