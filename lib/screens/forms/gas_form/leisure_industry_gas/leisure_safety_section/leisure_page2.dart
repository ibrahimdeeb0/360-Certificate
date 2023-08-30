import '../../../../../general_exports.dart';

class LeisurePage3 extends StatelessWidget {
  const LeisurePage3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeisureIndustryController>(
      init: LeisureIndustryController(),
      builder: (LeisureIndustryController controller) {
        return CommonContainer(
          marginHorizontal: 0.04,
          marginTop: 0.01,
          child: Column(
            children: <Widget>[
              CommonText(
                'Record Remidial Action Taken (If Any) Or Notes',
                rowMainAxisSize: MainAxisSize.max,
                textAlign: TextAlign.center,
                fontSize: fontH2,
                fontWeight: FontWeight.w500,
                fontColor: Color(AppColors.primary),
                marginBottom: 0.015,
              ),
              CommonText(
                'Numbering should correspond to defects identified in report',
                rowMainAxisSize: MainAxisSize.max,
                textAlign: TextAlign.start,
                fontColor: Colors.grey[500],
                marginBottom: 0.015,
              ),
              CommonInput(
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                value: controller.formData[formKeyPart4]
                    [formKeyRecordRemedialAction],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyPart4, formKeyRecordRemedialAction, value),
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 3,
              ),
              CommonInput(
                // topLabelText: 'Next Safety Check Due By',
                topLabel: Center(
                  child: CommonText(
                    'Next Safety Check Due By',
                    textAlign: TextAlign.center,
                    marginVertical: 0.02,
                    fontSize: fontH2,
                    fontColor: Color(AppColors.primary),
                  ),
                ),
                onTap: () {
                  CommonDatePicker.showDatePicker(
                    context,
                    currentTime: controller.selectedDate ?? DateTime.now(),
                    onConfirm: (DateTime value) {
                      controller.onSelectDate(
                        formKeyPart5,
                        formKeyNextSafetyCheckBy,
                        value,
                      );
                    },
                  );
                },
                enabled: false,
                hint: 'select',
                // value: ,
                marginBottom: 0.02,
                suffix: const Icon(Icons.keyboard_arrow_down),
                value: controller.formData[formKeyPart5]
                    [formKeyNextSafetyCheckBy],
                // onChanged: (dynamic value) => controller.onChangeFormDataValue(
                //     formKeyPart7, formKeyNextSafetyCheckBy, value),
              ),
            ],
          ),
        );
      },
    );
  }
}
