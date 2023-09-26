import '../../../general_exports.dart';

class SearchFullAddressSetting extends StatelessWidget {
  const SearchFullAddressSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdatePostcodeController>(
      init: UpdatePostcodeController(),
      builder: (UpdatePostcodeController controller) {
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

class SearchAddressSetting extends StatelessWidget {
  const SearchAddressSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdatePostcodeController>(
      init: UpdatePostcodeController(),
      builder: (UpdatePostcodeController controller) {
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
                controller: controller.searchAddressController,
                hint: 'Enter the full postcode',
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
