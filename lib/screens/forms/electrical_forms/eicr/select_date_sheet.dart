import '../../../../../general_exports.dart';

class SelectDateSheet extends StatelessWidget {
  const SelectDateSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EicrController>(
      init: EicrController(),
      builder: (EicrController controller) {
        return BottomSheetContainer(
          responsiveContent: true,
          title: 'Select year or month',
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                0.05.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CommonButton(
                      onPress: () => Get
                        ..back()
                        ..bottomSheet(
                          CustomYearsPicker(
                            onSelectedItemChanged: controller.onSelectYear,
                          ),
                        ),
                      width: 0.35,
                      text: 'Year',
                    ),
                    const CommonText(
                      'OR',
                      fontWeight: FontWeight.bold,
                      marginHorizontal: 0.03,
                    ),
                    CommonButton(
                      onPress: () => Get
                        ..back()
                        ..bottomSheet(
                          CustomMonthPicker(
                            onSelectedItemChanged: controller.onSelectMonth,
                          ),
                        ),
                      width: 0.35,
                      text: 'Month',
                    ),
                  ],
                ),
                0.04.ph,
              ],
            ),
          ),
        );
      },
    );
  }
}
