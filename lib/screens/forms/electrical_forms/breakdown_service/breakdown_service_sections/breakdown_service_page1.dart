import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../general_exports.dart';

class BreakdownServicePage1 extends StatelessWidget {
  const BreakdownServicePage1({super.key});

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
                'Description of Works',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
                textAlign: TextAlign.center,
              ),
            ),
            FormToggleButton(
              title: 'Service',
              titleSize: fontTitle,
              value: controller.formData[formKeyService],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(formKeyService, value),
              toggleType: FormToggleType.passFailedNA,
            ),
            FormToggleButton(
              title: 'Breakdown',
              titleSize: fontTitle,
              value: controller.formData[formKeyBreakdown],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(formKeyBreakdown, value),
              toggleType: FormToggleType.passFailedNA,
            ),
            SmallInputField(
              title: 'CO/CO2 Ratio',
              value: controller.formData[formKeyCOCORatio],
              onChanged: (dynamic value) =>
                  controller.onChangeFormDataValue(formKeyCOCORatio, value),
            ),
            CommonInput(
              hint: 'Boiler Make',
              marginBottom: 0.03,
              suffix: const Icon(Icons.keyboard_arrow_down),
              enabled: false,
              value: controller.formData[formKeyBoilerMake],
              onChanged: (dynamic value) =>
                  controller.onChangeFormDataValue(formKeyBoilerMake, value),
            ),
            CommonInput(
              hint: 'Boiler Model',
              marginBottom: 0.03,
              value: controller.formData[formKeyBoilerModel],
              onChanged: (dynamic value) =>
                  controller.onChangeFormDataValue(formKeyBoilerModel, value),
            ),
            CommonInput(
              hint: 'Boiler Serial Number',
              marginBottom: 0.03,
              suffix: SvgPicture.asset(iconVector),
              enabled: false,
              value: controller.formData[formKeyBoilerSerialNum],
              onTap: () {
                controller.barcodeScan(formKeyBoilerSerialNum);
              },
            ),
            CommonInput(
              hint: 'Appliance Make',
              marginBottom: 0.03,
              suffix: const Icon(Icons.keyboard_arrow_down),
              enabled: false,
              value: controller.formData[formKeyAppliancesMake],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyAppliancesMake, value),
            ),
            CommonInput(
              hint: 'Appliance Model',
              marginBottom: 0.03,
              value: controller.formData[formKeyAppliancesModel],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyAppliancesModel, value),
            ),
            CommonInput(
              hint: 'Appliance Serial Number',
              marginBottom: 0.03,
              suffix: SvgPicture.asset(iconVector),
              enabled: false,
              value: controller.formData[formKeyAppliancesSerialNum],
              onTap: () {
                controller.barcodeScan(formKeyAppliancesSerialNum);
              },
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
