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
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Get.to(Subscription());
      // }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
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
                    controller: certificatesController.scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (controller.showFreeAlert)
                          CommonContainer(
                            backgroundColor:
                                Color(AppColors.orange).withOpacity(0.2),
                            width: 1,
                            paddingLeft: 0.04,
                            paddingRight: 0.02,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.timer_outlined,
                                  color: Colors.orange[700],
                                ),
                                CommonText(
                                  '${controller.trialDetails['remaining_days'] ?? 0} Days until your trial ends',
                                  marginHorizontal: 0.01,
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Get.toNamed(routeSubscription);
                                    controller.getUrlSubscription();
                                  },
                                  child: CommonText(
                                    'Upgrade',
                                    fontColor: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                          'All Certificates',
                          marginTop: 0.01,
                          fontSize: fontH2,
                          marginHorizontal: 0.04,
                        ),
                        const Certificates(),
                        if (certificatesController.isLoading)
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 0.01.flexHeight,
                                bottom: 0.025.flexHeight,
                              ),
                              child: CircularProgressIndicator(
                                strokeWidth: 5,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(
                                    AppColors.primary,
                                  ),
                                ),
                              ),
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
      ),
    );
  }
}

class SubscribedMessageSheet extends StatelessWidget {
  const SubscribedMessageSheet({
    super.key,
    this.daysTrailer,
  });
  final int? daysTrailer;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            0.04.boxHeight,
            Center(
              child: SvgPicture.asset(iconCongratulations),
            ),
            const CommonText(
              'Congratulations!',
              fontWeight: FontWeight.bold,
              fontSize: fontH2,
              marginVertical: 0.015,
            ),
            CommonText(
              '',
              inlineSpans: <InlineSpan>[
                TextSpan(
                  text:
                      'You have successfully subscribed to the Gas package. You have ',
                  style: TextStyle(
                    fontFamily: fontFamilyType,
                    color: Colors.grey[700],
                  ),
                ),
                TextSpan(
                  text: '$daysTrailer remaining free days',
                  style: TextStyle(
                    fontFamily: fontFamilyType,
                    color: Colors.orange[700],
                  ),
                ),
                TextSpan(
                  text:
                      ', and the subscription will be activated automatically after the free period ends.',
                  style: TextStyle(
                    fontFamily: fontFamilyType,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            0.04.boxHeight,
          ],
        ),
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
                size: 0.12,
                boxShape: BoxShape.circle,
                child: IconButton(
                  onPressed: () => Get.bottomSheet(
                    const FilterCert(),
                    isScrollControlled: true,
                  ),
                  icon: SvgPicture.asset(
                    iconFilter,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
