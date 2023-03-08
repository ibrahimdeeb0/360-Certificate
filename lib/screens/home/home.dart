import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GetBuilder<HomeController>(
        init: homeController,
        builder: (HomeController controller) {
          return CommonContainer(
            height: 1,
            width: 1,
            backgroundColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const HomeSearchBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: DEVICE_HEIGHT * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: DEVICE_WIDTH * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              HomeCards(
                                onPress: () => Get.toNamed(
                                  routeUncompletedCert,
                                  arguments: <String, dynamic>{
                                    keyTitle: 'Not Completed Certs',
                                    keyColor: AppColors.homeClr2,
                                  },
                                ),
                                title: '${controller.countUnCompleteCert}',
                              ),
                              HomeCards(
                                onPress: () => Get.toNamed(
                                  routeCompletedCert,
                                  arguments: <String, dynamic>{
                                    keyTitle: 'Completed Certs',
                                    keyColor: AppColors.homeClr2,
                                  },
                                ),
                                title: '${controller.countCompleteCert}',
                                subTitle: 'Completed Certs',
                                iconPath: iconPendingCerts,
                                bgColor: AppColors.homeClr2,
                              ),
                            ],
                          ),
                        ),
                        const CommonText(
                          //
                          'All Certificates',
                          marginTop: 0.01,
                          fontSize: fontH2,
                          marginHorizontal: 0.04,
                        ),
                        const Certificates(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: appContainerStyles.bottomShadowStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonInput(
            hint: 'Search for certificate, customer',
            marginTop: 0.005,
            width: 0.8,
            prefix: SvgPicture.asset(
              iconSearch,
              color: Colors.black,
            ),
            enabled: false,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(DEVICE_WIDTH * 0.015),
              ),
              borderSide: BorderSide(
                color: getColorType(Colors.white),
                width: 1.5,
              ),
            ),
            fillColor: AppColors.greyInputs,
            onTap: () => Get.toNamed(routeSearch),
          ),
          GetBuilder<CertificatesController>(
            init: certificatesController,
            builder: (CertificatesController controller) {
              return CommonContainer(
                backgroundColor: Color(AppColors.primary).withOpacity(0.1),
                onPress: () => Get.bottomSheet(
                  const FilterCert(),
                  isScrollControlled: true,
                ),
                size: 0.1,
                padding: 0.01,
                boxShape: BoxShape.circle,
                touchEffect: TouchableEffect(type: TouchTypes.opacity),
                marginLeft: 0.01,
                child: SvgPicture.asset(
                  iconFilter,
                  color: Colors.black,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomeCards extends StatelessWidget {
  const HomeCards({
    super.key,
    this.title,
    this.subTitle,
    this.iconPath,
    this.width,
    this.bgColor,
    this.onPress,
    this.paddingHorizontal,
  });

  final String? title;
  final String? subTitle;
  final String? iconPath;
  final double? width;
  final dynamic bgColor;
  final Function? onPress;
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress,
      backgroundColor: bgColor ?? AppColors.homeClr1,
      width: width ?? 0.45,
      // height: 0.12,
      borderRadius: 0.06,
      paddingHorizontal: paddingHorizontal ?? 0.02,
      paddingVertical: 0.015,
      marginBottom: 0.015,
      touchEffect: TouchableEffect(
        type: TouchTypes.opacity,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonText(
            title ?? '8',
            fontColor: AppColors.primary,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rightChild: SvgPicture.asset(
              iconPath ?? iconOutCerts,
              width: DEVICE_WIDTH * 0.03,
              height: DEVICE_HEIGHT * 0.03,
              color: Color(AppColors.primary),
            ),
            containerStyle: const CommonContainerModel(
              width: 1,
              marginBottom: 0.01,
            ),
          ),
          CommonText(
            subTitle ?? 'Not Completed Certs',
            fontSize: fontTitle,
            fontColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
