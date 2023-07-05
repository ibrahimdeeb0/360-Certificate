import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class SearchWithWooz extends StatelessWidget {
  const SearchWithWooz({
    required this.searchWithWoozController,
    this.focusNode,
    this.onTap,
    this.pressSeeLess,
    this.isExpandable,
    this.isLess = false,
    this.showJustOneSite = false,
    this.isIndividualSite = true,
    super.key,
  });

  final SearchWithWoozController searchWithWoozController;
  final Function()? onTap;
  final Function()? pressSeeLess;
  final FocusNode? focusNode;
  final bool? isExpandable;
  final bool isLess;
  final bool showJustOneSite;
  final bool isIndividualSite;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchWithWoozController>(
      init: searchWithWoozController,
      global: false,
      builder: (SearchWithWoozController controller) {
        controller.isIndividualSite = isIndividualSite;
        return SingleChildScrollView(
          child: isIndividualSite
              ? Column(
                  children: <Widget>[
                    CommonInput(
                      hint: 'Type The Postcode Of The Property',
                      prefix: SvgPicture.asset(
                        iconSearch,
                        color: Color(AppColors.primary),
                      ),
                      // marginBottom: 0.02,
                      controller: controller.addressController,
                      enabled: false,
                      onTap: () {
                        Get.bottomSheet(
                          SearchSelectedAddress(
                            searchWithWoozController: searchWithWoozController,
                          ),
                          isScrollControlled: true,
                        );
                      },
                      focusNode: focusNode,
                    ),
                    if (isExpandable ?? controller.isExpandedDetails)
                      CommonContainer(
                        borderTopWidth: 2,
                        borderTopColor: Colors.grey[400],
                        paddingVertical: 0.01,
                        marginTop: 0.015,
                        child: Column(
                          children: <Widget>[
                            CommonInput(
                              topLabelText: 'Street No  & Name',
                              value: controller.listAddressData[0].street,
                              enabled: false,
                            ),
                            CommonInput(
                              topLabelText: 'City',
                              value: controller.listAddressData[0].city,
                              enabled: false,
                            ),
                            CommonInput(
                              topLabelText: 'State/Province',
                              value: controller.listAddressData[0].state,
                              enabled: false,
                            ),
                            CommonInput(
                              topLabelText: 'Postcode',
                              value: controller.listAddressData[0].postcode,
                              enabled: false,
                            ),
                            CommonInput(
                              topLabelText: 'Country',
                              value: controller.listAddressData[0].country,
                              enabled: false,
                            ),
                          ],
                        ),
                      ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    if (controller.listAddressData.isNotEmpty)
                      if (!showJustOneSite)
                        CommonText(
                          'Add Another Site',
                          onPress: () {
                            Get.bottomSheet(
                              TypeSiteNemSheet(controller: controller),
                              isScrollControlled: true,
                            );
                          },
                          rightChild:
                              const Icon(Icons.add_circle_outline_sharp),
                          rowMainAxisSize: MainAxisSize.max,
                          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                          containerStyle: appContainerStyles.cardStyle.copyWith(
                            touchEffect:
                                TouchableEffect(type: TouchTypes.opacity),
                          ),
                        )
                      else
                        const SizedBox()
                    else
                      CommonContainer(
                        width: 1,
                        backgroundColor: Colors.grey.withOpacity(0.25),
                        paddingHorizontal: 0.04,
                        paddingVertical: 0.015,
                        borderRadius: 0.02,
                        marginBottom: 0.02,
                        child: CommonInput(
                          hint: 'Type The Postcode Of The Property',
                          prefix: SvgPicture.asset(
                            iconSearch,
                            color: Color(AppColors.primary),
                          ),
                          marginBottom: 0,
                          // controller: controller.addressController,
                          enabled: false,
                          onTap: () {
                            Get.bottomSheet(
                              SearchSelectedAddress(
                                searchWithWoozController:
                                    searchWithWoozController,
                              ),
                              isScrollControlled: true,
                            );
                          },
                          focusNode: focusNode,
                        ),
                      ),
                    if (controller.listAddressData.isNotEmpty)
                      CommonContainer(
                        style: appContainerStyles.cardStyle,
                        paddingVertical: 0.0,
                        child: Column(
                          children: <Widget>[
                            if (controller.listAddressData.length > 1)
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    overlayColor:
                                        MaterialStatePropertyAll<Color>(
                                  Colors.grey.withOpacity(0.2),
                                )),
                                child: CommonText(
                                  isLess ? 'See Your Sites  ' : 'See Less',
                                  fontWeight: FontWeight.bold,
                                  fontColor: AppColors.primary,
                                  marginHorizontal: 0.02,
                                  rightChild: Icon(
                                    isLess
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_up,
                                    size: 0.025.flexAll,
                                    color: Color(AppColors.primary),
                                  ),
                                ),
                              ),
                            if (controller.isExpandedDetails)
                              if (!isLess)
                                ...controller.listAddressData.map(
                                  (AddressData item) =>
                                      DisplayAddressDataContainer(
                                    siteName:
                                        item.siteName.toString().capitalize ??
                                            '',
                                    street: item.street,
                                    city: item.city,
                                    state: item.state,
                                    postcode: item.postcode,
                                    country: item.country,
                                    isOneItem:
                                        controller.listAddressData.length < 2,
                                  ),
                                )
                              else
                                DisplayAddressDataContainer(
                                  siteName:
                                      controller.listAddressData[0].siteName,
                                  street: controller.listAddressData[0].street,
                                  city: controller.listAddressData[0].city,
                                  state: controller.listAddressData[0].state,
                                  postcode:
                                      controller.listAddressData[0].postcode,
                                  country:
                                      controller.listAddressData[0].country,
                                  isOneItem:
                                      controller.listAddressData.length < 2,
                                ),
                          ],
                        ),
                      ),
                  ],
                ),
        );
      },
    );
  }
}

class DisplayAddressDataContainer extends StatelessWidget {
  const DisplayAddressDataContainer({
    super.key,
    this.siteName,
    this.street,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.isOneItem = true,
  });
  final String? siteName;
  final String? street;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;
  final bool isOneItem;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      width: 1,
      paddingVertical: 0.015,
      borderTopWidth: isOneItem ? 0 : 2,
      borderTopColor: Colors.grey.withOpacity(0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonText(
            'Site Name - ',
            rightChild: CommonText(
              siteName ?? '',
              fontColor: Colors.orange[700],
              marginHorizontal: 0.01,
            ),
          ),
          0.02.boxHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              LabelItemText(
                title: 'Street No  & Name',
                subTitle: street ?? '',
              ),
              LabelItemText(
                title: 'City',
                subTitle: city ?? '',
                width: 0.26.flexWidth,
              ),
            ],
          ),
          0.02.boxHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              LabelItemText(
                title: 'State/Province',
                subTitle: state ?? '',
              ),
              LabelItemText(
                title: 'Postcode',
                subTitle: postcode ?? '',
                width: 0.26.flexWidth,
              ),
            ],
          ),
          0.02.boxHeight,
          LabelItemText(
            title: 'Country',
            subTitle: country ?? '',
          ),
        ],
      ),
    );
  }
}

class LabelItemText extends StatelessWidget {
  const LabelItemText({
    super.key,
    this.title,
    this.subTitle,
    this.width,
  });

  final String? title;
  final String? subTitle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      title ?? '',
      fontColor: Colors.grey[700],
      fontSize: fontH3,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      marginBottom: 0.005,
      bottomChild: Container(
        // color: Colors.green,
        width: width ?? 0.45.flexWidth,
        alignment: AlignmentDirectional.centerStart,
        child: CommonText(
          subTitle,
        ),
      ),
    );
  }
}

class TypeSiteNemSheet extends StatelessWidget {
  const TypeSiteNemSheet({
    required this.controller,
    super.key,
  });
  final SearchWithWoozController controller;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      responsiveContent: true,
      title: 'Site Name',
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            0.03.boxHeight,
            CommonInput(
              hint: 'type site name',
              controller: controller.siteNameController,
              marginBottom: 0.03,
            ),
            CommonButton(
              onPress: () {
                Get.bottomSheet(
                  SearchSelectedAddress(
                    searchWithWoozController: controller,
                  ),
                  isScrollControlled: true,
                );
              },
              text: 'Next To Select Address',
            ),
            0.03.boxHeight,
          ],
        ),
      ),
    );
  }
}
