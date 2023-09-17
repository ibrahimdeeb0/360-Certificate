import '../../general_exports.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        title: 'Delete Account',
      ),
      body: GetBuilder<DeleteAccountController>(
        init: DeleteAccountController(),
        builder: (DeleteAccountController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CommonContainer(
                    backgroundColor: const Color(0xfffff3cd),
                    width: 1,
                    height: 0.15,
                    paddingHorizontal: 0.04,
                    paddingVertical: 0.01,
                    marginTop: 0.02,
                    borderWidth: 1,
                    borderColor: const Color(0xffffeeba),
                    borderRadius: 0.01,
                    child: CommonText(
                      'Warning!',
                      style: appTextStyles.h1Style().copyWith(
                            fontColor: const Color(0xff856404),
                            rowMainAxisSize: MainAxisSize.max,
                            textAlign: TextAlign.start,
                          ),
                      leftChild: Padding(
                        padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.025),
                        child: SvgIconHelper(
                          iconPath: iconAttention,
                          color: const Color(0xff856404),
                          width: DEVICE_WIDTH * 0.02,
                          height: DEVICE_HEIGHT * 0.02,
                        ),
                      ),
                      bottomChild: CommonText(
                        'Warning, after a week of deleting your account, you will not be able to retrieve it and all data related to it will be deleted.',
                        style: appTextStyles.h3Style().copyWith(
                              fontColor: const Color(0xff856404),
                              textAlign: TextAlign.start,
                              rowMainAxisSize: MainAxisSize.max,
                              rowCrossAxisAlignment: CrossAxisAlignment.start,
                              columnCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                            ),
                        containerStyle:
                            const CommonContainerModel(marginTop: 0.015),
                      ),
                    ),
                  ),
                  CommonInput(
                    marginTop: 0.03,
                    text: 'Please Confirm Your Password',
                    hint: 'Type Password here',
                    controller: controller.passwordController,
                  ),
                  // CustomInput(
                  //   marginTop: 0.03,
                  //   title: 'Please Confirm Your Password',
                  //   hint: 'Type Password here',
                  //   controller: controller.passwordController,
                  // ),
                  CommonInput(
                    marginTop: 0.015,
                    text: 'Why do you want to delete?',
                    hint: 'Type ...',
                    controller: controller.descriptionController,
                    maxLines: 7,
                  ),
                  // CustomInputDescription(
                  //   marginTop: 0.015,
                  //   title: 'Why do you want to delete?',
                  //   hint: 'Type ...',
                  //   controller: controller.descriptionController,
                  // ),
                  SizedBox(
                    height: DEVICE_HEIGHT * 0.24,
                  ),
                  CommonButton(
                    onPress: () => controller.fieldsValidation(),
                    text: 'Delete',
                    fontColor: AppColors.red,
                    backgroundColor: Color(AppColors.red).withOpacity(0.1),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class WarningBottomSheet extends StatelessWidget {
  const WarningBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeleteAccountController>(
      init: DeleteAccountController(),
      builder: (DeleteAccountController controller) {
        return BottomSheetContainer(
          height: 0.2,
          child: Column(
            children: <Widget>[
              CommonText(
                'Confirm Deleting Account ',
                style: appTextStyles
                    .h2StyleBlack()
                    .copyWith(rowMainAxisSize: MainAxisSize.max),
              ),
              CommonButton(
                enabled: controller.startTime == 0,
                onPress: () => controller.onDeleteAccount(),
                text: controller.startTime == 0
                    ? 'Delete my Account'
                    : 'Delete my Account (${controller.startTime})',
                width: 0.9,
                height: 0.06,
                marginTop: 0.05,
                backgroundColor: AppColors.red,
                borderRadius: 0.015,
              ),
            ],
          ),
        );
      },
    );
  }
}
