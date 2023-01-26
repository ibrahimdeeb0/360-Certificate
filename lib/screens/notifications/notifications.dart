import 'package:flutter_svg/flutter_svg.dart';

import '../../general_exports.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'notifications'.tr,
        withBack: false,
      ),
      body: GetBuilder<NotificationsController>(
        init: NotificationsController(),
        builder: (NotificationsController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles
                .copyWith(backgroundColor: AppColors.greyLight),
            child: Column(
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.03),
                const NotificationCard(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    this.notifTitle,
    this.notifDescription,
    this.notifDate,
    this.isReadDone = false,
  }) : super(key: key);

  final String? notifTitle;
  final String? notifDescription;
  final String? notifDate;
  final bool isReadDone;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      width: 1,
      borderRadius: 0.015,
      paddingHorizontal: 0.04,
      paddingVertical: 0.02,
      backgroundColor: Color(isReadDone ? AppColors.grey : AppColors.primary)
          .withOpacity(0.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Opacity(
            opacity: isReadDone ? 0.5 : 1.0,
            child: SvgPicture.asset(
              iconNotificationScreen,
              width: DEVICE_WIDTH * 0.04,
              height: DEVICE_HEIGHT * 0.04,
            ),
          ),
          SizedBox(width: DEVICE_WIDTH * 0.025),
          CommonText(
            notifTitle ?? 'notice_title'.tr,
            style: appTextStyles.textTitleBoldStyle,
            containerStyle: const CommonContainerModel(
              width: 0.725,
            ),
            bottomChild: CommonText(
              notifDescription ?? 'text_example'.tr,
              style: appTextStyles.textTitleBoldStyle,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
              bottomChild: CommonText(
                notifDate ?? '22/8/2022',
                fontColor: AppColors.greyDark,
                fontSize: fontH3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
