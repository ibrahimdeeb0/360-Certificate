import '../../general_exports.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: '',
      ),
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CommonText(
                    'Forget Password',
                    fontWeight: FontWeight.bold,
                    columnCrossAxisAlignment: CrossAxisAlignment.start,
                    fontSize: 28,
                    fontColor: AppColors.black3,
                    containerStyle: const CommonContainerModel(
                      width: 1,
                      marginBottom: 0.02,
                    ),
                  ),
                  CommonText(
                    "Enter the email address associated with your account and we'll send you a link to reset your password",
                    fontWeight: FontWeight.w500,
                    columnCrossAxisAlignment: CrossAxisAlignment.start,
                    textAlign: TextAlign.start,
                    fontSize: fontH3,
                    fontColor: Colors.grey[700],
                  ),
                  CommonInput(
                    topLabelText: 'Your Email',
                    hint: 'Enter Your Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    marginVertical: 0.03,
                  ),
                  CommonButton(
                    onPress: controller.onResetPassword,
                    text: 'Send',
                    marginBottom: 0.02,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
