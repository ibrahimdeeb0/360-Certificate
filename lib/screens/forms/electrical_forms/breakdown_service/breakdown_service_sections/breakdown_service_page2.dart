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
            CommonInput(
              value: controller.formData[formKeyPart2][formKeyAdditionalNotes],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyAdditionalNotes, value),
              minLines: 15,
              maxLines: 200,
            ),
          ],
        );
      },
    );
  }
}
