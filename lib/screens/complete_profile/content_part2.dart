import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

class ContentPart2 extends StatelessWidget {
  const ContentPart2({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<CompleteProfileController>()) {
      return GetBuilder<CompleteProfileController>(
        init: CompleteProfileController(),
        builder: (CompleteProfileController controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              0.01.ph,
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'Registered Company Name',
                ),
                hint: 'Enter Your Registered Company Name',
                controller: controller.registeredCompanyController,
                marginBottom: 0.015,
              ),
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'Trading Name',
                ),
                hint: 'Enter Your Trading Name',
                controller: controller.tradingNameController,
                marginBottom: 0.015,
              ),
              CommonInput(
                topLabelText: 'Registration Number (No Required)',
                hint: 'Enter Your Registration Number',
                controller: controller.registrationNumberController,
                textInputAction: TextInputAction.go,
                marginBottom: 0.015,
              ),
              CommonText(
                'Is your business VAT Registered?',
                fontColor: Colors.grey[700],
                rowMainAxisSize: MainAxisSize.max,
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                rightChild: CommonButton(
                  onPress: controller.toggleVat,
                  text: controller.isVatRegistered ? 'Yes' : 'No',
                  width: 0.15,
                  height: 0.045,
                  backgroundColor: controller.isVatRegistered
                      ? AppColors.primary
                      : Colors.grey,
                ),
              ),
              if (controller.isVatRegistered)
                CommonInput(
                  topLabel: const TopLabelText(
                    text: 'What Is Your VAT Number',
                  ),
                  hint: 'Enter Your VAT Number',
                  marginBottom: 0.015,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.go,
                  controller: controller.vATNumberController,
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
              if (controller.isVatRegistered) 0.01.ph else 0.13.ph,
              CommonText(
                'Why do we need this information?',
                textAlign: TextAlign.start,
                inlineSpans: const <InlineSpan>[],
                rowCrossAxisAlignment: CrossAxisAlignment.start,
                columnCrossAxisAlignment: CrossAxisAlignment.start,
                marginHorizontal: 0.02,
                leftChild: Padding(
                  padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.015),
                  child: SvgPicture.asset(iconAlert),
                ),
                bottomChild: CommonText(
                  'This information will displayed on all your quotes and invoices and for the invoices to be valid all your company details should be displayed',
                  textAlign: TextAlign.start,
                  marginLeft: 0.06,
                  marginTop: 0.01,
                  fontColor: Colors.grey[700],
                  fontSize: fontH3,
                ),
                containerStyle: appContainerStyles.cardStyle,
              ),
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
