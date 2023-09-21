import '../../../general_exports.dart';

class CretificatesValidate extends StatelessWidget {
  const CretificatesValidate({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CretificatesValidateController>(
        init: CretificatesValidateController(),
        builder: (CretificatesValidateController controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: const Header(
              title: 'Cretificates Validate',
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonContainer(
                    style: appContainerStyles.bottomShadowStyle,
                    marginTop: 0.02,
                    child: CommonInput(
                      hint: 'Search for Cretificates ',
                      width: 1,
                      controller: controller.seachController,
                      onChanged: controller.onSearch,
                      keyboardType: TextInputType.name,
                      fillColor: AppColors.greyInputs,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  ...controller.filtterForm
                      .map(
                        (dynamic childe) => ChildeItemsValidate(
                          text: childe[keyTitle],
                          onPress: childe[keyOnPress],
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          );
        });
  }
}
