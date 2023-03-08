import '../../general_exports.dart';

class RadioButtonYesNo extends StatelessWidget {
  const RadioButtonYesNo({
    Key? key,
    this.onTapYes,
    this.onTapNo,
    this.isSelect = true,
  }) : super(key: key);
  final Function? onTapYes;
  final Function? onTapNo;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CommonText(
          'Yes',
          onPress: onTapYes,
          fontSize: fontH3,
          fontColor: isSelect ? AppColors.primary : AppColors.grey,
          marginLeft: 0.015,
          leftChild: Icon(
            isSelect ? Icons.radio_button_checked : Icons.radio_button_off,
            color: Color(
              isSelect ? AppColors.primary : AppColors.grey,
            ),
          ),
          containerStyle: CommonContainerModel(
            touchEffect: TouchableEffect(
              type: TouchTypes.scaleAndUp,
            ),
          ),
        ),
        SizedBox(width: DEVICE_WIDTH * 0.1),
        CommonText(
          'No',
          onPress: onTapNo,
          fontSize: fontH3,
          fontColor: !isSelect ? AppColors.primary : AppColors.grey,
          marginLeft: 0.015,
          leftChild: Icon(
            !isSelect ? Icons.radio_button_checked : Icons.radio_button_off,
            color: Color(
              !isSelect ? AppColors.primary : AppColors.grey,
            ),
          ),
          containerStyle: CommonContainerModel(
            touchEffect: TouchableEffect(
              type: TouchTypes.scaleAndUp,
            ),
          ),
        ),
      ],
    );
  }
}

class TopLabelText extends StatelessWidget {
  const TopLabelText({
    Key? key,
    this.text,
    this.isRequired = true,
    this.enabled = true,
  }) : super(key: key);

  final String? text;
  final bool isRequired;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text ?? '',
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      marginRight: 0.01,
      fontColor: enabled ? Colors.black : COMMON_GREY_COLOR,
      containerStyle: const CommonContainerModel(
        marginVertical: 0.01,
      ),
      rightChild: isRequired
          ? const Icon(
              Icons.star,
              color: Colors.red,
              size: 12,
            )
          : const SizedBox(),
    );
  }
}

class SelectTypeBT extends StatelessWidget {
  const SelectTypeBT({
    required this.listTitles,
    required this.controller,
    this.title,
    super.key,
  });
  final String? title;
  final List<String> listTitles;
  final CreateCustomerController controller;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: title ?? 'Select',
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: DEVICE_HEIGHT * 0.03),
            ...listTitles
                .map(
                  (String title) => CommonText(
                    title,
                    onPress: () {
                      if (controller.currentIndex == 0) {
                        controller.selectedCustomerType = title;
                        controller.update();
                      } else if (controller.currentIndex == 1) {
                        controller.selectedClientContactType = title;
                        controller.update();
                      } else if (controller.currentIndex == 3) {
                        controller.selectedClientTypeOnSiteContact = title;
                        controller.update();
                      }
                      hideKeyboard();
                      Get.back();
                    },
                    fontColor: AppColors.primary,
                    textAlign: TextAlign.center,
                    containerStyle: CommonContainerModel(
                      alignment: AlignmentDirectional.center,
                      width: 1,
                      backgroundColor:
                          Color(AppColors.primary).withOpacity(0.1),
                      borderRadius: 0.02,
                      paddingVertical: 0.02,
                      marginBottom: 0.02,
                      touchEffect: TouchableEffect(type: TouchTypes.opacity),
                    ),
                  ),
                )
                .toList(),
            SizedBox(height: DEVICE_HEIGHT * 0.01),
          ],
        ),
      ),
    );
  }
}

class SelectPaymentTerm extends StatelessWidget {
  const SelectPaymentTerm({
    this.title,
    super.key,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: title ?? 'Select Payment Term',
      responsiveContent: true,
      child: GetBuilder<CreateCustomerController>(
        init: CreateCustomerController(),
        builder: (CreateCustomerController controller) {
          return SingleChildScrollView(
            child: controller.allPaymentTerms.isNotEmpty
                ? Column(
                    children: <Widget>[
                      SizedBox(height: DEVICE_HEIGHT * 0.03),
                      ...controller.allPaymentTerms.map(
                        (dynamic paymentTerms) => ListOfStrings(
                          name: paymentTerms['name'],
                          onPress: () {
                            controller.selectedPaymentTerms = paymentTerms;
                            controller.paymentTerm = paymentTerms['name'];
                            Get.back();
                            controller.update();
                            consoleLog(controller.selectedPaymentTerms);
                          },
                        ),
                      ),
                      SizedBox(height: DEVICE_HEIGHT * 0.01),
                    ],
                  )
                : CommonContainer(
                    paddingTop: 0.1,
                    paddingBottom: 0.1,
                    width: 1,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Color(AppColors.primary),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class SearchFullAddressBottomSheet extends StatelessWidget {
  const SearchFullAddressBottomSheet({
    required this.iDTitle,
    Key? key,
  }) : super(key: key);

  final int iDTitle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerController>(
      init: CreateCustomerController(),
      builder: (CreateCustomerController controller) {
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
                                              iDTitle: iDTitle,
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

class SearchAddressBottomSheet extends StatelessWidget {
  const SearchAddressBottomSheet({
    required this.iDTitle,
    Key? key,
  }) : super(key: key);

  final int iDTitle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerController>(
      init: CreateCustomerController(),
      builder: (CreateCustomerController controller) {
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
                hint: 'Enter address or city or postal code',
                controller: controller.searchAddressController,
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
                                        onPress: () =>
                                            controller.onSelectAddress(
                                          iDTitle: iDTitle,
                                          address: element,
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
            ],
          ),
        );
      },
    );
  }
}
