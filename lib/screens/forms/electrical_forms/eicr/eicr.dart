import '../../../../general_exports.dart';

class EICR extends StatelessWidget {
  const EICR({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EicrController>(
      init: EicrController(),
      builder: (EicrController controller) {
        return Scaffold(
          appBar: AppBar(
            title: const CommonText('EICR'),
            actions: <Widget>[
              CircleNumbering(
                numbers: controller.pagesNum(),
              ),
            ],
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: DEVICE_HEIGHT * 0.03),
                    const CommonText('Body'),
                    SizedBox(height: DEVICE_HEIGHT * 0.06),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CommonContainer(
                    borderTopWidth: 3,
                    borderTopColor: AppColors.greyLightBorder,
                    paddingVertical: 0.015,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CommonButton(
                          onPress: () {},
                          text: 'Cancel',
                          backgroundColor: Colors.white,
                          fontColor: AppColors.primary,
                          borderWidth: 1.5,
                          borderColor: AppColors.primary,
                          width: 0.43,
                        ),
                        CommonButton(
                          onPress: () {},
                          text: 'Next',
                          width: 0.43,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CircleNumbering extends StatelessWidget {
  const CircleNumbering({
    Key? key,
    this.numbers,
  }) : super(key: key);

  final String? numbers;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      size: 0.11,
      marginHorizontal: 0.02,
      boxShape: BoxShape.circle,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: 1,
            ),
            duration: const Duration(milliseconds: 700),
            builder: (BuildContext context, double value, _) =>
                const CommonContainer(
              boxShape: BoxShape.circle,
              size: 0.11,
              child: CircularProgressIndicator(
                value: 1,
                strokeWidth: 3.0,
              ),
            ),
          ),
          Align(
            child: CommonText(
              numbers ?? '',
              style: appTextStyles.h4MediumStyleBlack().copyWith(
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    columnMainAxisAlignment: MainAxisAlignment.center,
                  ),
              containerStyle: const CommonContainerModel(
                padding: 0.01,
                size: 0.11,
                boxShape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
