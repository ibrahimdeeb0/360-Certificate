import 'package:flutter_svg/flutter_svg.dart';

import '../../../general_exports.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color(AppColors.primaryOpacity),
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // logo and title
              CommonContainer(
                style: appContainerStyles.containerStyles.copyWith(
                  width: .7,
                  height: .268,
                  paddingTop: .05,
                  backgroundColor: AppColors.primaryOpacity,
                ),
                child: SvgPicture.asset(
                  iconAppLogo,
                  width: DEVICE_WIDTH * 0.5,
                ),
              ),
              // Login container
              CommonContainer(
                style: appContainerStyles.loginContainer.copyWith(
                  height: 0.73,
                  topLeftRadius: 0.07,
                  topRightRadius: 0.07,
                ),
                child: Column(
                  children: <Widget>[
                    CommonText(
                      'Login your account',
                      fontWeight: FontWeight.w500,
                      columnCrossAxisAlignment: CrossAxisAlignment.start,
                      fontSize: fontH1,
                      fontColor: AppColors.black3,
                      containerStyle: const CommonContainerModel(
                        width: 1,
                        marginTop: 0.01,
                        marginBottom: 0.01,
                      ),
                    ),
                    CommonInput(
                      topLabelText: 'Your Email',
                      hint: 'Enter Your Email',
                      controller: controller.emailController,
                    ),
                    CommonInput(
                      topLabelText: 'Password',
                      hint: 'Enter Your Password',
                      controller: controller.passwordController,
                      obscureText: controller.isVisibility,
                      suffix: CommonContainer(
                        onPress: () => controller.visibility(),
                        style: const CommonContainerModel(
                          marginHorizontal: 0.015,
                        ),
                        child: Icon(
                          controller.isVisibility
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CommonContainer(
                      style: const CommonContainerModel(
                        width: 0.9,
                        marginVertical: 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CommonText(
                            onPress: controller.updateRememberMe,
                            containerStyle: CommonContainerModel(
                              touchEffect:
                                  TouchableEffect(type: TouchTypes.opacity),
                            ),
                            '  Remember me',
                            style: appTextStyles.h3GreyStyle(),
                            leftChild: Icon(
                              controller.rememberMe
                                  ? Icons.check_box_rounded
                                  : Icons.check_box_outline_blank_rounded,
                              color: Color(
                                controller.rememberMe
                                    ? AppColors.primary
                                    : AppColors.grey,
                              ),
                            ),
                          ),
                          CommonText(
                            onPress: () {
                              // consoleLog(myAppController.userData);
                            },
                            containerStyle: CommonContainerModel(
                              touchEffect:
                                  TouchableEffect(type: TouchTypes.opacity),
                            ),
                            'forgot password ?',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                        ],
                      ),
                    ),
                    CommonButton(
                      text: 'Login',
                      onPress: () => controller.loginValidator(),
                      marginBottom: 0.02,
                    ),
                    CommonText(
                      "Don't have an account ?  ",
                      containerStyle: const CommonContainerModel(
                        marginBottom: 0.02,
                        alignment: Alignment.topLeft,
                      ),
                      rightChild: CommonText(
                        onPress: () {},
                        // onPress: () {
                        //   Get.to(() => const RegisterScreen());
                        //   // Get.to(() => const EmailVerifyScreen());
                        // },
                        containerStyle: CommonContainerModel(
                          touchEffect:
                              TouchableEffect(type: TouchTypes.opacity),
                        ),
                        'Create a new account',
                        fontColor: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              // bottom radius container
            ],
          ),
        ),
      ),
    );
  }
}
