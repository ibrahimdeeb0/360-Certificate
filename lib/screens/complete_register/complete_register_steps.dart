import '../../general_exports.dart';

class CompleteRegisterSteps extends StatelessWidget {
  const CompleteRegisterSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(
        title: '',
      ),
      body: GetBuilder<CompleteRegisterController>(
        init: CompleteRegisterController(),
        builder: (CompleteRegisterController controller) {
          return CommonContainer(
            width: 1,
            height: 1,
            child: Column(
              children: <Widget>[
                CommonContainer(
                  paddingHorizontal: 0.04,
                  paddingVertical: 0.01,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  style: const CommonContainerModel(
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 0.75.flexWidth,
                        child: controller.title(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            TweenAnimationBuilder<double>(
                              tween: Tween<double>(
                                begin: 0.0,
                                end: controller.currentIndex == 0
                                    ? 0.20
                                    : controller.currentIndex == 1
                                        ? 0.40
                                        : controller.currentIndex == 2
                                            ? 0.60
                                            : controller.currentIndex == 3
                                                ? 0.80
                                                : 1,
                              ),
                              duration: const Duration(milliseconds: 700),
                              builder:
                                  (BuildContext context, double value, _) =>
                                      CircularProgressIndicator(
                                value: value,
                                color: Color(AppColors.primary),
                              ),
                            ),
                            Align(
                              child: CommonText(
                                controller.currentIndex == 0
                                    ? '1/5'
                                    : controller.currentIndex == 1
                                        ? '2/5'
                                        : controller.currentIndex == 2
                                            ? '3/5'
                                            : controller.currentIndex == 3
                                                ? '4/5'
                                                : '5/5',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        if (controller.currentIndex == 0)
                          const CompleteRegisterStep1(),
                        if (controller.currentIndex == 1)
                          const CompleteRegisterSteps2(),
                        if (controller.currentIndex == 2)
                          const CompleteRegisterSteps3(),
                        // if (controller.currentIndex == 3) const Content4(),
                      ],
                    ),
                  ),
                ),
                ButtonComponents(
                  width: 0.9,
                  onPress: () {
                    controller.onPress();
                  },
                  text: 'Next',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
