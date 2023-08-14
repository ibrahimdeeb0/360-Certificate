import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../general_exports.dart';

class BreakdownServicePage1 extends StatelessWidget {
  const BreakdownServicePage1({super.key});

  @override
  Widget build(BuildContext context) {
    final ListBreakdownService list = ListBreakdownService();
    return GetBuilder<BreakdownServiceController>(
      init: BreakdownServiceController(),
      builder: (BreakdownServiceController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormToggleButton(
              title: 'Service',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyService],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyService,
                value,
              ),
              toggleType: FormToggleType.passFailedNA,
            ),
            FormToggleButton(
              title: 'Breakdown',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyBreakdown],
              onChangeValue: (dynamic value) => controller
                  .onChangeFormDataValue(formKeyPart1, formKeyBreakdown, value),
              toggleType: FormToggleType.passFailedNA,
            ),
            SmallInputField(
              title: 'CO/CO2 Ratio',
              value: controller.formData[formKeyPart1][formKeyCOCORatio],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyCOCORatio, value),
            ),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                BreakServiceSelectSheet(
                  keyOfPart: formKeyPart1,
                  keyOfValue: formKeyBoilerMake,
                  listTitles: list.listBoilerMake,
                  controller: controller,
                  keyOfBreakServiceType: formKeyBoilerMake,
                ),
                isScrollControlled: true,
              ),
              child: CommonInput(
                hint: 'Boiler Make',
                topLabelText: 'Boiler Make',
                suffix: const Icon(Icons.keyboard_arrow_down),
                enabled: false,
                value: controller.formData[formKeyPart1][formKeyBoilerMake],
              ),
            ),
            CommonInput(
              hint: 'Boiler Model',
              topLabelText: 'Boiler Model',
              value: controller.formData[formKeyPart1][formKeyBoilerModel],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyBoilerModel, value),
            ),
            GestureDetector(
              onTap: () {
                controller.barcodeScan(formKeyPart1, formKeyBoilerSerialNum);
              },
              child: CommonInput(
                hint: 'Boiler Serial Number',
                topLabelText: 'Boiler Serial Number',
                suffix: SvgPicture.asset(iconVector),
                enabled: false,
                value: controller.formData[formKeyPart1]
                    [formKeyBoilerSerialNum],
              ),
            ),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                BreakServiceSelectSheet(
                  keyOfPart: formKeyPart1,
                  keyOfValue: formKeyAppliancesMake,
                  listTitles: list.listApplianceMake,
                  controller: controller,
                  keyOfBreakServiceType: formKeyAppliancesMake,
                ),
                isScrollControlled: true,
              ),
              child: CommonInput(
                hint: 'Appliance Make',
                topLabelText: 'Appliance Make',
                suffix: const Icon(Icons.keyboard_arrow_down),
                enabled: false,
                value: controller.formData[formKeyPart1][formKeyAppliancesMake],
              ),
            ),
            CommonInput(
              hint: 'Appliance Model',
              topLabelText: 'Appliance Model',
              value: controller.formData[formKeyPart1][formKeyAppliancesModel],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyAppliancesModel, value),
            ),
            GestureDetector(
              onTap: () {
                controller.barcodeScan(
                    formKeyPart1, formKeyAppliancesSerialNum);
              },
              child: CommonInput(
                hint: 'Appliance Serial Number',
                topLabelText: 'Appliance Serial Number',
                marginBottom: 0.03,
                suffix: SvgPicture.asset(iconVector),
                enabled: false,
                value: controller.formData[formKeyPart1]
                    [formKeyAppliancesSerialNum],
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
          ],
        );
      },
    );
  }
}
