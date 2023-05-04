import '../../../../../general_exports.dart';

class DangerNoticePage2 extends StatelessWidget {
  const DangerNoticePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DangerNoticeController>(
      init: DangerNoticeController(),
      builder: (DangerNoticeController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTextFormTitle(
                    leftText: 'Part 3. ',
                    text: 'Action Taken'.toUpperCase(),
                    marginBottom: 0.01,
                  ),
                  CommonInput(
                    marginTop: 0.01,
                    maxLines: 12,
                    fillColor: Colors.grey[100],
                    onChanged: (String? value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart3, formKeyActionRaked, value),
                    value: controller.formData[formKeyPart3]
                        [formKeyActionRaked],
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginTop: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTextFormTitle(
                    leftText: 'Part 4. ',
                    text: 'Further Action Requires'.toUpperCase(),
                    marginBottom: 0.01,
                  ),
                  CommonInput(
                    marginTop: 0.01,
                    maxLines: 12,
                    fillColor: Colors.grey[100],
                    onChanged: (String? value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart4, formKeyFurtherAction, value),
                    value: controller.formData[formKeyPart4]
                        [formKeyFurtherAction],
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
