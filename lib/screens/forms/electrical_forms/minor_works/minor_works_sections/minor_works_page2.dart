import '../../../../../general_exports.dart';

class MinorWorksPage2 extends StatelessWidget {
  const MinorWorksPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinorWorksController>(
      init: MinorWorksController(),
      builder: (MinorWorksController controller) {
        final ListMinorWorks lists = ListMinorWorks();
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              'Part 2: Circuit  Details',
              fontColor: AppColors.primary,
              fontSize: fontH2,
              marginBottom: 0.02,
            ),
            SizedBox(
              child: Column(
                children: <Widget>[
                  CommonInput(
                    topLabelText: 'DB/Consumer Unit: Ref No',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyDBConsumerUnit],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyDBConsumerUnit, value),
                  ),
                  CommonInput(
                    topLabelText: 'Location and type',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyLocationAndType],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyLocationAndType, value),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            SizedBox(
              child: Column(
                children: <Widget>[
                  CommonInput(
                    topLabelText: 'Circuit number',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyCircuitNumber],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyCircuitNumber, value),
                  ),
                  CommonInput(
                    topLabelText: 'Circuit description',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyCircuitDescription],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyCircuitDescription, value),
                  ),
                  CommonInput(
                    topLabelText: 'Installation reference method:',
                    marginBottom: 0.015,
                    value:
                        controller.formData[formKeyInstallationReferenceMethod],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyInstallationReferenceMethod, value),
                  ),
                  CommonInput(
                    topLabelText: 'Number & size of conductors:',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyNumberSizeOfConductors],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyNumberSizeOfConductors, value),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Csa of conductors',
                    fontColor: AppColors.primary,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CommonInput(
                        topLabelText: 'Live:',
                        hint: 'mm2',
                        width: 0.45,
                        suffix: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey[700],
                        ),
                        value: controller.formData[formKeyLive],
                        onChanged: (dynamic value) => controller
                            .onChangeFormDataValue(formKeyLive, value),
                      ),
                      CommonInput(
                        topLabelText: 'Cpc:',
                        hint: 'mm2',
                        width: 0.45,
                        suffix: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey[700],
                        ),
                        value: controller.formData[formKeyCpc],
                        onChanged: (dynamic value) =>
                            controller.onChangeFormDataValue(formKeyCpc, value),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),

            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Overcurrent protection device',
                    fontColor: AppColors.primary,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'BS EN',
                    hint: 'Select',
                    enabled: false,
                    suffix: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyOvercurrentBSEN],
                    onTap: () => Get.bottomSheet(
                      MinorWorksSelectBT(
                        listTitles: lists.listBS,
                        controller: controller,
                        keyOfValue: formKeyOvercurrentBSEN,
                        keyOfBSType: formKeyOvercurrentType,
                      ),
                    ),
                  ),
                  CommonInput(
                    topLabelText: 'Type',
                    hint: 'Select',
                    enabled: false,
                    // suffix: Icon(
                    //   Icons.keyboard_arrow_down,
                    //   color: Colors.grey[700],
                    // ),
                    value: controller.formData[formKeyOvercurrentType],
                    // onChanged: (dynamic value) => controller
                    //     .onChangeFormDataValue(formKeyOvercurrentType, value),
                  ),
                  CommonInput(
                    topLabelText: 'Rating',
                    hint: 'Select',
                    suffix: CommonText(
                      '(A)',
                      fontColor: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyOvercurrentRating],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyOvercurrentRating, value),
                  ),
                ],
              ),
            ),
            //
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'RCD',
                    fontColor: AppColors.primary,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'BS EN',
                    hint: 'Select',
                    enabled: false,
                    suffix: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyRCDBSEN],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyRCDBSEN, value),
                  ),
                  CommonInput(
                    topLabelText: 'Type',
                    hint: 'Select',
                    // suffix: Icon(
                    //   Icons.keyboard_arrow_down,
                    //   color: Colors.grey[700],
                    // ),
                    value: controller.formData[formKeyRCDType],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyRCDType, value),
                  ),
                  CommonInput(
                    topLabelText: 'Rating',
                    hint: 'Select',
                    suffix: CommonText(
                      '(A)',
                      fontColor: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyRCDRating],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyRCDRating, value),
                  ),
                  CommonInput(
                    topLabelText: 'Rated residual operating current (I ∆n):',
                    hint: 'Select',
                    suffix: CommonText(
                      'mA',
                      fontColor: Colors.grey[700],
                    ),
                    value: controller
                        .formData[formKeyRatedResidualOperatingCurrent],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyRatedResidualOperatingCurrent, value),
                  ),
                ],
              ),
            ),
            //
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),

            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'AFDD',
                    fontColor: AppColors.primary,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'BS EN',
                    hint: 'Select',
                    enabled: false,
                    suffix: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyAFDDBSEN],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyAFDDBSEN, value),
                  ),
                  CommonInput(
                    topLabelText: 'Type',
                    hint: 'Select',
                    // suffix: Icon(
                    //   Icons.keyboard_arrow_down,
                    //   color: Colors.grey[700],
                    // ),
                    value: controller.formData[formKeyAFDDType],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyAFDDType, value),
                  ),
                  CommonInput(
                    topLabelText: 'Rating',
                    hint: 'Select',
                    suffix: CommonText(
                      '(A)',
                      fontColor: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyAFDDRating],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyAFDDRating, value),
                  ),
                ],
              ),
            ),
            //
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'SPD',
                    fontColor: AppColors.primary,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'BS EN',
                    hint: 'Select',
                    enabled: false,
                    suffix: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[700],
                    ),
                    value: controller.formData[formKeySPDBSEN],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeySPDBSEN, value),
                  ),
                  CommonInput(
                    topLabelText: 'Type',
                    hint: 'Select',
                    // suffix: Icon(
                    //   Icons.keyboard_arrow_down,
                    //   color: Colors.grey[700],
                    // ),
                    value: controller.formData[formKeySPDType],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeySPDType, value),
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
