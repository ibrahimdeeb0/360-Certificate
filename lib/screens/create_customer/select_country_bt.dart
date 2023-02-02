import '../../general_exports.dart';

class SelectCountry1 extends StatelessWidget {
  const SelectCountry1({
    this.title,
    super.key,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: title ?? 'Select Country',
      responsiveContent: true,
      child: GetBuilder<CreateCustomerController>(
        init: CreateCustomerController(),
        builder: (CreateCustomerController controller) {
          return SingleChildScrollView(
            child: controller.filterAllCountries != null
                ? Column(
                    children: <Widget>[
                      SizedBox(height: DEVICE_HEIGHT * 0.02),
                      CommonInput(
                        hint: 'Enter Country Name',
                        onChanged: controller.onSearchCountries,
                        controller: controller.searchCustomerCountryController,
                      ),
                      SizedBox(height: DEVICE_HEIGHT * 0.02),
                      ...controller.filterAllCountries!.map(
                        (dynamic country) => ListOfStrings(
                          name: country[keyName],
                          onPress: () {
                            controller.customerSelectedCountry = country;
                            hideKeyboard();
                            controller.update();
                            Get.back();
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

class SelectCountry2 extends StatelessWidget {
  const SelectCountry2({
    this.title,
    super.key,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: title ?? 'Select Country',
      responsiveContent: true,
      child: GetBuilder<CreateCustomerController>(
        init: CreateCustomerController(),
        builder: (CreateCustomerController controller) {
          return SingleChildScrollView(
            child: controller.filterBillingCountries != null
                ? Column(
                    children: <Widget>[
                      SizedBox(height: DEVICE_HEIGHT * 0.02),
                      CommonInput(
                        hint: 'Enter Country Name',
                        onChanged: controller.onSearchBillingCountries,
                        controller:
                            controller.searchCustomerBillingCountryController,
                      ),
                      SizedBox(height: DEVICE_HEIGHT * 0.02),
                      ...controller.filterBillingCountries!.map(
                        (dynamic country) => ListOfStrings(
                          name: country[keyName],
                          onPress: () {
                            controller.billingSelectedCountry = country;
                            hideKeyboard();
                            controller.update();
                            Get.back();
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

class SelectCountry3 extends StatelessWidget {
  const SelectCountry3({
    this.title,
    super.key,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: title ?? 'Select Country',
      responsiveContent: true,
      child: GetBuilder<CreateCustomerController>(
        init: CreateCustomerController(),
        builder: (CreateCustomerController controller) {
          return SingleChildScrollView(
            child: controller.filterSiteAddressCountries != null
                ? Column(
                    children: <Widget>[
                      SizedBox(height: DEVICE_HEIGHT * 0.02),
                      CommonInput(
                        hint: 'Enter Country Name',
                        onChanged: controller.onSearchSiteAddressCountries,
                        controller:
                            controller.searchSiteAddressCountryController,
                      ),
                      SizedBox(height: DEVICE_HEIGHT * 0.02),
                      ...controller.filterSiteAddressCountries!.map(
                        (dynamic country) => ListOfStrings(
                          name: country[keyName],
                          onPress: () {
                            controller.siteAddressSelectedCountry = country;
                            hideKeyboard();
                            controller.update();
                            Get.back();
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
