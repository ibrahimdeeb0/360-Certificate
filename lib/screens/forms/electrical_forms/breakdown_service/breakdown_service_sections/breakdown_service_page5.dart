import '../../../../../general_exports.dart';

class BreakdownServicePage5 extends StatelessWidget {
  const BreakdownServicePage5({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakdownServiceController>(
      init: BreakdownServiceController(),
      builder: (BreakdownServiceController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CommonText(
                'Installation Details',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
            ),
            const CheckBoxComponent(
                text: 'Flue Atmopheric/Fan/assisted/Fan Dilution'),
            const CheckBoxComponent(text: 'Ventilation Size/H-L'),
            const CheckBoxComponent(
              text: 'Water/Fuel-Satisfactory',
            ),
            const CheckBoxComponent(
              text: 'Electrically Fused',
            ),
            const CheckBoxComponent(
              text: 'Correct Valving Arrangements',
            ),
            const CheckBoxComponent(
              text: 'Isolation Available - Electrical/Fuel',
            ),
            const CheckBoxComponent(
              text: 'Boiler/Plantroom Cleaner',
            ),
          ],
        );
      },
    );
  }
}

class CheckBoxComponent extends StatelessWidget {
  const CheckBoxComponent({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        0.05.boxHeight,
        SizedBox(
          width: 0.85.flexWidth,
          child: CommonText(
            text,
            textAlign: TextAlign.start,
          ),
        ),
        const Icon(Icons.check_box_outline_blank)
      ],
    );
  }
}
