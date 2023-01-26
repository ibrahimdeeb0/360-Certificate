import '../../general_exports.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GetBuilder<HomeController>(
        init: homeController,
        builder: (HomeController controller) {
          return CommonContainer(
            height: 1,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const HomeSlider(),
                  CommonContainer(
                    backgroundColor: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: DEVICE_HEIGHT * 0.03),

                        // bottom bar height
                        SizedBox(height: DEVICE_HEIGHT * 0.072),
                      ],
                    ),
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

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderComponent(
      height: DEVICE_HEIGHT * 0.38,
      items: <dynamic>[
        Stack(
          children: <Widget>[
            Image.asset(
              imageSlider,
              fit: BoxFit.cover,
              width: DEVICE_WIDTH * 1,
              height: DEVICE_HEIGHT * 1,
            ),
            Image.asset(
              imageHomeSlider,
              fit: BoxFit.cover,
              width: DEVICE_WIDTH * 1,
              height: DEVICE_HEIGHT * 1,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'professional_touches'.tr,
                    style: appTextStyles.h1Style(),
                    fontWeight: FontWeight.bold,
                    fontColor: AppColors.yellow,
                    marginHorizontal: 0.03,
                    marginBottom: 0.005,
                  ),
                  CommonText(
                    'full_care_and_attention_is_in_your_hands'.tr,
                    style: appTextStyles.h2StyleWhite(),
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    marginHorizontal: 0.03,
                    marginBottom: 0.02,
                  ),
                  CommonText(
                    'find_out_more'.tr,
                    onPress: () {},
                    style: appTextStyles.h3StyleWhite(),
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    marginHorizontal: 0.03,
                    marginRight: 0.02,
                    rightChild: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    containerStyle: CommonContainerModel(
                      touchEffect: TouchableEffect(
                        type: TouchTypes.scaleAndUp,
                        lowerBound: 0.9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
