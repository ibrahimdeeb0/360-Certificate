import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class CarServiceCard extends StatelessWidget {
  const CarServiceCard({
    Key? key,
    this.serviceName,
    this.serviceDate,
    this.serviceIconPath,
    this.carName,
    this.carNumber,
    this.servicePrice,
    this.serviceStatus,
    this.serviceStatusColor,
    this.onPress,
    this.ahmService = false,
    this.isCarSafe = true,
    this.withPrice = true,
  }) : super(key: key);

  final String? serviceName;
  final String? serviceDate;
  final String? serviceIconPath;
  final String? carName;
  final String? carNumber;
  final String? servicePrice;
  final String? serviceStatus;
  final dynamic serviceStatusColor;
  final Function? onPress;
  final bool ahmService;
  final bool isCarSafe;
  final bool withPrice;
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress?.call,
      style: appContainerStyles.greyCardContainer,
      marginBottom: 0.02,
      paddingVertical: 0.0,
      paddingTop: 0.01,
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                // color: Colors.amber,
                width: DEVICE_WIDTH * 0.63,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // service Details
                    TitleDetails(
                      titleName: serviceName,
                      titleDetails: serviceDate,
                      iconPath: serviceIconPath ?? iconWinchService,
                    ),
                    // Dots
                    CommonContainer(
                      width: 0.1,
                      marginBottom: 0.004,
                      child: SvgPicture.asset(
                        iconDashedLine,
                      ),
                    ),
                    // Car Details
                    TitleDetails(
                      titleName: carName ?? 'Mercedes-Benz S-Class',
                      titleDetails: carNumber ?? '12-345-90',
                      iconPath: iconCar,
                      bgClrIcon: AppColors.greyLightBorder,
                      iconSize: 0.11,
                      iconMarginTop: 0.008,
                    ),
                    SizedBox(height: DEVICE_HEIGHT * 0.015),
                  ],
                ),
              ),
              if (!ahmService)
                CommonText(
                  serviceStatus ?? 'completed'.tr,
                  fontWeight: FontWeight.bold,
                  fontSize: fontH3,
                  fontColor: serviceStatusColor ?? AppColors.green,
                  containerStyle: const CommonContainerModel(
                    width: 0.23,
                    marginTop: 0.01,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                  topChild: withPrice
                      ? CommonText(
                          servicePrice ?? '300 ₪',
                          fontWeight: FontWeight.bold,
                          style: appTextStyles.h2StyleBlack(),
                          marginBottom: 0.015,
                        )
                      : const SizedBox(),
                ),
            ],
          ),
          if (!ahmService)
            if (isCarSafe)
              Positioned(
                bottom: 0,
                left: isRTL ? 0 : null,
                right: isRTL ? null : 0,
                child: CommonContainer(
                  backgroundColor:
                      Color(AppColors.greyLightBorder).withOpacity(0.6),
                  paddingHorizontal: 0.02,
                  paddingVertical: 0.01,
                  topLeftRadius: 0.02,
                  topRightRadius: 0.02,
                  child: SvgPicture.asset(
                    iconSafety,
                    width: DEVICE_WIDTH * 0.03,
                    height: DEVICE_HEIGHT * 0.03,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

//SvgPicture.asset(iconSafety),
class TitleDetails extends StatelessWidget {
  const TitleDetails({
    required this.titleName,
    required this.titleDetails,
    required this.iconPath,
    this.bgClrIcon,
    this.width = 0.46,
    this.iconSize = 0.13,
    this.iconMarginTop = 0.0,
    Key? key,
  }) : super(key: key);

  final String? titleName;
  final String? titleDetails;
  final String iconPath;
  final double? width;
  final int? bgClrIcon;
  final double iconSize;
  final double? iconMarginTop;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleContainer(
          marginTop: iconMarginTop,
          iconWidget: SvgPicture.asset(
            iconPath,
            height: DEVICE_HEIGHT * 0.04,
            width: DEVICE_WIDTH * 0.04,
          ),
          backgroundColor: bgClrIcon ?? AppColors.greyLight,
          circuitSize: iconSize,
          contentPadding: 0.012,
        ),
        CommonText(
          titleName ?? 'winch_service'.tr,
          rowMainAxisSize: MainAxisSize.max,
          textAlign: TextAlign.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          containerStyle: CommonContainerModel(
            width: width,
            marginTop: 0.006,
            marginHorizontal: 0.015,
          ),
          bottomChild: CommonText(
            titleDetails ?? '07:00AM  25/8/2022',
            fontSize: fontH3,
            fontColor: AppColors.greyDark,
            marginTop: 0.005,
          ),
        ),
      ],
    );
  }
}
