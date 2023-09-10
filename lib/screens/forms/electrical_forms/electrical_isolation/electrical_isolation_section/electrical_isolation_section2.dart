import 'package:easy_signature_pad/easy_signature_pad.dart';

import '../../../../../general_exports.dart';

class ElectricalIsolationPage2 extends StatelessWidget {
  const ElectricalIsolationPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElectricalIsolationController>(
      init: ElectricalIsolationController(),
      builder: (ElectricalIsolationController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CommonText(
                'Handover for Service',
                fontColor: Color(AppColors.primary),
                fontSize: fontH2,
                marginBottom: 0.03,
              ),
            ),
            CommonText(
              'Equipment has been isolated and checked by the electrically competent person below',
              fontSize: fontH3,
              fontColor: Colors.grey[500],
              marginBottom: 0.03,
            ),
            Align(
              child: CommonText(
                onPress: () => Get.bottomSheet(
                  elevation: 0.0,
                  BottomSheetContainer(
                    style: appContainerStyles.bottomSheetContainer().copyWith(
                          marginHorizontal: 0.05,
                          height: 0.55,
                          marginBottom: 0.2,
                          borderRadius: 0.06,
                          paddingBottom: 0.02,
                          clipBehavior: Clip.hardEdge,
                        ),
                    child: Column(
                      children: <Widget>[
                        const CommonText(
                          'Signature',
                          fontSize: fontH2,
                        ),
                        const CommonText(
                          'Draw your signature below',
                          fontSize: fontH2,
                        ),
                        SizedBox(
                          height: DEVICE_HEIGHT * 0.01,
                        ),
                        EasySignaturePad(
                          onChanged: (String image) {
                            controller.setImage(image);
                          },
                          height: DEVICE_WIDTH ~/ 1.5,
                          width: DEVICE_WIDTH ~/ 1.2,
                          strokeWidth: 4.0,
                          borderRadius: 10.0,
                          borderColor: Colors.grey,
                        ),
                        SizedBox(
                          height: DEVICE_HEIGHT * 0.01,
                        ),
                        CommonButton(
                          text: 'Save',
                          onPress: controller.onSendSignatureReportForm,
                        ),
                      ],
                    ),
                  ),
                  isScrollControlled: true,
                  enableDrag: false,
                ),
                'Tap Here To Sign',
                fontWeight: FontWeight.w500,
                fontColor: Color(AppColors.grey).withOpacity(0.8),
                containerStyle: CommonContainerModel(
                  width: 0.9,
                  height: 0.08,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  alignment: Alignment.center,
                  borderWidth: 1,
                  borderRadius: 0.01,
                  borderColor: Color(AppColors.grey).withOpacity(0.2),
                  touchEffect: TouchableEffect(
                    type: TouchTypes.opacity,
                  ),
                ),
              ),
            ),
            if (controller.signatureBytesImage != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  IconButton(
                    onPressed: controller.clearSignature,
                    icon: Icon(
                      Icons.highlight_remove_sharp,
                      color: Colors.red,
                      size: 0.08.flexWidth,
                    ),
                  ),
                  SizedBox(
                    height: DEVICE_WIDTH / 2,
                    width: DEVICE_WIDTH,
                    child: Image.memory(
                      controller.signatureBytesImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            const CommonText(
              'ISSUED By:',
              marginTop: 0.02,
            ),
            CommonInput(
              topLabelText: 'Name',
              hint: 'Name',
              enabled: false,
              value: controller.formData[formKeyDeclaration]
                  [formKeyEngineerName],
              onChanged: (dynamic value) => controller.onChangDataSignature(
                  formKeyDeclaration, formKeyEngineerName, value),
            ),
            const Divider(
              thickness: 1,
            ),
            Center(
              child: CommonText(
                'Clearance',
                fontColor: Color(AppColors.primary),
                fontSize: fontH2,
                marginBottom: 0.03,
                marginTop: 0.02,
              ),
            ),
            CommonText(
              'The work for which this certificate was issued is now complete. Locks, Isolation and warning notices have been removed. Equipment subject to this certificate is energised',
              fontSize: fontH3,
              fontColor: Colors.grey[500],
              marginBottom: 0.03,
            ),
            0.02.boxHeight,
            Align(
              child: CommonText(
                onPress: () => Get.bottomSheet(
                  elevation: 0.0,
                  BottomSheetContainer(
                    style: appContainerStyles.bottomSheetContainer().copyWith(
                          marginHorizontal: 0.05,
                          height: 0.55,
                          marginBottom: 0.2,
                          borderRadius: 0.06,
                          paddingBottom: 0.02,
                          clipBehavior: Clip.hardEdge,
                        ),
                    child: Column(
                      children: <Widget>[
                        const CommonText(
                          'Signature',
                          fontSize: fontH2,
                        ),
                        const CommonText(
                          'Draw your signature below',
                          fontSize: fontH2,
                        ),
                        SizedBox(
                          height: DEVICE_HEIGHT * 0.01,
                        ),
                        EasySignaturePad(
                          onChanged: (String image) {
                            controller.setCustomerImage(image);
                          },
                          height: DEVICE_WIDTH ~/ 1.5,
                          width: DEVICE_WIDTH ~/ 1.2,
                          strokeWidth: 4.0,
                          borderRadius: 10.0,
                          borderColor: Colors.grey,
                        ),
                        SizedBox(
                          height: DEVICE_HEIGHT * 0.01,
                        ),
                        CommonButton(
                          text: 'Save',
                          onPress: controller.saveCustomerSignature,
                        ),
                      ],
                    ),
                  ),
                  isScrollControlled: true,
                  enableDrag: false,
                ),
                'Tap Here To Sign',
                fontWeight: FontWeight.w500,
                fontColor: Color(AppColors.grey).withOpacity(0.8),
                containerStyle: CommonContainerModel(
                  width: 0.9,
                  height: 0.08,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  alignment: Alignment.center,
                  borderWidth: 1,
                  borderRadius: 0.01,
                  borderColor: Color(AppColors.grey).withOpacity(0.2),
                  touchEffect: TouchableEffect(
                    type: TouchTypes.opacity,
                  ),
                ),
              ),
            ),
            if (controller.signatureBytes2 != null &&
                controller.customerSignatureBytes != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  IconButton(
                    onPressed: controller.clearCustomerSignature,
                    icon: Icon(
                      Icons.highlight_remove_sharp,
                      color: Colors.red,
                      size: 0.08.flexWidth,
                    ),
                  ),
                  SizedBox(
                    height: DEVICE_WIDTH / 2,
                    width: DEVICE_WIDTH,
                    child: Image.memory(
                      controller.customerSignatureBytes!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            const CommonText(
              'ISSUED By:',
              marginTop: 0.02,
            ),
            CommonInput(
              topLabelText: 'Name',
              hint: 'Name',
              value: controller.formData[formKeyDeclaration]
                  [formKeyCustomerName],
              onChanged: (dynamic value) => controller.onChangDataSignature(
                  formKeyDeclaration, formKeyCustomerName, value),
            ),
            CommonInput(
              hint: 'Position',
              topLabelText: 'Position',
              value: controller.formData[formKeyDeclaration]
                  [formKeyCustomerPosition],
              onChanged: (dynamic value) => controller.onChangDataSignature(
                  formKeyDeclaration, formKeyCustomerPosition, value),
            ),
            GestureDetector(
              onTap: () {
                CommonDatePicker.showDatePicker(
                  context,
                  currentTime: controller.selectedDate ?? DateTime.now(),
                  onConfirm: (DateTime value) {
                    controller.onSelectDate(
                      part: formKeyDeclaration,
                      key: formKeyCustomerDate,
                      value: value,
                      type: DateType.date,
                    );
                  },
                );
              },
              child: CommonInput(
                hint: 'Select Date',
                topLabelText: 'Select Date',
                suffix: const Icon(Icons.calendar_today_outlined),
                marginBottom: 0.02,
                enabled: false,
                value: controller.formData[formKeyDeclaration]
                    [formKeyCustomerDate],
              ),
            ),
          ],
        );
      },
    );
  }
}
