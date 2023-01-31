// import 'package:easy_signature_pad/easy_signature_pad.dart';

import '../../../../../general_exports.dart';

class EICRFinalPage extends StatelessWidget {
  const EICRFinalPage({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CommonContainer(
          backgroundColor: Colors.white,
          width: 1,
        ),
        CommonContainer(
          backgroundColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              // CustomTextFormTitle(
              //   leftText: '',
              //   text: 'Inspected and Tested By'.toUpperCase(),
              //   fontSize: 17.0,
              // ),
              //*  Name *//

              CustomInput(),
              // CustomInput(
              //   title: 'Name (Capitals)',
              //   hint: 'NAME',
              //   value: controller.gazSafetyData[formKeyEICRdeclaration]
              //       [formKeyInspectedName],
              //   onChanged: (dynamic value) => controller
              //       .onChangeDeclarationValue(formKeyInspectedName, value),
              //   textInputType: TextInputType.name,
              //   textInputAction: TextInputAction.done,
              // ),
              // Align(
              //   child: CommonText(
              //     onPress: () => Get.bottomSheet(
              //       BottomSheetContainer(
              //         style: appContainerStyles.bottomSheetContainer().copyWith(
              //               marginHorizontal: 0.05,
              //               height: 0.55,
              //               marginBottom: 0.2,
              //               borderRadius: 0.06,
              //               paddingBottom: 0.02,
              //               clipBehavior: Clip.hardEdge,
              //             ),
              //         child: Column(
              //           children: <Widget>[
              //             CommonText(
              //               text: 'Signature',
              //               style: appTextStyles.h2StyleBlack().copyWith(
              //                     rowMainAxisSize: MainAxisSize.max,
              //                   ),
              //             ),
              //             CommonText(
              //               text: 'Draw your signature below',
              //               style: appTextStyles.h4GreyMediumStyle().copyWith(
              //                     rowMainAxisSize: MainAxisSize.max,
              //                   ),
              //             ),
              //             SizedBox(
              //               height: DEVICE_HEIGHT * 0.01,
              //             ),
              //             EasySignaturePad(
              //               onChanged: (String image) {
              //                 controller.setImage(image);
              //               },
              //               height: DEVICE_WIDTH ~/ 1.5,
              //               width: DEVICE_WIDTH ~/ 1.2,
              //               strokeWidth: 4.0,
              //               borderRadius: 10.0,
              //               borderColor: Colors.grey,
              //             ),
              //             SizedBox(
              //               height: DEVICE_HEIGHT * 0.01,
              //             ),
              //             CommonButton(
              //               text: 'Save',
              //               onPress: controller.onSendSignatureReportForm,
              //               buttonStyle: appButtonStyles.fullPrimaryButton(),
              //             ),
              //           ],
              //         ),
              //       ),
              //       isScrollControlled: true,
              //       enableDrag: false,
              //     ),
              //      'Tap Here To Sign',
              //     style: appTextStyles.h3StyleBlack().copyWith(
              //           fontWeight: FontWeight.w500,
              //           fontColor: Color(AppColors.grey).withOpacity(0.8),
              //           fontSize: fontHeader,
              //         ),
              //     containerStyle: CommonContainerModel(
              //       width: 0.9,
              //       height: 0.08,
              //       backgroundColor: Colors.grey.withOpacity(0.2),
              //       alignment: Alignment.center,
              //       borderWidth: 1,
              //       borderRadius: 0.01,
              //       borderColor: Color(AppColors.grey).withOpacity(0.2),
              //       touchEffect: TouchableEffect(
              //         type: TouchTypes.opacity,
              //       ),
              //     ),
              //   ),
              // ),
              // if (controller.signatureBytesImage != null)
              //   Column(
              //     children: <Widget>[
              //       const SizedBox(height: 10),
              //       CupertinoButton(
              //         onPressed: controller.clearSignature,
              //         child: const Align(
              //           alignment: AlignmentDirectional.centerStart,
              //           child: Icon(
              //             Icons.highlight_remove_sharp,
              //             color: Colors.red,
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: DEVICE_WIDTH / 2,
              //         width: DEVICE_WIDTH,
              //         child: Image.memory(
              //           controller.signatureBytesImage!,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ],
              //   ),
              //   SizedBox(height: DEVICE_HEIGHT * 0.03),
              //*  Date and Position  *//
              // CustomInput(
              //   title: 'Date',
              //   value: controller.gazSafetyData[formKeyEICRdeclaration]
              //       [formKeyInspectedDate],
              //   onChanged: (dynamic value) => controller
              //       .onChangeDeclarationValue(formKeyInspectedDate, value),
              //   textInputType: TextInputType.datetime,
              //   textInputAction: TextInputAction.next,
              // ),
              // CustomInput(
              //   title: 'Position',
              //   value: controller.gazSafetyData[formKeyEICRdeclaration]
              //       [formKeyInspectedPosition],
              //   onChanged: (dynamic value) => controller
              //       .onChangeDeclarationValue(formKeyInspectedPosition, value),
              //   textInputType: TextInputType.name,
              //   textInputAction: TextInputAction.done,
              // ),
              //  SizedBox(height: DEVICE_HEIGHT * 0.025),

              // CustomTextFormTitle(
              //   leftText: '',
              //   text: 'Report Authorized for Issue By'.toUpperCase(),
              //   fontSize: 17.0,
              // ),
              //*  Contractor *//
              // CustomInput(
              //   title: 'Contractor',
              //   marginBottom: 0.025,
              //   value: controller.gazSafetyData[formKeyEICRdeclaration]
              //       [formKeyReportContractor],
              //   onChanged: (dynamic value) => controller
              //       .onChangeDeclarationValue(formKeyReportContractor, value),
              //   textInputType: TextInputType.name,
              //   textInputAction: TextInputAction.done,
              // ),
              // Align(
              //   child: CommonText(
              //     onPress: () => Get.bottomSheet(
              //       BottomSheetContainer(
              //         style: appContainerStyles.bottomSheetContainer().copyWith(
              //               marginHorizontal: 0.05,
              //               height: 0.55,
              //               marginBottom: 0.2,
              //               borderRadius: 0.06,
              //               paddingBottom: 0.02,
              //               clipBehavior: Clip.hardEdge,
              //             ),
              //         child: Column(
              //           children: <Widget>[
              //             CommonText(
              //               text: 'Contractor Signature',
              //               style: appTextStyles.h2StyleBlack().copyWith(
              //                     rowMainAxisSize: MainAxisSize.max,
              //                   ),
              //             ),
              //             CommonText(
              //               text: 'Draw your signature below',
              //               style: appTextStyles.h4GreyMediumStyle().copyWith(
              //                     rowMainAxisSize: MainAxisSize.max,
              //                   ),
              //             ),
              //             SizedBox(
              //               height: DEVICE_HEIGHT * 0.01,
              //             ),
              //             EasySignaturePad(
              //               onChanged: (String image) {
              //                 controller.setCustomerImage(image);
              //               },
              //               height: DEVICE_WIDTH ~/ 1.5,
              //               width: DEVICE_WIDTH ~/ 1.2,
              //               strokeWidth: 4.0,
              //               borderRadius: 10.0,
              //               borderColor: Colors.grey,
              //             ),
              //             SizedBox(
              //               height: DEVICE_HEIGHT * 0.01,
              //             ),
              //             CommonButton(
              //               text: 'Save',
              //               onPress: controller.saveCustomerSignature,
              //               buttonStyle: appButtonStyles.fullPrimaryButton(),
              //             ),
              //           ],
              //         ),
              //       ),
              //       isScrollControlled: true,
              //       enableDrag: false,
              //     ),
              //     text: 'Tap Here To Sign',
              //     style: appTextStyles.h3StyleBlack().copyWith(
              //           fontWeight: FontWeight.w500,
              //           fontColor: Color(AppColors.grey).withOpacity(0.8),
              //           fontSize: fontHeader,
              //         ),
              //     containerStyle: CommonContainerModel(
              //       width: 0.9,
              //       height: 0.08,
              //       backgroundColor: Colors.grey.withOpacity(0.2),
              //       alignment: Alignment.center,
              //       borderWidth: 1,
              //       borderRadius: 0.01,
              //       borderColor: Color(AppColors.grey).withOpacity(0.2),
              //       touchEffect: TouchableEffect(
              //         type: TouchTypes.opacity,
              //       ),
              //     ),
              //   ),
              // ),
              // if (controller.signatureBytes2 != null &&
              //     controller.customerSignatureBytes != null)
              //   Column(
              //     children: <Widget>[
              //       const SizedBox(height: 10),
              //       CupertinoButton(
              //         onPressed: controller.clearCustomerSignature,
              //         child: const Align(
              //           alignment: AlignmentDirectional.centerStart,
              //           child: Icon(
              //             Icons.highlight_remove_sharp,
              //             color: Colors.red,
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: DEVICE_WIDTH / 2,
              //         width: DEVICE_WIDTH,
              //         child: Image.memory(
              //           controller.customerSignatureBytes!,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ],
              //   ),

              //*  Name and Date  *//
              // CustomInput(
              //   title: 'Name',
              //   hint: '',
              //   marginTop: 0.025,
              //   value: controller.gazSafetyData[formKeyEICRdeclaration]
              //       [formKeyReportName],
              //   onChanged: (dynamic value) => controller
              //       .onChangeDeclarationValue(formKeyReportName, value),
              //   textInputType: TextInputType.name,
              //   textInputAction: TextInputAction.next,
              // ),
              // CustomInput(
              //   title: 'Date',
              //   marginTop: 0.025,
              //   value: controller.gazSafetyData[formKeyEICRdeclaration]
              //       [formKeyReportDate],
              //   onChanged: (dynamic value) => controller
              //       .onChangeDeclarationValue(formKeyReportDate, value),
              //   textInputType: TextInputType.datetime,
              //   textInputAction: TextInputAction.done,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
