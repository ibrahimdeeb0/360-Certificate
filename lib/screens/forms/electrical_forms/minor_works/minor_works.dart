import '../../../../general_exports.dart';

class MinorWorks extends StatelessWidget {
  const MinorWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinorWorksController>(
      init: MinorWorksController(),
      builder: (MinorWorksController controller) {
        return Scaffold(
          appBar: FormHeader(
            withBack: false,
            title: 'Minor Works',
            circleNumbering: '',
            showSaveBtn: (controller.selectedId !=
                    controller.listFormSections.length - 1) &&
                !controller.isTemplate!,
            onPressSave: () {
              controller.onNext(fromSave: true);
            },
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
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     List<Map<String, dynamic>> data = [];
          //     if (controller.imagesData.isNotEmpty) {
          //       for (FormImageClass item in controller.imagesData) {
          //         data.add(
          //           <String, dynamic>{
          //             'id': item.id,
          //             'exclude': item.isIncluded ? 'yes' : 'no',
          //             'note': item.note,
          //             'image': item.image,
          //           },
          //         );
          //       }
          //     }
          //     consoleLog(controller.imagesData);
          //     consoleLogPretty(data);
          //   },
          // ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.miniStartTop,
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
