import '../../general_exports.dart';

class DevelopmentForms extends StatelessWidget {
  const DevelopmentForms({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoreController>(
      init: MoreController(),
      builder: (MoreController controller) {
        return Scaffold(
          appBar: const Header(
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
                  ...controller.formItems.map(
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
                  ),
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
