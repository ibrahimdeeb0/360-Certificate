import '../../../../general_exports.dart';

class EICR extends StatelessWidget {
  const EICR({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EicrController>(
      init: EicrController(),
      builder: (EicrController controller) {
        return Scaffold(
          appBar: FormHeader(
            title: 'EICR',
            circleNumbering: controller.pagesNum(),
          ),
          body: CommonContainer(
            width: 1,
            height: 1,
            backgroundColor: Colors.black12,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: CommonContainer(
                    paddingHorizontal: 0.03,
                    height: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: DEVICE_HEIGHT * 0.03),
                          EICRRemarkSection(controller: controller),
                          SizedBox(height: DEVICE_HEIGHT * 0.11),
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
                          onPress: () {},
                          text: 'Cancel',
                          backgroundColor: Colors.white,
                          fontColor: AppColors.primary,
                          borderWidth: 1.5,
                          borderColor: AppColors.primary,
                          width: 0.44,
                        ),
                        CommonButton(
                          onPress: () {},
                          text: 'Next',
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
