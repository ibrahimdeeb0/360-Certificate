import '../../../general_exports.dart';

class SelectFormBT extends StatelessWidget {
  const SelectFormBT({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddFormTemplateController>(
      init: AddFormTemplateController(),
      builder: (AddFormTemplateController controller) {
        return BottomSheetContainer(
          title: 'Select Form',
          responsiveContent: true,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.03),
                ...controller.listAllForms.map(
                  (Map<String, dynamic> item) => CustomRadioSelection(
                    title: item[keyName],
                    onPress: () => controller.onSelectForm(item),
                    isSelected: controller.selectedForm?[keyId] == item[keyId],
                  ),
                ),
                ...controller.unActiveForms.map(
                  (Map<String, dynamic> item) => CustomRadioSelection(
                    title: item[keyName],
                    onPress: () {
                      if (!Get.isSnackbarOpen) {
                        showMessage(description: 'This Form Not Active');
                      }
                    },
                  ),
                ),
                SizedBox(height: DEVICE_HEIGHT * 0.02),
              ],
            ),
          ),
        );
      },
    );
  }
}
