import '../../general_exports.dart';

class Forms extends StatelessWidget {
  const Forms({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormsController>(
      init: FormsController(),
      builder: (FormsController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Forms',
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            paddingHorizontal: 0.02,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: DEVICE_HEIGHT * 0.02,
                  ),
                  ...homeBottomBarController.bottomBarItems
                      .map(
                        (dynamic item) => ExpandableTile(
                          title: item[keyTitle],
                          titleColor: AppColors.primary,
                          children: <Widget>[
                            ...item[keyItems]
                                .map(
                                  (dynamic childe) => ChildeItems(
                                    text: childe[keyTitle],
                                    onPress: childe[keyOnPress],
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      )
                      .toList(),
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
