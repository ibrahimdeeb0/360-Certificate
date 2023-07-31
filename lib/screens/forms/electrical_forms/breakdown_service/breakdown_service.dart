import '../../../../general_exports.dart';

class BreakdownService extends StatelessWidget {
  const BreakdownService({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakdownServiceController>(
      init: BreakdownServiceController(),
      builder: (BreakdownServiceController controller) {
        return Scaffold(
          appBar: FormHeader(
            withBack: false,
            title: 'Breakdown/Service Record',
            circleNumbering: '',
            actionItem: ActionItem(
              type: ActionType.image,
            ),
            pressImage: () {
              Get.to(() => const MinorAddImage());
            },
            pressNote: () {
              Get.to(() => const MinorAddNote());
            },
          ),
          body: CommonContainer(
            width: 1,
            height: 1,
            backgroundColor: AppColors.white,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.04.flexWidth,
                        vertical: 0.02.flexHeight,
                      ),
                      child: Column(
                        children: <Widget>[
                          controller.listFormSections[controller.selectedId],
                          SizedBox(height: DEVICE_HEIGHT * 0.09),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CommonContainer(
                    paddingHorizontal: 0.03,
                    width: 1,
                    backgroundColor: Colors.white,
                    borderTopWidth: 3,
                    borderTopColor: AppColors.greyLightBorder,
                    paddingVertical: 0.015,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CommonButton(
                          onPress: controller.onBack,
                          text: controller.selectedId == 0 ? 'Cancel' : 'Back',
                          backgroundColor: Colors.white,
                          fontColor: AppColors.primary,
                          borderWidth: 1.5,
                          borderColor: AppColors.primary,
                          width: 0.44,
                        ),
                        CommonButton(
                          // text: controller.finalPageButton(),
                          text: 'Next',
                          onPress: controller.onPress,
                          width: 0.44,
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
