import '../../general_exports.dart';

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonContainer(
        style: appContainerStyles.containerStyles,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: DEVICE_HEIGHT * 0.15),
                child: Image.asset(imageEmailVerify),
              ),
            ),
            const CommonText(
              'Verify Your Email Address',
              fontSize: 28,
              marginTop: 0.02,
              marginBottom: 0.01,
            ),
            CommonText(
              "You've entered  ${Get.arguments['email']}  as the email address for your account, please verify this email address",
              fontColor: AppColors.greyDark,
            ),
            SizedBox(
              height: DEVICE_HEIGHT * 0.2,
            ),
            CommonButton(
              text: 'Go To Login',
              onPress: () {
                Get.toNamed(routeLogin);
              },
              marginBottom: 0.03,
              height: 0.06,
              paddingHorizontal: 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
