import 'package:flutter_svg/flutter_svg.dart';

import '../../../general_exports.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) => SingleChildScrollView(
          child: CommonContainer(
            style: appContainerStyles.containerStyles,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.08),
                SvgPicture.asset(
                  iconAppLogo,
                  width: DEVICE_WIDTH * 0.5,
                  height: DEVICE_HEIGHT * 0.03,
                ),
                CommonText(
                  'Login your account',
                  fontWeight: FontWeight.bold,
                  columnCrossAxisAlignment: CrossAxisAlignment.start,
                  fontSize: 28,
                  fontColor: AppColors.black3,
                  containerStyle: const CommonContainerModel(
                    width: 1,
                    marginTop: 0.03,
                    marginBottom: 0.035,
                  ),
                ),
                CommonInput(
                  topLabelText: 'Your Email',
                  hint: 'Enter Your Email',
                  controller: controller.emailController,
                  marginBottom: 0.02,
                ),
                CommonInput(
                  topLabelText: 'Password',
                  hint: 'Enter Your Password',
                  marginBottom: 0.02,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CommonText(
                      onPress: controller.updateRememberMe,
                      containerStyle: CommonContainerModel(
                        touchEffect: TouchableEffect(type: TouchTypes.opacity),
                      ),
                      'Remember me',
                      fontSize: fontH3,
                      fontColor: Colors.grey[700],
                      marginLeft: 0.02,
                      leftChild: controller.rememberMe
                          ? Icon(
                              Icons.check_box_rounded,
                              color: Color(AppColors.primary),
                            )
                          : Icon(
                              Icons.check_box_outline_blank_rounded,
                              color: Colors.grey[500],
                            ),
                    ),
                    CommonText(
                      onPress: () {
                        // consoleLog(myAppController.userData);
                      },
                      containerStyle: CommonContainerModel(
                        touchEffect: TouchableEffect(type: TouchTypes.opacity),
                      ),
                      'forgot password ?',
                      fontSize: fontH3,
                      fontColor: Colors.grey[700],
                    ),
                  ],
                ),
                CommonButton(
                  text: 'Login',
                  onPress: () => controller.loginValidator(),
                  marginBottom: 0.025,
                  marginTop: 0.04,
                ),
                CommonText(
                  "Don't have an account ?  ",
                  containerStyle: const CommonContainerModel(
                    marginBottom: 0.02,
                    alignment: Alignment.topLeft,
                  ),
                  rightChild: CommonText(
                    // onPress: () {},
                    onPress: () {
                      Get.to(() => const Register());
                      // Get.to(() => const EmailVerifyScreen());
                    },
                    containerStyle: CommonContainerModel(
                      touchEffect: TouchableEffect(type: TouchTypes.opacity),
                    ),
                    'Create a new account',
                    fontColor: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
