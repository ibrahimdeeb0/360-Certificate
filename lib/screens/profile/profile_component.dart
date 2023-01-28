import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({
    Key? key,
    this.planeName,
    this.jobsUsage,
    this.quoteUsage,
    this.certificateUsage,
    this.emailAllowance,
    this.planeColor,
    this.onPressButton,
  }) : super(key: key);

  final String? planeName;
  final int? planeColor;
  final String? jobsUsage;
  final String? quoteUsage;
  final String? certificateUsage;
  final String? emailAllowance;
  final Function? onPressButton;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return CommonContainer(
          style: CommonContainerModel(backgroundColor: AppColors.white),
          child: Column(
            children: <Widget>[
              ProfileCardPlane(
                planeTitle: planeName,
                backgroundColor: planeColor,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      //*---------Profile Header------------------//
                      CommonContainer(
                        style: CommonContainerModel(
                          backgroundColor:
                              Color(AppColors.grey).withOpacity(0.1),
                          paddingHorizontal: 0.04,
                          paddingTop: 0.01,
                          width: 1,
                          height: 0.356,
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
                                      ? CachedImage(
                                          image:
                                              '${controller.userDataProfile['image_profile_url']}',
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
                                        const ImportImageBottomSheet(),
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
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: <Color>[
                                              const Color(0xFF78BEF7),
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
                                  'Jobs Usage',
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
                                        jobsUsage ?? '20/100',
                                        style: appTextStyles
                                            .h2StyleBlack()
                                            .copyWith(
                                                textAlign: TextAlign.start),
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
                                  'Quote Usage',
                                  style: appTextStyles.h3Style().copyWith(
                                        fontColor: AppColors.textGrey,
                                        rowMainAxisSize: MainAxisSize.max,
                                        textAlign: TextAlign.start,
                                      ),
                                  containerStyle: const CommonContainerModel(
                                    width: 0.44,
                                    paddingLeft: 0.085,
                                  ),
                                  bottomChild: Column(
                                    children: <Widget>[
                                      SizedBox(height: DEVICE_HEIGHT * 0.008),
                                      CommonText(
                                        quoteUsage ?? '45/100',
                                        style: appTextStyles
                                            .h2StyleBlack()
                                            .copyWith(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CommonText(
                                  'Certificate Usage ',
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
                                        certificateUsage ?? '67/100',
                                        style: appTextStyles
                                            .h2StyleBlack()
                                            .copyWith(
                                                textAlign: TextAlign.start),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: DEVICE_HEIGHT * 0.008),
                                      CommonText(
                                        emailAllowance ?? '37/100',
                                        style: appTextStyles
                                            .h2StyleBlack()
                                            .copyWith(
                                              rowMainAxisSize: MainAxisSize.max,
                                              textAlign: TextAlign.start,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                              hint: controller.userDataProfile.isEmpty
                                  ? ' '
                                  : controller.userDataProfile['first_name'],
                              controller: controller.firstNameController,
                            ),
                            CommonInput(
                              topLabelText: 'Last Name',
                              hint: controller.userDataProfile.isEmpty
                                  ? ' '
                                  : controller.userDataProfile['last_name'],
                              controller: controller.lastNameController,
                            ),
                            CommonInput(
                              enabled: false,
                              topLabelText: 'Email',
                              hint: controller.userDataProfile.isEmpty
                                  ? ' '
                                  : controller.userDataProfile['email'],
                            ),
                            CommonInput(
                              topLabelText: 'Phone Number',
                              hint: controller.userDataProfile.isEmpty
                                  ? ' '
                                  : '${controller.userDataProfile['phone'] ?? ''}',
                              controller: controller.phoneNumberController,
                            ),
                          ],
                        ),
                      ),
                      //*---------Subscription Invoices------------------//
                      CommonContainer(
                        onPress: () {
                          hideKeyboard();
                          Get.to(
                            () => const ProfileSubscriptionInvoices(),
                            transition: Transition.fade,
                          );
                        },
                        style:
                            appContainerStyles.bottomBorderContainer.copyWith(
                          paddingHorizontal: 0.04,
                          borderBottomWidth: 3,
                          touchEffect:
                              TouchableEffect(type: TouchTypes.opacity),
                        ),
                        child: CustomTextRow(
                          title: 'Subscription Invoices',
                          titleColor: AppColors.colorBlack,
                          leftChild: SvgPicture.asset(
                            iconInvoices,
                            width: DEVICE_WIDTH * 0.028,
                            height: DEVICE_HEIGHT * 0.028,
                            color: Colors.black,
                          ),
                          withRightChild: true,
                          rightChild: SvgPicture.asset(
                            iconArrowGo,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      //*---------Profile Footer------------------//
                      CommonContainer(
                        style: appContainerStyles.topBorderContainer,
                        child: Column(
                          children: <Widget>[
                            //*---------Change Password------------------//
                            CommonContainer(
                              onPress: () {
                                hideKeyboard();
                                Get.to(
                                  () => const ProfileChangePassword(),
                                  transition: Transition.fade,
                                );
                              },
                              style: appContainerStyles.bottomBorderContainer
                                  .copyWith(
                                paddingHorizontal: 0.0,
                                paddingTop: 0.0,
                                paddingBottom: 0.02,
                              ),
                              // CommonContainerModel(
                              //   touchEffect:
                              //       TouchableEffect(type: TouchTypes.opacity),
                              // ),
                              child: CustomTextRow(
                                title: 'Change Password',
                                leftChild: SvgPicture.asset(iconChangePassword),
                                withRightChild: true,
                                rightChild: SvgPicture.asset(
                                  iconArrowGo,
                                  color: Color(
                                    AppColors.primary,
                                  ),
                                ),
                                paddingBottom: 0.0,
                              ),
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
                                leftChild: SvgPicture.asset(
                                  iconDeleteAccount,
                                  width: DEVICE_WIDTH * 0.028,
                                  height: DEVICE_HEIGHT * 0.028,
                                  color: Color(AppColors.red),
                                ),
                                withRightChild: true,
                                rightChild: SvgPicture.asset(
                                  iconArrowGo,
                                  color: Color(
                                    AppColors.primary,
                                  ),
                                ),
                                paddingBottom: 0.0,
                              ),
                            ),

                            CommonButton(
                              onPress: () => controller.onUpdateProfileData(),
                              text: 'Save Changes',
                              width: 1,
                              height: 0.06,
                              marginTop: 0.03,
                              marginBottom: 0.008,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ImportImageBottomSheet extends StatelessWidget {
  const ImportImageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Select',
      height: 0.25,
      child: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (ProfileController controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CommonButton(
                onPress: () => controller.pickerFunction(
                  ImageSource.gallery,
                ),
                text: 'Import from Gallery',
                marginBottom: 0.015,
                height: 0.06,
                borderRadius: 0.02,
              ),
              CommonButton(
                onPress: () {
                  controller.pickerFunction(
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
