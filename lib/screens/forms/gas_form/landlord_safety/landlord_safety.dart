import '../../../../general_exports.dart';

class LandlordSafety extends StatelessWidget {
  const LandlordSafety({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandlordSafetyController>(
      init: LandlordSafetyController(),
      builder: (LandlordSafetyController controller) {
        return Scaffold(
          appBar: FormHeader(
            withBack: false,
            title: 'Landlord/Homeowner Gas Safety Record',
            circleNumbering: controller.pagesNum(),
            showSaveBtn: ((controller.selectedId !=
                        controller.listFormSections.length - 1 &&
                    controller.selectedId != 0) &&
                !controller.isTemplate!),
            onPressSave: () => controller.onNext(fromSave: true),
          ),
          // floatingActionButton: FloatingActionButton(onPressed: () {
          //   consoleLog(controller.siteId);
          // }),
          body: CommonContainer(
            width: 1,
            height: 1,
            backgroundColor: AppColors.greyLightBorder,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      children: <Widget>[
                        controller.listFormSections[controller.selectedId],
                        SizedBox(height: DEVICE_HEIGHT * 0.09),
                      ],
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
                          onPress: controller.onPressBack,
                          text: controller.selectedId == 0 ? 'Cancel' : 'Back',
                          backgroundColor: Colors.white,
                          fontColor: AppColors.primary,
                          borderWidth: 1.5,
                          borderColor: AppColors.primary,
                          width: 0.44,
                        ),
                        CommonButton(
                          text: controller.finalPageButton(),
                          onPress: controller.onNext,
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
