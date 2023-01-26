import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(
        title: 'profile'.tr,
      ),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (ProfileController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: DEVICE_HEIGHT * 0.03,
                ),
                ProfileComponent(
                  title: 'first_name'.tr,
                  subTitle: myAppController.userData != null
                      ? myAppController.userData['user']['name'] != null
                          ? myAppController.userData['user']['name']
                              .split(' ')
                              .first
                          : 'أحمد'
                      : 'أحمد',
                ),
                ProfileComponent(
                  title: 'last_name'.tr,
                  subTitle: myAppController.userData != null
                      ? myAppController.userData['user']['name'] != null
                          ? myAppController.userData['user']['name']
                              .split(' ')
                              .last
                          : 'حسونة'
                      : 'حسونة',
                  // subTitle: 'حسونة',
                ),
                ProfileComponent(
                  title: 'phone_number'.tr,
                  subTitle: myAppController.userData != null
                      ? myAppController.userData['user']['mobile'] ??
                          'no number'
                      : 'no number',
                  rightText: 'موثق',
                  colorRightText: AppColors.green,
                ),
                ProfileComponent(
                  title: 'email'.tr,
                  subTitle: myAppController.userData != null
                      ? myAppController.userData['user']['email'] ?? 'لايوجد'
                      : 'لايوجد',
                  rightText: 'أضف عنوان',
                  colorRightText: AppColors.primary,
                  showAlertIcon: true,
                  pressRightText: () {},
                ),
                // CommonButton(
                //   onPress: () {
                //     consoleLog(myAppController.userData);
                //   },
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({
    Key? key,
    this.title,
    this.subTitle,
    this.rightText,
    this.colorRightText,
    this.showAlertIcon = false,
    this.pressRightText,
  }) : super(key: key);

  final String? title;
  final String? subTitle;
  final String? rightText;
  final dynamic colorRightText;
  final bool showAlertIcon;
  final Function? pressRightText;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      marginBottom: 0.04,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonText(
            title ?? '',
            fontColor: AppColors.greyDark,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            bottomChild: CommonText(
              subTitle ?? '',
              containerStyle: const CommonContainerModel(
                marginTop: 0.015,
              ),
              marginHorizontal: 0.015,
              leftChild: Visibility(
                visible: showAlertIcon,
                child: SvgPicture.asset(
                  iconAlert,
                  height: DEVICE_HEIGHT * 0.022,
                  width: DEVICE_WIDTH * 0.022,
                ),
              ),
            ),
          ),
          CommonText(
            rightText ?? '',
            onPress: pressRightText?.call,
            fontColor: colorRightText ?? AppColors.black,
            containerStyle: CommonContainerModel(
              touchEffect: TouchableEffect(
                type: TouchTypes.scaleAndFade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
