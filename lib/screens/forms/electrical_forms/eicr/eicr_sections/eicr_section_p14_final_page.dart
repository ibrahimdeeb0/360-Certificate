// import 'package:easy_signature_pad/easy_signature_pad.dart';
import 'package:easy_signature_pad/easy_signature_pad.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../general_exports.dart';

class EICRFinalPage extends StatelessWidget {
  const EICRFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EicrController>(
      builder: (EicrController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              backgroundColor: Colors.white,
              width: 1,
              paddingHorizontal: 0.03,
              paddingVertical: 0.02,
              marginBottom: 0.02,
              marginHorizontal: 0.03,
              marginTop: 0.01,
              borderRadius: 0.02,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTextFormTitle(
                    leftText: '',
                    text: 'Inspected and Tested By'.toUpperCase(),
                    fontSize: 17.0,
                    marginBottom: 0.02,
                  ),
                  //*  Name *//
                  // CommonButton(
                  //   onPress: () {
                  //     consoleLogPretty(controller.resData['form_data'],
                  //         key: 'resData');
                  //   },
                  //   text: 'test',
                  // ),

                  CommonInput(
                    topLabelText: 'Name (Capitals)',
                    hint: 'NAME',
                    value: controller.gazSafetyData[formKeyEICRdeclaration]
                        [formKeyInspectedName],
                    onChanged: (dynamic value) => controller
                        .onChangeDeclarationValue(formKeyInspectedName, value),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    marginBottom: 0.02,
                    enabled: false,
                  ),
                  Align(
                    child: CommonText(
                      onPress: () => Get.bottomSheet(
                        elevation: 0.0,
                        BottomSheetContainer(
                          style: appContainerStyles
                              .bottomSheetContainer()
                              .copyWith(
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
                      children: <Widget>[
                        const SizedBox(height: 10),
                        CupertinoButton(
                          onPressed: controller.clearSignature,
                          child: const Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Icon(
                              Icons.highlight_remove_sharp,
                              color: Colors.red,
                            ),
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
                  SizedBox(height: DEVICE_HEIGHT * 0.03),
                  //*  Date and Position  *//
                  // CommonInput(
                  //   topLabelText: 'Date',
                  //   value: controller.gazSafetyData[formKeyEICRdeclaration]
                  //       [formKeyInspectedDate],
                  //   onChanged: (dynamic value) => controller
                  //       .onChangeDeclarationValue(formKeyInspectedDate, value),
                  //   keyboardType: TextInputType.datetime,
                  //   textInputAction: TextInputAction.next,
                  // ),
                  CommonInput(
                    topLabel: const CommonText(
                      'Date',
                      textAlign: TextAlign.start,
                      marginBottom: 0.01,
                      fontSize: fontH3,
                    ),
                    onTap: () {
                      CommonDatePicker.showDatePicker(
                        context,
                        onConfirm: (DateTime value) {
                          controller.onConfirmDate(
                            dateTime: value,
                            type: FormDateType.inspectedBy,
                          );
                        },
                        currentTime: controller.currentTime,
                      );
                    },
                    enabled: false,
                    hint: 'select',
                    value:
                        '${controller.gazSafetyData[formKeyEICRdeclaration][formKeyInspectedDate]}',
                    marginBottom: 0.03,
                    suffix: const Icon(Icons.keyboard_arrow_down),
                  ),
                  CommonInput(
                    topLabelText: 'Position',
                    value: controller.gazSafetyData[formKeyEICRdeclaration]
                        [formKeyInspectedPosition],
                    onChanged: (dynamic value) =>
                        controller.onChangeDeclarationValue(
                            formKeyInspectedPosition, value),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.025),

                  CustomTextFormTitle(
                    leftText: '',
                    text: 'Report Authorized for Issue By'.toUpperCase(),
                    fontSize: 17.0,
                  ),
                  //*  Contractor *//
                  CommonInput(
                    topLabelText: 'Contractor',
                    marginBottom: 0.025,
                    value: controller.gazSafetyData[formKeyEICRdeclaration]
                        [formKeyReportContractor],
                    onChanged: (dynamic value) =>
                        controller.onChangeDeclarationValue(
                            formKeyReportContractor, value),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                  Align(
                    child: CommonText(
                      onPress: () => Get.bottomSheet(
                        elevation: 0.0,
                        BottomSheetContainer(
                          style: appContainerStyles
                              .bottomSheetContainer()
                              .copyWith(
                                marginHorizontal: 0.05,
                                height: 0.55,
                                marginBottom: 0.2,
                                borderRadius: 0.06,
                                paddingBottom: 0.02,
                                clipBehavior: Clip.hardEdge,
                              ),
                          child: Column(
                            children: <Widget>[
                              CommonText(
                                'Contractor Signature',
                                style: appTextStyles.h2StyleBlack().copyWith(
                                      rowMainAxisSize: MainAxisSize.max,
                                    ),
                              ),
                              CommonText(
                                'Draw your signature below',
                                style:
                                    appTextStyles.h4GreyMediumStyle().copyWith(
                                          rowMainAxisSize: MainAxisSize.max,
                                        ),
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
                      children: <Widget>[
                        const SizedBox(height: 10),
                        CupertinoButton(
                          onPressed: controller.clearCustomerSignature,
                          child: const Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Icon(
                              Icons.highlight_remove_sharp,
                              color: Colors.red,
                            ),
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

                  //*  Name and Date  *//
                  CommonInput(
                    topLabelText: 'Name',
                    hint: '',
                    marginTop: 0.025,
                    value: controller.gazSafetyData[formKeyEICRdeclaration]
                        [formKeyReportName],
                    onChanged: (dynamic value) => controller
                        .onChangeDeclarationValue(formKeyReportName, value),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  // CommonInput(
                  //   topLabelText: 'Date',
                  //   marginTop: 0.025,
                  //   value: controller.gazSafetyData[formKeyEICRdeclaration]
                  //       [formKeyReportDate],
                  //   onChanged: (dynamic value) => controller
                  //       .onChangeDeclarationValue(formKeyReportDate, value),
                  //   keyboardType: TextInputType.datetime,
                  //   textInputAction: TextInputAction.done,
                  // ),
                  CommonInput(
                    topLabel: const CommonText(
                      'Date',
                      textAlign: TextAlign.start,
                      marginBottom: 0.01,
                      fontSize: fontH3,
                    ),
                    onTap: () {
                      CommonDatePicker.showDatePicker(
                        context,
                        onConfirm: (DateTime value) {
                          controller.onConfirmDate(
                            dateTime: value,
                            type: FormDateType.reportBy,
                          );
                        },
                        currentTime: controller.currentTime,
                      );
                    },
                    enabled: false,
                    hint: 'select',
                    value:
                        '${controller.gazSafetyData[formKeyEICRdeclaration][formKeyReportDate]}',
                    marginBottom: 0.03,
                    suffix: const Icon(Icons.keyboard_arrow_down),
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
