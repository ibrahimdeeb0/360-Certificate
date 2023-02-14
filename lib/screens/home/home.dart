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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CommonContainer(
                    backgroundColor: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonContainer(
                          style: CommonContainerStyle().bottomShadow.copyWith(
                                shadowColor: COMMON_GREY_COLOR,
                                shadowOpacity: 0.1,
                                shadowSpreadRadius: .5,
                                shadowOffsetDY: 2,
                                shadowBlurRadius: 4,
                                backgroundColor: Colors.white,
                              ),
                          paddingBottom: 0.01,
                          child: CommonInput(
                            hint: 'Search for certificate, customer',
                            marginHorizontal: 0.04,
                            marginTop: 0.005,
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
                        ),
                        SizedBox(height: DEVICE_HEIGHT * 0.02),
                        CommonContainer(
                          style: appContainerStyles.containerStyles,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  HomeCards(
                                    onPress: () => Get.toNamed(
                                      routeSortCertificate,
                                      arguments: <String, dynamic>{
                                        keyTitle: 'Not Complete Certs',
                                        keyColor: AppColors.homeClr1,
                                      },
                                    ),
                                  ),
                                  HomeCards(
                                    onPress: () => Get.toNamed(
                                      routeSortCertificate,
                                      arguments: <String, dynamic>{
                                        keyTitle: 'Completed Certs',
                                        keyColor: AppColors.homeClr2,
                                      },
                                    ),
                                    title: '3',
                                    subTitle: 'Completed Certs',
                                    iconPath: iconPendingCerts,
                                    bgColor: AppColors.homeClr2,
                                  ),
                                ],
                              ),
                              HomeCards(
                                title: '19',
                                subTitle: 'Outstanding Invoices',
                                iconPath: iconOutInvoices,
                                bgColor:
                                    Color(AppColors.primary).withOpacity(0.2),
                                width: 1,
                              ),
                              const CommonText(
                                'All Invoices',
                                marginTop: 0.01,
                                fontSize: fontH2,
                              ),
                              const CommonText(
                                'There is no invoices',
                                fontSize: fontH2,
                                containerStyle: CommonContainerModel(
                                  marginTop: 0.12,
                                  width: 1,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // bottom bar height
                        SizedBox(height: DEVICE_HEIGHT * 0.072),
                      ],
                    ),
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

class HomeCards extends StatelessWidget {
  const HomeCards({
    super.key,
    this.title,
    this.subTitle,
    this.iconPath,
    this.width,
    this.bgColor,
    this.onPress,
  });

  final String? title;
  final String? subTitle;
  final String? iconPath;
  final double? width;
  final dynamic bgColor;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress,
      backgroundColor: bgColor ?? AppColors.homeClr1,
      width: width ?? 0.45,
      // height: 0.12,
      borderRadius: 0.06,
      paddingHorizontal: 0.02,
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
