import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({
    Key? key,
    this.deleteJobUsage,
    this.keepCertUsage,
    this.diskSpace,
    this.emailAllowance,
    this.onPressButton,
  }) : super(key: key);

  final String? deleteJobUsage;
  final String? keepCertUsage;
  final String? diskSpace;
  final String? emailAllowance;
  final Function? onPressButton;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return CommonContainer(
          style: appContainerStyles.containerStyles,
          paddingHorizontal: 0.0,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //*---------Profile Header------------------//
                CommonContainer(
                  style: CommonContainerModel(
                    backgroundColor: Color(AppColors.grey).withOpacity(0.2),
                    paddingHorizontal: 0.04,
                    paddingTop: 0.005,
                    width: 1,
                    height: 0.36,
                  ),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          const CommonContainer(
                            width: 0.38,
                            height: 0.16,
                            borderRadius: 0.02,
                          ),
                          CommonContainer(
                            style: CommonContainerModel(
                              backgroundColor: AppColors.grey,
                              width: 0.285,
                              height: 0.13,
                              borderRadius: 1,
                              clipBehavior: Clip.hardEdge,
                            ),
                            child: controller.fileImage == null
                                ? controller.userProfileData[
                                            'image_profile_url'] ==
                                        null
                                    ? const CircleContainer()
                                    : CachedImage(
                                        image:
                                            '${controller.userProfileData['image_profile_url']}',
                                        width: DEVICE_WIDTH * 1,
                                        height: DEVICE_WIDTH * 1,
                                        withPlaceHolder: true,
                                        fit: BoxFit.cover,
                                      )
                                : Image.file(
                                    File(controller.fileImage!.path),
                                    fit: BoxFit.cover,
                                    width: DEVICE_WIDTH * 1,
                                    height: DEVICE_HEIGHT * 1,
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: DEVICE_WIDTH * 0.05,
                                bottom: DEVICE_HEIGHT * 0.013,
                              ),
                              child: CommonContainer(
                                onPress: () => Get.bottomSheet(
                                  // const ImportImageBottomSheet(),
                                  PickPhotoBottomSheet(
                                    title: 'Add Photo',
                                    onGallery: () => controller
                                        .pickerFunction(ImageSource.gallery),
                                    onCamera: () => controller
                                        .pickerFunction(ImageSource.camera),
                                  ),
                                ),
                                style: CommonContainerModel(
                                  touchEffect: TouchableEffect(
                                    type: TouchTypes.scaleAndUp,
                                  ),
                                  backgroundColor: AppColors.primary,
                                  width: 0.09,
                                  height: 0.044,
                                  borderRadius: 100,
                                  padding: 0.007,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        // const Color(0xFF78BEF7),
                                        Color(AppColors.primary),
                                        Color(AppColors.pp),
                                      ],
                                    ),
                                  ),
                                ),
                                child: SvgPicture.asset(iconProfilePic),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: DEVICE_HEIGHT * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CommonText(
                            'Cert Usage',
                            style: appTextStyles.h3Style().copyWith(
                                  fontColor: AppColors.textGrey,
                                  textAlign: TextAlign.start,
                                  columnCrossAxisAlignment:
                                      CrossAxisAlignment.start,
                                ),
                            containerStyle: const CommonContainerModel(
                              paddingLeft: 0.06,
                              width: 0.43,
                            ),
                            bottomChild: Column(
                              children: <Widget>[
                                SizedBox(height: DEVICE_HEIGHT * 0.008),
                                CommonText(
                                  keepCertUsage ?? '',
                                  style: appTextStyles
                                      .h2StyleBlack()
                                      .copyWith(textAlign: TextAlign.start),
                                ),
                              ],
                            ),
                          ),
                          CommonContainer(
                            style: CommonContainerModel(
                              height: 0.05,
                              borderRightColor:
                                  Color(AppColors.grey).withOpacity(0.2),
                              borderRightWidth: 2.5,
                              marginTop: 0.01,
                            ),
                          ),
                          CommonText(
                            'Email Allowance',
                            style: appTextStyles.h3Style().copyWith(
                                  fontColor: AppColors.textGrey,
                                  textAlign: TextAlign.start,
                                  rowMainAxisSize: MainAxisSize.max,
                                ),
                            containerStyle: const CommonContainerModel(
                                width: 0.44, paddingLeft: 0.085),
                            bottomChild: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: DEVICE_HEIGHT * 0.008),
                                CommonText(
                                  emailAllowance ?? '',
                                  style: appTextStyles.h2StyleBlack().copyWith(
                                        rowMainAxisSize: MainAxisSize.max,
                                        textAlign: TextAlign.start,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: DEVICE_HEIGHT * 0.02),
                      CommonText(
                        'Disk Space',
                        style: appTextStyles.h3Style().copyWith(
                              fontColor: AppColors.textGrey,
                              textAlign: TextAlign.start,
                              columnCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                            ),
                        containerStyle: const CommonContainerModel(
                          paddingLeft: 0.06,
                          width: 1,
                          alignment: AlignmentDirectional.center,
                        ),
                        bottomChild: CommonText(
                          diskSpace ?? '67/100',
                          marginTop: 0.01,
                          fontSize: fontH2,
                        ),
                      ),
                    ],
                  ),
                ),
                //*---------Inputs Filed------------------//
                CommonContainer(
                  style: const CommonContainerModel(
                    paddingHorizontal: 0.04,
                    paddingTop: 0.025,
                  ),
                  child: Column(
                    children: <Widget>[
                      CommonInput(
                        topLabelText: 'First Name',
                        controller: controller.firstNameController,
                        marginBottom: 0.01,
                      ),
                      CommonInput(
                        topLabelText: 'Last Name',
                        controller: controller.lastNameController,
                        marginBottom: 0.01,
                      ),
                      CommonInput(
                        enabled: false,
                        topLabelText: 'Email',
                        hint: controller.userProfileData.isEmpty
                            ? ' '
                            : controller.userProfileData['email'],
                        marginBottom: 0.01,
                      ),
                      CommonInput(
                        topLabelText: 'Phone Number',
                        controller: controller.phoneNumberController,
                        marginBottom: 0.01,
                      ),
                    ],
                  ),
                ),
                //*---------Subscription Invoices------------------//
                // CommonContainer(
                //   onPress: () {
                //     hideKeyboard();
                //     Get.to(
                //       () => const ProfileSubscriptionInvoices(),
                //       transition: Transition.fade,
                //     );
                //   },
                //   style: appContainerStyles.bottomBorderContainer.copyWith(
                //     paddingHorizontal: 0.04,
                //     borderBottomWidth: 3,
                //     touchEffect: TouchableEffect(type: TouchTypes.opacity),
                //   ),
                //   child: CustomTextRow(
                //     title: 'Subscription Invoices',
                //     titleColor: AppColors.colorBlack,
                //     leftChild: SvgPicture.asset(
                //       iconInvoices,
                //       width: DEVICE_WIDTH * 0.028,
                //       height: DEVICE_HEIGHT * 0.028,
                //       color: Colors.black,
                //     ),
                //     withRightChild: true,
                //     rightChild: SvgPicture.asset(
                //       iconArrowGo,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),

                //*---------Profile Footer------------------//
                CommonContainer(
                  style: appContainerStyles.topBorderContainer,
                  marginTop: 0.02,
                  child: Column(
                    children: <Widget>[
                      //*---------Change Password------------------//
                      CommonContainer(
                        marginBottom: 0.02,
                        onPress: () {
                          hideKeyboard();
                          Get.to(
                            () => const ProfileChangePassword(),
                            transition: Transition.fade,
                          );
                        },
                        paddingTop: 0.01,
                        touchEffect: TouchableEffect(
                          type: TouchTypes.opacity,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const CommonText(
                              'Change Password',
                              marginHorizontal: 0.025,
                              leftChild: SvgIconHelper(
                                iconPath: iconChangePassword,
                                color: Colors.black,
                              ),
                            ),
                            SvgIconHelper(
                              iconPath: iconArrowGo,
                              color: Color(AppColors.primary),
                            ),
                          ],
                        ),
                      ),

                      Divider(
                        thickness: 3,
                        color: Colors.grey[300],
                      ),

                      //*---------Delete Account------------------//
                      CommonContainer(
                        onPress: () {
                          hideKeyboard();
                          Get.to(
                            () => const DeleteAccountScreen(),
                            transition: Transition.fade,
                          );
                        },
                        style: CommonContainerModel(
                          marginTop: 0.02,
                          touchEffect:
                              TouchableEffect(type: TouchTypes.opacity),
                        ),
                        child: CustomTextRow(
                          title: 'Delete Account',
                          titleColor: AppColors.red,
                          leftChild: SvgIconHelper(
                            iconPath: iconDeleteAccount,
                            color: Color(AppColors.red),
                            width: DEVICE_WIDTH * 0.028,
                            height: DEVICE_HEIGHT * 0.028,
                          ),
                          withRightChild: true,
                          rightChild: SvgIconHelper(
                            iconPath: iconArrowGo,
                            color: Color(AppColors.primary),
                          ),
                          paddingBottom: 0.0,
                        ),
                      ),

                      CommonButton(
                        onPress: () => controller.onUpdateProfileData(),
                        text: 'Save Changes',
                        width: 1,
                        height: 0.06,
                        marginTop: 0.04,
                        marginBottom: 0.01,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
