import '../../general_exports.dart';

class CompleteFillData extends StatelessWidget {
  const CompleteFillData({
    required this.controller,
    super.key,
  });

  final CompleteProfileController controller;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      width: 1,
      height: 1,
      backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          // Header
          CommonContainer(
            style: appContainerStyles.bottomShadowStyle,
            paddingHorizontal: 0.04,
            paddingBottom: 0.02,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                0.06.ph,
                CommonContainer(
                  onPress: controller.onBack,
                  touchEffect: TouchableEffect(
                    type: TouchTypes.opacity,
                  ),
                  marginBottom: 0.015,
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CommonText(
                      controller.headerTitle(),
                      fontSize: fontH2,
                      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                      rowMainAxisSize: MainAxisSize.max,
                      textAlign: TextAlign.start,
                      bottomChild: const SizedBox(),
                      containerStyle: const CommonContainerModel(
                        width: 0.77,
                      ),
                    ),
                    SetupTweenCircle(controller: controller),
                  ],
                ),
              ],
            ),
          ),
          // Body
          Expanded(
            child: CommonContainer(
              paddingHorizontal: 0.04,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    controller.pagesContents(),
                  ],
                ),
              ),
            ),
          ),
          // Buttons
          CommonButton(
            onPress: controller.onNext,
            marginBottom: 0.02,
            marginHorizontal: 0.04,
            child: CommonText(
              controller.currentPage == CurrentPage.page2 ? 'Finished' : 'Next',
              marginHorizontal: 0.02,
              fontColor: Colors.white,
              fontWeight: FontWeight.bold,
              rightChild: controller.currentPage == CurrentPage.page2
                  ? const SizedBox()
                  : const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
            ),
          )
        ],
      ),
    );
  }
}

class SetupTweenCircle extends StatelessWidget {
  const SetupTweenCircle({
    required this.controller,
    super.key,
  });

  final CompleteProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 0.0,
            end: controller.pagesCircleTween(),
          ),
          duration: const Duration(milliseconds: 700),
          builder: (BuildContext context, double value, _) =>
              CircularProgressIndicator(
            value: value,
            color: Color(AppColors.primary),
            backgroundColor: Colors.grey[300],
          ),
        ),
        Align(
          child: CommonText(
            controller.pagesNumTween(),
          ),
        ),
      ],
    );
  }
}
