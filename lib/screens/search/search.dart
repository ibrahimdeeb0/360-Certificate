import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class AppSearching extends StatelessWidget {
  const AppSearching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AppSearchingController>(
        init: AppSearchingController(),
        builder: (AppSearchingController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: Column(
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CommonContainer(
                      onPress: Get.back,
                      alignment: AlignmentDirectional.center,
                      paddingTop: 0.02,
                      touchEffect: TouchableEffect(type: TouchTypes.opacity),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 26,
                      ),
                    ),
                    CommonInput(
                      hint: 'Search for certificate, customer',
                      width: 0.85,
                      marginLeft: 0.04,
                      marginTop: 0.02,
                      controller: controller.searchController,
                      onChanged: controller.onSearching,
                      prefix: SvgPicture.asset(
                        iconSearch,
                        color: Colors.black,
                      ),
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
                    ),
                  ],
                ),
                // CommonButton(
                //   marginVertical: 0.02,
                //   onPress: () {
                //     consoleLog(controller.searchResult);
                //   },
                // ),
                if ((controller.listCerts != null) &&
                    (controller.listCustomers != null))
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          0.04.boxHeight,
                          ...controller.listCerts
                              .map(
                                (dynamic item) => SearchResultCard(
                                  title: '# ${item[keyId]}',
                                  onPress: () => Get.toNamed(
                                    routeCertificateDetails,
                                    arguments: <String, dynamic>{
                                      keyId: item[keyId],
                                    },
                                  ),
                                  iconPath: iconCertificates,
                                ),
                              )
                              .toList(),
                          ...controller.listCustomers
                              .map(
                                (dynamic item) => SearchResultCard(
                                  onPress: () => Get.toNamed(
                                    routeCustomerProfile,
                                    arguments: <String, dynamic>{
                                      keyId: item[keyId],
                                    },
                                  ),
                                  title: item[keyName],
                                ),
                              )
                              .toList(),
                          if ((controller.listCerts.isEmpty) &&
                              controller.listCustomers.isEmpty)
                            CommonText(
                              'There is no result found',
                              fontColor: AppColors.primary,
                              marginVertical: 0.04,
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

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({
    super.key,
    this.title,
    this.iconPath,
    this.onPress,
  });

  final String? title;
  final String? iconPath;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress,
      marginBottom: 0.04,
      paddingHorizontal: 0.01,
      touchEffect: TouchableEffect(type: TouchTypes.opacity),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonText(
            title ?? '',
            marginHorizontal: 0.02,
            fontSize: fontTitle,
            fontColor: AppColors.primary,
            // fontWeight: FontWeight.bold,
            leftChild: SvgPicture.asset(
              iconPath ?? iconPerson,
              color: Color(AppColors.primary),
              height: 0.025.flexHeight,
              width: 0.025.flexWidth,
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.grey,
            size: (0.02.flexHeight + 0.02.flexWidth),
          ),
        ],
      ),
    );
  }
}
