import '../../../../../general_exports.dart';

class DomesticEicPage9 extends StatelessWidget {
  const DomesticEicPage9({super.key});

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
                  const CustomTextFormTitle(
                    leftText: 'Part 12. ',
                    text: '',
                    marginBottom: 0.02,
                  ),
                  const CommonText(
                    'Details of circuits and/or installed equipment vulnerable to damage when testing and/or remarks :',
                    rowMainAxisSize: MainAxisSize.max,
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textAlign: TextAlign.start,
                    marginBottom: 0.02,
                  ),
                  CommonInput(
                    hint: 'N/A',
                    maxLines: 8,
                    textInputAction: TextInputAction.newline,
                    value: controller.formData[formKeyPart12]
                        [formKeyDetailsOfCircuits],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart12, formKeyDetailsOfCircuits, value),
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
