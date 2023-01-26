import '../../general_exports.dart';

class SuccessAddClass {
  SuccessAddClass({
    this.title,
    this.supTitle,
    this.buttonTitle,
    this.onPressButton,
  });

  final String? title;
  final String? supTitle;
  final String? buttonTitle;
  final Function()? onPressButton;
}

class SuccessAddSheet extends StatelessWidget {
  const SuccessAddSheet({super.key, this.data});

  final SuccessAddClass? data;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: '',
      height: 0.4,
      child: Align(
        child: Column(
          children: <Widget>[
            CircleContainer(
              circuitSize: 0.3,
              marginBottom: 0.02,
              iconWidget: Image.asset(imageSuccessAdd),
            ),
            CommonText(
              data?.title ?? 'car_was_added'.tr,
              marginBottom: 0.01,
              containerStyle: const CommonContainerModel(
                marginBottom: 0.02,
              ),
              bottomChild: CommonText(
                data?.supTitle ?? 'you_can_now_browse_text'.tr,
                fontColor: AppColors.greyDark,
              ),
            ),
            CommonButton(
              text: data?.buttonTitle ?? 'browse_services'.tr,
              marginTop: 0.02,
              onPress: data?.onPressButton?.call ??
                  () {
                    if (Get.isBottomSheetOpen!) {
                      Get.back();
                    }
                  },
            ),
          ],
        ),
      ),
    );
  }
}
