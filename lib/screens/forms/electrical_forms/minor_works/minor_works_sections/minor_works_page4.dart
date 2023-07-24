import '../../../../../general_exports.dart';

class MinorWorksPage4 extends StatelessWidget {
  const MinorWorksPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinorWorksController>(
      init: MinorWorksController(),
      builder: (MinorWorksController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              'Part 4 Derails of The Minor Works, Supply Characteristics & Earthing Arrangements',
              fontColor: AppColors.primary,
              marginHorizontal: 0.04,
              marginTop: 0.08,
            ),
            CommonInput(
              topLabelText: 'Description of Minor Works:',
              maxLines: 4,
            ),
          ],
        );
      },
    );
  }
}
