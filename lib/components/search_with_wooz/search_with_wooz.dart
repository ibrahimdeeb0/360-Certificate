import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class SearchWithWooz extends StatelessWidget {
  const SearchWithWooz({
    required this.searchWithWoozController,
    super.key,
  });

  final SearchWithWoozController searchWithWoozController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchWithWoozController>(
      init: searchWithWoozController,
      global: false,
      builder: (SearchWithWoozController controller) {
        return SearchAddressContainer(
          controller: controller,
          onTap: () {
            Get.bottomSheet(
              SearchSelectedAddress(
                searchWithWoozController: searchWithWoozController,
              ),
              isScrollControlled: true,
            );
          },
        );
      },
    );
  }
}

class SearchSelectedAddress extends StatelessWidget {
  const SearchSelectedAddress({
    required this.searchWithWoozController,
    super.key,
  });

  final SearchWithWoozController searchWithWoozController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchWithWoozController>(
      init: searchWithWoozController,
      builder: (SearchWithWoozController controller) {
        // FocusScope.of(context).requestFocus(controller.focusNode2);
        return BottomSheetContainer(
          responsiveContent: true,
          title: 'Search address',
          child: Column(
            children: <Widget>[
              SizedBox(
                height: DEVICE_HEIGHT * 0.02,
              ),
              CommonInput(
                hint: 'Enter address or city or postal code',
                controller: controller.addressController,
                onChanged: controller.onSearchingAddress,
                // focusNode: controller.focusNode2,
                keyboardType: TextInputType.streetAddress,
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.02,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: controller.listAddress == null
                      ? const Center(
                          child: CommonText('...'),
                        )
                      : controller.listAddress!.isNotEmpty
                          ? Column(
                              children: <Widget>[
                                ...controller.listAddress!
                                    .map(
                                      (dynamic element) => ListOfStrings(
                                        name: element['description'],
                                        onPress: () =>
                                            controller.onSelectAddress(
                                          address: element,
                                          controller: searchWithWoozController,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ],
                            )
                          : CommonText(
                              'No Address Existing',
                              style: appTextStyles.h3GreyStyle(),
                              containerStyle:
                                  const CommonContainerModel(marginTop: 0.1),
                            ),
                ),
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.01,
              ),
            ],
          ),
        );
      },
    );
  }
}

class SearchingFullAddress extends StatelessWidget {
  const SearchingFullAddress({
    required this.searchWithWoozController,
    super.key,
  });

  final SearchWithWoozController searchWithWoozController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchWithWoozController>(
      init: searchWithWoozController,
      global: false,
      builder: (SearchWithWoozController controller) {
        return BottomSheetContainer(
          title: 'More Details',
          child: Column(
            children: <Widget>[
              SizedBox(height: DEVICE_HEIGHT * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: controller.searchAllAddress == null
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Color(AppColors.primary),
                          ),
                        )
                      : controller.searchAllAddress!.isNotEmpty
                          ? Column(
                              children: <Widget>[
                                ...controller.searchAllAddress!
                                    .map(
                                      (dynamic element) => ListOfStrings(
                                          name: element['description'],
                                          onPress: () {
                                            controller.onGetAddressDetails(
                                              publicId: element['public_id'],
                                              addressType: 'postal_code',
                                              controller:
                                                  searchWithWoozController,
                                            );
                                            Get.back();
                                          }),
                                    )
                                    .toList(),
                              ],
                            )
                          : CommonText(
                              'No Address Existing',
                              style: appTextStyles.h3GreyStyle(),
                              containerStyle:
                                  const CommonContainerModel(marginTop: 0.1),
                            ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SearchAddressContainer extends StatelessWidget {
  const SearchAddressContainer({
    required this.controller,
    this.focusNode,
    this.onTap,
    super.key,
  });

  final SearchWithWoozController controller;
  final Function()? onTap;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 0.69.flexHeight,
      width: 1.flexWidth,
      // color: Colors.blueGrey,
      child: Column(
        children: <Widget>[
          CommonInput(
            hint: 'Type The Postcode Of The Property',
            prefix: SvgPicture.asset(iconSearch),
            marginTop: 0.025,
            controller: controller.addressController,
            enabled: false,
            onTap: onTap,
            focusNode: focusNode,
          ),
          CommonContainer(
            width: 1,
            marginVertical: 0.01,
            height: 0.002,
            backgroundColor: Colors.grey[400],
          ),
          CommonInput(
            topLabelText: 'Street No  & Name',
            value: controller.bodyData[keyStreet] ?? '',
          ),
          CommonInput(
            topLabelText: 'City',
            value: controller.bodyData[keyCity] ?? '',
          ),
          CommonInput(
            topLabelText: 'State/Province',
            value: controller.bodyData[keyState] ?? '',
          ),
          CommonInput(
            topLabelText: 'Postcode',
            value: controller.bodyData[keyPostcode] ?? '',
          ),
          CommonInput(
            topLabelText: 'Country',
            value: controller.bodyData[keyCountry] ?? '',
          ),
        ],
      ),
    );
  }
}
