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
            /*  Center(
              child: CommonText(
                'Spares/Parts Required',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
            ), */
            CommonInput(
              value: controller.formData[formKeyPart3]
                  [formKeySparesPartsRequired],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeySparesPartsRequired, value),
              minLines: 15,
              maxLines: 200,
            ),
          ],
        );
      },
    );
  }
}
