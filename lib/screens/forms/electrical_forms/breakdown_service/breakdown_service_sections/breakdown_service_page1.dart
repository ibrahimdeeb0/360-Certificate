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
              value: controller.formData[formKeySystemType],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(formKeySystemType, value),
              toggleType: FormToggleType.passFailedNA,
            ),
            FormToggleButton(
              title: 'Breakdown',
              titleSize: fontTitle,
              value: controller.formData[formKeySystemType],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(formKeySystemType, value),
              toggleType: FormToggleType.passFailedNA,
            ),
            const SmallInputField(
              title: 'CO/CO2 Ratio',
            ),
            CommonInput(
              hint: 'Boiler Make',
              marginBottom: 0.03,
              suffix: const Icon(Icons.keyboard_arrow_down),
              textInputAction: TextInputAction.newline,
              enabled: false,
              value: controller.formData[formKeyZsDistributionBoard],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyZsDistributionBoard, value),
            ),
            CommonInput(
              hint: 'Boiler Model',
              marginBottom: 0.03,
              textInputAction: TextInputAction.newline,
              value: controller.formData[formKeyZsDistributionBoard],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyZsDistributionBoard, value),
            ),
            CommonInput(
              hint: 'Boiler Serial Number',
              marginBottom: 0.03,
              suffix: SvgPicture.asset(iconVector),
              textInputAction: TextInputAction.newline,
              enabled: false,
              value: controller.formData[formKeyZsDistributionBoard],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyZsDistributionBoard, value),
            ),
            CommonInput(
              hint: 'Appliance Make',
              marginBottom: 0.03,
              suffix: const Icon(Icons.keyboard_arrow_down),
              textInputAction: TextInputAction.newline,
              enabled: false,
              value: controller.formData[formKeyZsDistributionBoard],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyZsDistributionBoard, value),
            ),
            CommonInput(
              hint: 'Appliance Model',
              marginBottom: 0.03,
              textInputAction: TextInputAction.newline,
              value: controller.formData[formKeyZsDistributionBoard],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyZsDistributionBoard, value),
            ),
            CommonInput(
              hint: 'Appliance Serial Number',
              marginBottom: 0.03,
              suffix: SvgPicture.asset(iconVector),
              textInputAction: TextInputAction.newline,
              enabled: false,
              value: controller.formData[formKeyZsDistributionBoard],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyZsDistributionBoard, value),
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
