import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Get.toNamed(routeCreateCustomerV2);
      //     Get.toNamed(routeSearchForCustomer);
      //     // Get.to(() => const Invoices());
      //   },
      // ),
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
                CommonButton(
                  onPress: () {
                    Get.toNamed(
                      routeCompleteProfile,
                      arguments: <String, dynamic>{
                        keyEmail: 'test@emaio.com',
                        'f_name': 'first name',
                        'l_name': 'last Name',
                      },
                    );
                  },
                ),
                const HomeSearchBar(),
                Expanded(
                  child: SingleChildScrollView(
                    controller: certificatesController.scrollController,
                    // physics: const BouncingScrollPhysics(),
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
                        CommonButton(
                          text: 'Complete Register',
                          onPress: () => Get.to(const CompleteRegister()),
                          marginHorizontal: 0.04,
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
