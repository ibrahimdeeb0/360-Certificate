import '../../general_exports.dart';

class CreateCustomerV2 extends StatelessWidget {
  const CreateCustomerV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerV2Controller>(
      init: CreateCustomerV2Controller(),
      builder: (CreateCustomerV2Controller controller) {
        return WillPopScope(
          onWillPop: () async {
            controller.onPressBack();
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                CreateCustomerHeader(
                  currentIndex: controller.index,
                  pressBack: () {
                    controller.onPressBack();
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        0.02.boxHeight,
                        controller.stepsWidgets[controller.index],
                        0.03.boxHeight,
                      ],
                    ),
                  ),
                ),
                CommonButton(
                  enabled: controller.enableButton,
                  onPress: controller.onPressNext,
                  marginHorizontal: 0.04,
                  marginBottom: 0.02,
                  marginTop: 0.01,
                  child: CommonText(
                    controller.index == 2 ? 'Start Inspection' : 'Next',
                    marginHorizontal: 0.02,
                    fontColor: Colors.white,
                    rightChild: controller.index == 2
                        ? const SizedBox()
                        : const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
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
