import '../../../../../general_exports.dart';

class MinorWorksPage4 extends StatelessWidget {
  const MinorWorksPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinorWorksController>(
      init: MinorWorksController(),
      builder: (MinorWorksController controller) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              'Part 4: Declaration',
              fontColor: AppColors.primary,
              fontSize: fontH2,
              marginBottom: 0.02,
            ),
            CommonText(
              'I CERTIFY that the work covered by this certificate does not impair the safety of the existing installation and that the work has been designed, constructed, inspected and tested in accordance with BS 7671: 2018, amended to 2020 2022 date) and that to the best of my knowledge and belief, at the time of my inspection, complied with BS 7671: 2018+A2:2022 except as detailed in PART 2 of this certificate.',
              fontColor: Colors.grey[700],
              fontSize: fontH3,
              textAlign: TextAlign.start,
              marginBottom: 0.015,
            ),
            const CommonInput(
              topLabelText: 'Name (capitals):',
              maxLines: 4,
            ),
          ],
        );
      },
    );
  }
}
