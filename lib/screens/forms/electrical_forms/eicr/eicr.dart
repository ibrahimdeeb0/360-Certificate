import '../../../../general_exports.dart';

class EICR extends StatelessWidget {
  const EICR({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EicrController>(
      init: EicrController(),
      // global: false,
      builder: (EicrController controller) {
        return Scaffold(
          appBar: FormHeader(
            withBack: false,
            title: 'EICR',
            circleNumbering: controller.pagesNum(),
            showSaveBtn: controller.selectedId != 21,
            onPressSave: () => controller.onPressNext(fromSave: true),
          ),
          // floatingActionButton: FloatingActionButton(onPressed: () {
          //   consoleLog(myAppController.selectedForm);
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
                        ...controller.listFormSections.map(
                          (dynamic element) =>
                              element[keyId] == controller.selectedId
                                  ? controller.returnedSection(
                                      controller: controller,
                                      sectionName: element[keyName],
                                    )
                                  : const SizedBox(),
                        ),
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
                          onPress: controller.onPressNext,
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
