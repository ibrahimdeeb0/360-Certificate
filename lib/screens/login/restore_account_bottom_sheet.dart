import 'package:flutter_svg/flutter_svg.dart';

import '../../../general_exports.dart';

class RestoreAccountBottomSheet extends StatelessWidget {
  const RestoreAccountBottomSheet({required this.restoreData, Key? key})
      : super(key: key);

  final Map<String, dynamic> restoreData;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 0.37,
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) {
          return Column(
            children: <Widget>[
              SvgPicture.asset(
                iconAttention,
                width: DEVICE_WIDTH * 0.05,
                height: DEVICE_HEIGHT * 0.05,
              ),
              CommonText(
                'Do you want to restore your account',
                style: appTextStyles.h2StyleBlack(),
                containerStyle:
                    const CommonContainerModel(marginVertical: 0.025),
              ),
              CommonText(
                "You can restore you account for (${restoreData['final_day']}) after this date we will delete all your date and you can't restore your account or any data for you.",
                style: appTextStyles.h3StyleBlack().copyWith(
                      fontColor: AppColors.textGrey,
                    ),
                containerStyle: const CommonContainerModel(
                  marginBottom: 0.04,
                  width: 0.8,
                ),
              ),
              CommonButton(
                text: 'Restore Account',
                // buttonStyle: appButtonStyles.fullPrimaryButton().copyWith(
                //       containerStyle: appContainerStyles.defaultButtonContainer,
                //     ),
                onPress: () => controller.onRestoreAccount(
                    path: restoreData['restore_url']),
              ),
            ],
          );
        },
      ),
    );
  }
}
