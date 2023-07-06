import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

class ContentPart3 extends StatelessWidget {
  const ContentPart3({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<CompleteProfileController>()) {
      return GetBuilder<CompleteProfileController>(
        init: CompleteProfileController(),
        builder: (CompleteProfileController controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonContainer(
                style: appContainerStyles.cardStyle,
                marginTop: 0.02,
                child: CommonText(
                  "Now that we have your license information, let's move on to your company details. Please provide the following:",
                  fontColor: Colors.grey[600],
                  fontSize: fontH3,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'Registered Company Name',
                  isRequired: true,
                ),
                hint: 'Registered Company Name',
                controller: controller.registeredCompanyController,
                marginBottom: 0.015,
                enabledBorder:
                    (controller.isValidP3 == null || controller.isValidP3!)
                        ? null
                        : const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.red,
                            ),
                          ),
              ),
              if (controller.isValidP3 != null &&
                  controller.isValidP3! == false)
                CommonContainer(
                  style: appContainerStyles.cardStyle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CommonText(
                        'Oops !',
                        marginHorizontal: 0.02,
                        leftChild: Icon(
                          Icons.info_outline,
                          color: Colors.red[700],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0.07.flexWidth),
                        child: CommonText(
                          "it looks like you've missed some important details. Please complete all the required fields marked with an asterisk (*) to proceed. Your Registered Company Name is essential for us to create certificates. If you have any issues or questions, please refer to our help section or get in touch with our support team. Thank you for your understanding.",
                          textAlign: TextAlign.start,
                          marginTop: 0.01,
                          fontColor: Colors.grey[700],
                          fontSize: fontH3,
                        ),
                      ),
                    ],
                  ),
                ),
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'Trading Name (Optional)',
                ),
                hint: "Enter Your Company's Official Registration Number",
                controller: controller.tradingNameController,
                marginBottom: 0.01,
              ),
              CommonText(
                'If your company trades under a different name, please enter it here',
                fontSize: fontH3,
                fontColor: Colors.grey[700],
                textAlign: TextAlign.start,
                marginBottom: 0.015,
              ),
              CommonInput(
                topLabelText: 'Registration Number (Optional)',
                hint: 'Enter Your Registration Number',
                controller: controller.registrationNumberController,
                textInputAction: TextInputAction.go,
                marginBottom: 0.015,
              ),
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'VAT Number  (Optional)',
                ),
                hint: 'VAT Number',
                marginBottom: 0.015,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                controller: controller.vATNumberController,
              ),
              // CommonText(
              //   'Is your business VAT Registered?',
              //   fontColor: Colors.grey[700],
              //   rowMainAxisSize: MainAxisSize.max,
              //   rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   rightChild: CommonButton(
              //     onPress: controller.toggleVat,
              //     text: controller.isVatRegistered ? 'Yes' : 'No',
              //     width: 0.15,
              //     height: 0.045,
              //     backgroundColor: controller.isVatRegistered
              //         ? AppColors.primary
              //         : Colors.grey,
              //   ),
              // ),

              const CommonText(
                "Upload Your Company's Logo (Optional)",
                fontSize: fontH2,
                marginBottom: 0.01,
              ),
              CommonText(
                'This will be displayed on your certificates and profile',
                fontSize: fontH3,
                fontColor: Colors.grey[700],
                textAlign: TextAlign.start,
                marginBottom: 0.015,
              ),
              CommonText(
                'Company Logo',
                onPress: () {
                  Get.bottomSheet(
                    const ImportImageSheet(),
                  );
                },
                fontSize: fontH2,
                marginHorizontal: 0.04,
                containerStyle: CommonContainerModel(
                  touchEffect: TouchableEffect(type: TouchTypes.opacity),
                ),
                leftChild: CommonContainer(
                  marginVertical: 0.01,
                  size: 0.21,
                  borderRadius: 0.02,
                  borderWidth: controller.compLogoFile == null ? 0 : 1.5,
                  borderColor: Colors.blueGrey[200],
                  clipBehavior: Clip.hardEdge,
                  child: controller.compLogoFile == null
                      ? SvgPicture.asset(
                          iconAttachCompLogo,
                          width: 1.flexWidth,
                          height: 1.flexHeight,
                        )
                      : Image.file(
                          File(controller.compLogoFile!.path),
                          fit: BoxFit.cover,
                          width: 1.flexWidth,
                          height: 1.flexHeight,
                        ),
                ),
              ),
              0.02.boxHeight,
            ],
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}

class ImportImageSheet extends StatelessWidget {
  const ImportImageSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Select',
      height: 0.25,
      child: GetBuilder<CompleteProfileController>(
        init: CompleteProfileController(),
        builder: (CompleteProfileController controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CommonButton(
                onPress: () => controller.pickerImage(
                  ImageSource.gallery,
                ),
                text: 'Import from Gallery',
                marginBottom: 0.015,
                height: 0.06,
                borderRadius: 0.02,
              ),
              CommonButton(
                onPress: () {
                  controller.pickerImage(
                    ImageSource.camera,
                  );
                },
                text: 'Import from Camera',
                borderRadius: 0.02,
                marginBottom: 0.015,
                height: 0.06,
              ),
            ],
          );
        },
      ),
    );
  }
}
