import '../../../../../general_exports.dart';

class BreakdownServicePage3 extends StatelessWidget {
  const BreakdownServicePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakdownServiceController>(
      init: BreakdownServiceController(),
      builder: (BreakdownServiceController controller) {
        return Column(
          children: <Widget>[
            Center(
              child: CommonText(
                'Spares/Parts Required',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
            ),
            CommonInput(
              value: controller.formData[formKeySPDType],
              height: 0.3,
              maxLines: 200,
            ),
          ],
        );
      },
    );
  }
}
