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
                  0.02.boxHeight,
                  CommonContainer(
                    style: appContainerStyles.cardStyle,
                    backgroundColor: const Color(0xfffff3cd),
                    child: CommonText(
                      'Warning!',
                      fontSize: fontH1,
                      fontColor: const Color.fromARGB(255, 109, 83, 5),
                      columnCrossAxisAlignment: CrossAxisAlignment.start,
                      marginHorizontal: 0.02,
                      leftChild: SvgIconHelper(
                        iconPath: iconAttention,
                        color: const Color.fromARGB(255, 109, 83, 5),
                        width: DEVICE_WIDTH * 0.02,
                        height: DEVICE_HEIGHT * 0.02,
                      ),
                      bottomChild: const CommonText(
                        'Warning, after a week of deleting your account, you will not be able to retrieve it and all data related to it will be deleted.',
                        fontColor: Color.fromARGB(255, 109, 83, 5),
                        textAlign: TextAlign.start,
                        containerStyle:
                            CommonContainerModel(marginTop: 0.015, width: 0.9),
                        bottomChild: SizedBox(),
                      ),
                    ),
                  ),
                  CommonInput(
                    marginTop: 0.03,
                    text: 'Please Confirm Your Password',
                    hint: 'Type Password here',
                    controller: controller.passwordController,
                  ),
                  CommonInput(
                    marginTop: 0.015,
                    text: 'Why do you want to delete?',
                    hint: 'Type ...',
                    controller: controller.descriptionController,
                    maxLines: 7,
                  ),
                  SizedBox(
                    height: DEVICE_HEIGHT * 0.24,
                  ),
                  CommonButton(
                    onPress: () => controller.fieldsValidation(),
                    text: 'Delete',
                    fontColor: Colors.red[700],
                    backgroundColor: Colors.red[100],
                    overlayColor: Colors.grey[300],
                    marginBottom: 0.02,
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
