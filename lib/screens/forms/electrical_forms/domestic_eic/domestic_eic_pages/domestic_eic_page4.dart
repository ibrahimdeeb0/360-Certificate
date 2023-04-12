import '../../../../../general_exports.dart';

class DomesticEicPage4 extends StatelessWidget {
  const DomesticEicPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DomesticEicController>(
      init: DomesticEicController(),
      builder: (DomesticEicController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTextFormTitle(
                    leftText: 'Part 1. ',
                    text: 'Details of work carried out'.capitalize,
                    marginBottom: 0.02,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
