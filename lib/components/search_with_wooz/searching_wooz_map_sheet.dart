import '../../general_exports.dart';

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
                          child: CommonText(
                            'Please Type in box for searching...',
                            marginTop: 0.1,
                          ),
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
                child: RawScrollbar(
                  thumbColor: Colors.grey[400],
                  // crossAxisMargin: 1.0,
                  radius: const Radius.circular(20),
                  thickness: 4,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
