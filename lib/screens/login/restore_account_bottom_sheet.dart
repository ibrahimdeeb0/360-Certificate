import '../../../general_exports.dart';

class RestoreAccountBottomSheet extends StatelessWidget {
  const RestoreAccountBottomSheet({required this.restoreData, Key? key})
      : super(key: key);

  final Map<String, dynamic> restoreData;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      responsiveContent: true,
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                0.02.boxHeight,
                SvgIconHelper(
                  iconPath: iconAttention,
                  color: Colors.orange[800]!,
                  width: DEVICE_WIDTH * 0.05,
                  height: DEVICE_HEIGHT * 0.05,
                ),
                CommonText(
                  'Do you want to restore your account',
                  style: appTextStyles.h2StyleBlack(),
                  containerStyle:
                      const CommonContainerModel(marginVertical: 0.015),
                ),
                CommonText(
                  "You can restore you account for (${restoreData['final_day']}) after this date we will delete all your date and you can't restore your account or any data for you.",
                  fontColor: AppColors.textGrey,
                  containerStyle: const CommonContainerModel(
                    marginBottom: 0.04,
                    marginTop: 0.015,
                    width: 0.8,
                  ),
                  bottomChild: const SizedBox(),
                ),
                CommonButton(
                  text: 'Restore Account',
                  onPress: () => controller.onRestoreAccount(
                      path: restoreData['restore_url']),
                  marginBottom: 0.03,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
