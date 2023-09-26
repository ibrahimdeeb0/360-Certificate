import '../../general_exports.dart';

class SearchFullAddress extends StatelessWidget {
  const SearchFullAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteProfileController>(
      init: CompleteProfileController(),
      builder: (CompleteProfileController controller) {
        return BottomSheetContainer(
          title: 'Address related Postcode',
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
                                          consoleLogPretty(element);
                                          controller.onGetAddressDetails(
                                            publicId: element['public_id'],
                                            addressType: 'postal_code',
                                          );
                                          Get.back();
                                        },
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
            ],
          ),
        );
      },
    );
  }
}

class SearchAddress extends StatelessWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteProfileController>(
      init: CompleteProfileController(),
      builder: (CompleteProfileController controller) {
        return BottomSheetContainer(
          // responsiveContent: true,
          title: 'Search address',
          child: Column(
            children: <Widget>[
              SizedBox(
                height: DEVICE_HEIGHT * 0.02,
              ),
              CommonInput(
                onChanged: controller.onSearchingAddress,
                hint: 'Enter the full postcode',
                controller: controller.searchAddressController,
                keyboardType: TextInputType.streetAddress,
                maxLength: 9,
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.02,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: controller.listAddress == null
                      ? const Center()
                      : controller.listAddress!.isNotEmpty
                          ? Column(
                              children: <Widget>[
                                ...controller.listAddress!
                                    .map(
                                      (dynamic element) => ListOfStrings(
                                        name: element['description'],
                                        onPress: () => controller
                                            .onSelectAddress(address: element),
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
            ],
          ),
        );
      },
    );
  }
}
