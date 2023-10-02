import '../../general_exports.dart';

class SearchSelectedAddress extends StatefulWidget {
  const SearchSelectedAddress({
    required this.searchWithWoozController,
    super.key,
  });

  final SearchWithWoozController searchWithWoozController;

  @override
  State<SearchSelectedAddress> createState() => _SearchSelectedAddressState();
}

class _SearchSelectedAddressState extends State<SearchSelectedAddress> {
  FocusNode focusNode = FocusNode();

  @override
  void deactivate() {
    focusNode.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
    return GetBuilder<SearchWithWoozController>(
      init: widget.searchWithWoozController,
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
                hint: 'Enter the full postcode',
                controller: controller.addressController,
                onChanged: (String? value) {
                  controller.onSearchingAddress(value: value);
                },
                keyboardType: TextInputType.streetAddress,
                maxLength: 9,
                focusNode: focusNode,
                suffix: getIcon(
                  CommonIcon(
                    containerStyle: CommonContainerModel(
                      touchEffect:
                          TouchableEffect(type: TouchTypes.scaleAndFade),
                      size: 0.14,
                    ),
                    path: iconSearchBorder,
                    color: Colors.blue[800],
                    iconDataSize: 12.0,
                    onPress: () {
                      controller.onSearchingAddress(
                        value: controller.addressController.text.trim(),
                        isClicked: true,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.02,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: controller.listAddress == null
                      ? const Center(
                          child: CommonText(
                            'Please Type in box for searching..',
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
                                          controller:
                                              widget.searchWithWoozController,
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
