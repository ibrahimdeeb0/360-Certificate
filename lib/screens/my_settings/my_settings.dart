import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'My Settings',
      ),
      body: GetBuilder<MySettingsController>(
        init: MySettingsController(),
        builder: (MySettingsController controller) {
          return controller.userData.isNotEmpty
              ? Column(
                  children: <Widget>[
                    SettingHeader(
                      onEdit: () => Get.toNamed(routeProfile),
                      name:
                          '${controller.userData['first_name']} ${controller.userData['last_name']}'
                              .capitalize,
                      image: controller.userData['image_profile_url'] == null
                          ? const CircleContainer()
                          : CommonContainer(
                              // onPress: () {
                              //   Get.dialog(
                              //     DialogContainer(
                              //       child: CachedImage(
                              //         image:
                              //             '${controller.userData['image_profile_url']}',
                              //         width: DEVICE_WIDTH * 1,
                              //         height: DEVICE_WIDTH * 1,
                              //         withPlaceHolder: true,
                              //       ),
                              //     ),
                              //   );
                              // },
                              backgroundColor: AppColors.grey,
                              size: 0.18,
                              borderRadius: 1,
                              clipBehavior: Clip.hardEdge,
                              child: CachedImage(
                                image:
                                    '${controller.userData['image_profile_url']}',
                                width: DEVICE_WIDTH * 1,
                                height: DEVICE_WIDTH * 1,
                                withPlaceHolder: true,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                      child: CommonContainer(
                        width: 1,
                        backgroundColor: Colors.white,
                        paddingHorizontal: 0.04,
                        // paddingTop: 0.02,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CommonContainer(
                                onPress: () {
                                  // if (!homeController.isRequiredNumber) {
                                  //   Get.toNamed(routeSubscription);
                                  // }
                                  // consoleLogPretty(homeController.allUserData);
                                },
                                width: 1,
                                marginTop: 0.015,
                                borderBottomWidth: 2,
                                borderBottomColor: AppColors.greyLight,
                                paddingBottom: 0.015,
                                touchEffect:
                                    TouchableEffect(type: TouchTypes.opacity),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const CommonText(
                                      'View Your Plan',
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        CommonText(
                                          homeController.plan,
                                          fontColor: Colors.white,
                                          containerStyle: appContainerStyles
                                              .planContainerStyle
                                              .copyWith(marginHorizontal: 0.01),
                                        ),
                                        const Icon(Icons.arrow_forward),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              CommonText(
                                'Turn Invoice Feature',
                                rowMainAxisSize: MainAxisSize.max,
                                rowMainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                rightChild: CommonText(
                                  'coming soon',
                                  marginRight: 0.01,
                                  fontSize: fontH3,
                                  fontColor: Colors.grey,
                                  rightChild: Switch(
                                    activeColor: Colors.green,
                                    value: false,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                                containerStyle: appContainerStyles
                                    .bottomBorderStyle
                                    .copyWith(marginBottom: 0.015),
                              ),
                              ItemCard(
                                title: 'Company Email',
                                subTitle: controller.userData['email'],
                                hideArrow: true,
                              ),
                              ItemCard(
                                title: 'Company Phone Number',
                                subTitle: controller.userData['phone'],
                                hideArrow: true,
                              ),
                              ItemCard(
                                onPressItem: () => Get.to(
                                  () => const UpdatePostcode(),
                                  arguments: <String, dynamic>{
                                    keyData: controller.userData,
                                  },
                                ),
                                title: 'Type In The Postcode',
                                subTitle:
                                    controller.userData['registered_address'],
                              ),
                              const ItemCard(
                                isRequired: true,
                                title: 'Important Numbers',
                                subTitle:
                                    'License Number, Gas Safe Register Number',
                                marginBottom: 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
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
                                      touchEffect: TouchableEffect(
                                          type: TouchTypes.opacity),
                                    ),
                                    leftChild: CommonContainer(
                                      marginVertical: 0.01,
                                      size: 0.21,
                                      borderRadius: 0.02,
                                      borderWidth:
                                          controller.compLogoFile == null
                                              ? 0
                                              : 1.5,
                                      borderColor: Colors.blueGrey[200],
                                      clipBehavior: Clip.hardEdge,
                                      child: controller.compLogoFile == null
                                          ? controller.userData['logo'] == null
                                              ? SvgPicture.asset(
                                                  iconAttachCompLogo,
                                                  width: 1.flexWidth,
                                                  height: 1.flexHeight,
                                                )
                                              : CachedImage(
                                                  image:
                                                      '${controller.userData['logo']['url']}',
                                                  width: 1.flexWidth,
                                                  height: 1.flexHeight,
                                                  withPlaceHolder: true,
                                                  fit: BoxFit.cover,
                                                )
                                          : Image.file(
                                              File(controller
                                                  .compLogoFile!.path),
                                              fit: BoxFit.cover,
                                              width: 1.flexWidth,
                                              height: 1.flexHeight,
                                            ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.bottomSheet(
                                        const PickImageSheet(),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox();
        },
      ),
    );
  }
}

class SettingHeader extends StatelessWidget {
  const SettingHeader({
    super.key,
    this.name,
    this.onEdit,
    this.image,
  });
  final String? name;
  final Function? onEdit;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      backgroundColor: Colors.grey[100],
      paddingHorizontal: 0.04,
      paddingVertical: 0.015,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonText(
            name ?? 'Nick Marry',
            marginHorizontal: 0.02,
            leftChild: image ??
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(AppColors.grey).withOpacity(0.2),
                ),
          ),
          CommonContainer(
            onPress: onEdit,
            touchEffect: TouchableEffect(type: TouchTypes.scaleAndFade),
            child: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}

class PickImageSheet extends StatelessWidget {
  const PickImageSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Select',
      height: 0.25,
      child: GetBuilder<MySettingsController>(
        init: MySettingsController(),
        builder: (MySettingsController controller) {
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
