import '../../../../../general_exports.dart';

class PortableTestPage3 extends StatelessWidget {
  const PortableTestPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PortableTestController>(
      init: PortableTestController(),
      builder: (PortableTestController controller) {
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
