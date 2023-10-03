import '../../general_exports.dart';

class SearchWithWooz extends StatelessWidget {
  const SearchWithWooz({
    required this.searchWithWoozController,
    this.isExpandable,
    this.hideSearchField = false,
    // this.isIndividualSite = true,
    super.key,
  });

  final SearchWithWoozController searchWithWoozController;
  final bool? isExpandable;
  final bool hideSearchField;
  // final bool isIndividualSite;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchWithWoozController>(
      init: searchWithWoozController,
      global: false,
      builder: (SearchWithWoozController controller) {
        // controller.isIndividualSite = isIndividualSite;
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (!hideSearchField)
                if (!(controller.isManualAddressEntry))
                  CommonInput(
                    hint: 'Please start typing the address',
                    prefix: SvgIconHelper(
                      iconPath: iconSearch,
                      color: Color(AppColors.primary),
                    ),
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
                  ),
              if (isExpandable ?? controller.isExpandedDetails)
                CommonContainer(
                  marginTop: !(controller.isManualAddressEntry) ? 0.015 : 0,
                  borderTopWidth: !(controller.isManualAddressEntry) ? 2 : 0,
                  borderTopColor: Colors.grey[400],
                  child: Column(
                    children: <Widget>[
                      if (controller.isManualAddressEntry)
                        toggleManualSwitch(controller),
                      CommonInput(
                        topLabel: const TopLabelText(
                          text: 'Street No  & Name',
                          isRequired: true,
                        ),
                        value: controller.listAddressData[0].street,
                        enabled: controller.isManualAddressEntry,
                        controller: controller.isManualAddressEntry
                            ? controller.entryStreetController
                            : null,
                        onChanged: controller.onChangeInputs,
                      ),
                      CommonInput(
                        topLabel: const TopLabelText(
                          text: 'City',
                          isRequired: true,
                        ),
                        value: controller.listAddressData[0].city,
                        enabled: controller.isManualAddressEntry,
                        controller: controller.isManualAddressEntry
                            ? controller.entryCityController
                            : null,
                        onChanged: controller.onChangeInputs,
                      ),
                      CommonInput(
                        topLabel: const TopLabelText(
                          text: 'State/Province',
                          isRequired: true,
                        ),
                        value: controller.listAddressData[0].state,
                        enabled: controller.isManualAddressEntry,
                        controller: controller.isManualAddressEntry
                            ? controller.entryStateController
                            : null,
                        onChanged: controller.onChangeInputs,
                      ),
                      CommonInput(
                        topLabel: const TopLabelText(
                          text: 'Postcode',
                          isRequired: true,
                        ),
                        value: controller.listAddressData[0].postcode,
                        enabled: controller.isManualAddressEntry,
                        controller: controller.isManualAddressEntry
                            ? controller.entryPostcodeController
                            : null,
                        onChanged: controller.onChangeInputs,
                      ),
                      CommonInput(
                        topLabel: const TopLabelText(
                          text: 'Country',
                          isRequired: true,
                        ),
                        value: controller.listAddressData[0].country,
                        enabled: false,
                        // enabled: controller.isManualAddressEntry,
                        controller: controller.isManualAddressEntry
                            ? controller.entryCountryController
                            : null,
                        onChanged: controller.onChangeInputs,
                      ),
                      // show switch if false
                      if (!controller.isManualAddressEntry)
                        toggleManualSwitch(controller),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  CommonText toggleManualSwitch(SearchWithWoozController controller) {
    return CommonText(
      'Manual Address Entry',
      fontSize: fontH2,
      rowMainAxisSize: MainAxisSize.max,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      rightChild: Switch(
        value: controller.isManualAddressEntry,
        onChanged: (bool value) {
          controller.toggleManualAddressEntry(value: value);
        },
        activeColor: Colors.green,
      ),
    );
  }
}
