import '../../../../../general_exports.dart';

class BreakdownServicePage2 extends StatelessWidget {
  const BreakdownServicePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakdownServiceController>(
      init: BreakdownServiceController(),
      builder: (BreakdownServiceController controller) {
        return Column(
          children: <Widget>[
            Center(
              child: CommonText(
                'Additional Notes',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
            ),
            CommonInput(
              value: controller.formData[formKeyAdditionalNotes],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyAdditionalNotes, value),
              height: 0.3,
              maxLines: 200,
            ),
          ],
        );
      },
    );
  }
}
