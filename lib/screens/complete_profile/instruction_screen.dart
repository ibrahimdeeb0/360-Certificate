import '../../general_exports.dart';

class Instruction extends StatelessWidget {
  const Instruction({
    required this.controller,
    super.key,
  });
  final CompleteProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  0.07.boxHeight,
                  CommonText(
                    'Welcome, ${controller.fName}',
                    fontWeight: FontWeight.bold,
                    fontSize: fontBigTitle,
                    marginRight: 0.03,
                    rowMainAxisAlignment: MainAxisAlignment.center,
                    rightChild: Image.asset(
                      imageHello,
                      width: DEVICE_WIDTH * 0.1,
                      height: DEVICE_HEIGHT * 0.1,
                    ),
                  ),
                  CommonText(
                    'Great to have you onboard 360 Connect Certificates - your easy solution for EICR, PAT Testing, and Gas Safety certificates.',
                    // 'We are thrilled to have you on board with 360 Connect Certificates - a dedicated platform created exclusively for engineers like you. Our goal is to streamline and simplify the certificate creation process for properties across a variety of areas, including EICR, PAT Testing, Gas Safety, and beyond.',
                    textAlign: TextAlign.start,
                    fontColor: Colors.grey[700],
                    marginBottom: 0.01,
                    fontSize: fontH3,
                  ),
                  CommonText(
                    "We'll guide you through a quick setup, ensuring a tailored experience just for you. Your data's safety is our priority - we never sell or share it.",
                    // 'As you embark on this journey with us, we will guide you step by step to optimally set up your account. This process involves collecting some necessary details to ensure that your experience is tailor-made for your unique needs. Rest assured, it will be a seamless and secure journey.',
                    textAlign: TextAlign.start,
                    fontColor: Colors.grey[700],
                    marginBottom: 0.01,
                    fontSize: fontH3,
                  ),
                  // CommonText(
                  //   'We understand the importance of trust, especially when it comes to your data. We are fully committed to maintaining the highest standards of data protection. Please remember that WE NEVER SELL OR SHARE ANY OF YOUR DATA stored within our system. Your privacy, trust, and security are paramount to us.',
                  //   textAlign: TextAlign.start,
                  //   fontColor: Colors.grey[700],
                  //   marginBottom: 0.01,
                  //   fontSize: fontH3,
                  // ),
                  CommonText(
                    '',
                    textAlign: TextAlign.start,
                    inlineSpans: <InlineSpan>[
                      TextSpan(
                        text: 'Welcome to the  ',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: fontFamilyType,
                          fontSize: fontH3,
                        ),
                      ),
                      TextSpan(
                        text: '360 Connect Certificates  ',
                        style: TextStyle(
                          color: Colors.orange[700],
                          fontFamily: fontFamilyType,
                          fontSize: fontH3,
                        ),
                      ),
                      TextSpan(
                        text:
                            "community. Let's simplify your certification process and take your business to new heights.",
                        // 'community! We are excited to partner with you, aiding in the efficient creation of essential property certificates, ultimately propelling your business to greater heights.',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: fontFamilyType,
                          fontSize: fontH3,
                        ),
                      ),
                    ],
                  ),
                  CommonText(
                    'Ready to get started?',
                    // "We'll guide you through a quick setup, ensuring a tailored experience just for you. Your data's safety is our priority - we never sell or share it.",
                    // 'As you embark on this journey with us, we will guide you step by step to optimally set up your account. This process involves collecting some necessary details to ensure that your experience is tailor-made for your unique needs. Rest assured, it will be a seamless and secure journey.',
                    textAlign: TextAlign.start,
                    fontColor: Colors.grey[700],
                    marginBottom: 0.01,
                    marginTop: 0.015,
                    // fontSize: fontH3,
                  ),
                ],
              ),
            ),
            0.3.boxHeight,
            CommonButton(
              onPress: () {
                controller.setupStatus = SetupStatus.start2;
                controller.update();
                consoleLog(controller.setupStatus);
              },
              marginBottom: 0.03,
              marginTop: 0.15,
              marginHorizontal: 0.04,
              child: const CommonText(
                'Go To Set Up Your Account',
                marginHorizontal: 0.02,
                fontColor: Colors.white,
                fontWeight: FontWeight.bold,
                rightChild: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
