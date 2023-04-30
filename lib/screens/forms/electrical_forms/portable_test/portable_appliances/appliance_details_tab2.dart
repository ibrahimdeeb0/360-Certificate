import '../../../../../general_exports.dart';

class ApplianceDetailsPage2 extends StatelessWidget {
  const ApplianceDetailsPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          paddingBottom: 0.0,
          backgroundColor: Colors.grey[200],
          child: Column(
            children: <Widget>[
              CommonText(
                'MEASURED RESULTS \n(if applicable)',
                rowMainAxisSize: MainAxisSize.max,
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                rightChild: CommonText(
                  'N/A',
                  rightChild: Switch(
                    // hoverColor: Color(AppColors.primary),
                    activeTrackColor: Colors.green[700],
                    value: true,
                    onChanged: (bool value) {},
                  ),
                ),
              ),
              0.02.ph,
              const SmallInputField(
                title: 'Earth continuity test',
                hint: 'N/A',
                keyboardType: TextInputType.phone,
                suffix: CommonText(
                  'Ω',
                  fontSize: fontH4,
                  fontWeight: FontWeight.bold,
                ),
                width: 0.5,
              ),
              const SmallInputField(
                title: 'Insulation test',
                hint: 'N/A',
                keyboardType: TextInputType.phone,
                suffix: CommonText(
                  'MΩ',
                  fontSize: fontH4,
                  fontWeight: FontWeight.bold,
                ),
                width: 0.5,
              ),
              const SmallInputField(
                title: 'Load test',
                hint: 'N/A',
                keyboardType: TextInputType.phone,
                suffix: CommonText(
                  'kvΩ',
                  fontSize: fontH4,
                  fontWeight: FontWeight.bold,
                ),
                width: 0.5,
              ),
              const SmallInputField(
                title: 'Earth leakage test',
                hint: 'N/A',
                keyboardType: TextInputType.phone,
                suffix: CommonText(
                  'mΩ',
                  fontSize: fontH4,
                  fontWeight: FontWeight.bold,
                ),
                width: 0.5,
              ),
            ],
          ),
        ),
        CommonContainer(
          borderColor: Colors.black87,
          borderRadius: 0.02,
          borderWidth: 1,
          marginVertical: 0.01,
          marginHorizontal: 0.04,
          paddingHorizontal: 0.03,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              CommonText(
                'Passed',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              CommonInput(
                topLabelText: 'Electrical Safety Test',
                keyboardType: TextInputType.number,
                marginBottom: 0.016,
              ),
              SmallInputField(
                title: 'Visual Check',
                // value: controller.childCircuitData[formKeyTypeOfWiringA],
                // onTap: () => Get.bottomSheet(
                //   DBSelectSheet(
                //     listTitles: list.listTypeOfWiring,
                //     keyOfValue: formKeyTypeOfWiringA,
                //     controller: controller,
                //     isChilde: true,
                //   ),
                // ),
                isInputSelection: true,
                marginBottom: 0.015,
                width: 0.4,
              ),
              SmallInputField(
                title: 'Amps',
                // value: controller.childCircuitData[formKeyTypeOfWiringA],
                // onTap: () => Get.bottomSheet(
                //   DBSelectSheet(
                //     listTitles: list.listTypeOfWiring,
                //     keyOfValue: formKeyTypeOfWiringA,
                //     controller: controller,
                //     isChilde: true,
                //   ),
                // ),
                isInputSelection: true,
                marginBottom: 0.015,
                width: 0.4,
              ),
            ],
          ),
        ),
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          paddingBottom: 0.0,
          backgroundColor: Colors.grey[200],
          child: const CustomSelectContainer(
            title: 'Repair Code (if applicable)',
            // value:
            //     controller.childCircuitData[formKeyCircuitDesignationA],
            // onTap: () => Get.bottomSheet(
            //   DBSelectSheet(
            //     listTitles: list.listCircuitDesignation,
            //     keyOfValue: formKeyCircuitDesignationA,
            //     controller: controller,
            //     isChilde: true,Polarity
            //   ),
            // ),
            marginTop: 0.0,
            marginBottom: 0.016,
          ),
        ),
        0.02.ph,
      ],
    );
  }
}
