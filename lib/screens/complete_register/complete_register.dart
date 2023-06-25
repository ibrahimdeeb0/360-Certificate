import '../../general_exports.dart';

class CompleteRegister extends StatelessWidget {
  const CompleteRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CompleteRegisterController>(
        init: CompleteRegisterController(),
        builder: (CompleteRegisterController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 0.08.flexHeight),
                    child: Row(
                      children: <Widget>[
                        CommonText(
                          'Welcome, Randy Stokes',
                          fontSize: fontBigTitle,
                          marginRight: 0.02,
                          fontColor: AppColors.primary,
                        ),
                        Image.asset(
                          imageHello,
                          width: DEVICE_WIDTH * 0.15,
                          height: DEVICE_WIDTH * 0.15,
                        ),
                      ],
                    ),
                  ),
                  CommonText(
                    'We are thrilled to have you on board with 360 Connect Certificates - a dedicated platform created exclusively for engineers like you. Our goal is to streamline and simplify the certificate creation process for properties across a variety of areas, including EICR, PAT Testing, Gas Safety, and beyond.',
                    textAlign: TextAlign.start,
                    fontColor: AppColors.grey,
                    fontSize: fontH3,
                    marginTop: 0.02,
                  ),
                  CommonText(
                    'As you embark on this journey with us, we will guide you step by step to optimally set up your account. This process involves collecting some necessary details to ensure that your experience is tailor-made for your unique needs. Rest assured, it will be a seamless and secure journey.',
                    textAlign: TextAlign.start,
                    fontColor: AppColors.grey,
                    fontSize: fontH3,
                    marginTop: 0.02,
                  ),
                  CommonText(
                    'We understand the importance of trust, especially when it comes to your data. We are fully committed to maintaining the highest standards of data protection. Please remember that WE NEVER SELL OR SHARE ANY OF YOUR DATA stored within our system. Your privacy, trust, and security are paramount to us.',
                    textAlign: TextAlign.start,
                    fontColor: AppColors.grey,
                    fontSize: fontH3,
                    marginTop: 0.02,
                  ),
                  CommonText(
                    'Welcome to the 360 Connect Certificates community! We are excited to partner with you, aiding in the efficient creation of essential property certificates, ultimately propelling your business to greater heights.',
                    textAlign: TextAlign.start,
                    fontColor: AppColors.grey,
                    fontSize: fontH3,
                    marginTop: 0.02,
                  ),
                  SizedBox(
                    height: 0.13.flexHeight,
                  ),
                  CommonButton(
                    text: 'Go To Set Up Your Account',
                    onPress: () => Get.to(const SetupAccount()),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
