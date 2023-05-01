import '../../../../../general_exports.dart';

class WarningNoticePage2 extends StatelessWidget {
  const WarningNoticePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarningNoticeController>(
      init: WarningNoticeController(),
      builder: (WarningNoticeController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              paddingHorizontal: 0.0,
              paddingTop: 0.0,
              child: Column(
                children: <Widget>[
                  ApplianceSectionTitle(
                    title: 'Part 4: DESCRIBE FAULT(S) ON GAS EQUIPMENT',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 0.03.flexWidth,
                      left: 0.03.flexWidth,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '1',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart4]
                              [formKeyDescribeFault1],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart4, formKeyDescribeFault1, value),
                        ),
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '2',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart4]
                              [formKeyDescribeFault2],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart4, formKeyDescribeFault2, value),
                        ),
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '3',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart4]
                              [formKeyDescribeFault3],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart4, formKeyDescribeFault3, value),
                        ),
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '4',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart4]
                              [formKeyDescribeFault4],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart4, formKeyDescribeFault4, value),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              paddingHorizontal: 0.0,
              paddingTop: 0.0,
              marginTop: 0.0,
              child: Column(
                children: <Widget>[
                  ApplianceSectionTitle(
                    title:
                        'Part 5: DETAIL WHAT IS REQUIRED TO RECTIFY THE UNSAFE SITUATION',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 0.03.flexWidth,
                      left: 0.03.flexWidth,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '1',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart5]
                              [formKeyDescribeWatt1],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart5, formKeyDescribeWatt1, value),
                        ),
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '2',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart5]
                              [formKeyDescribeWatt2],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart5, formKeyDescribeWatt2, value),
                        ),
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '3',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart5]
                              [formKeyDescribeWatt3],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart5, formKeyDescribeWatt3, value),
                        ),
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '4',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart5]
                              [formKeyDescribeWatt4],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart5, formKeyDescribeWatt4, value),
                        ),
                      ],
                    ),
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
