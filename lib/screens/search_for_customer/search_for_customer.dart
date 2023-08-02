import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class SearchForCustomer extends StatelessWidget {
  const SearchForCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Select Customer',
      ),
      body: GetBuilder<SearchForCustomerController>(
        init: SearchForCustomerController(),
        builder: (SearchForCustomerController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            paddingHorizontal: 0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'You can search by ( Name, Phone, Postcode )',
                    fontColor: Colors.grey[600],
                    marginBottom: 0.01,
                    marginTop: 0.02,
                    marginHorizontal: 0.04,
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomShadowStyle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonInput(
                          hint: 'Search for customer',
                          width: 0.77,
                          controller: controller.searchController,
                          onChanged: controller.onSearching,
                          keyboardType: TextInputType.streetAddress,
                          prefix: SvgPicture.asset(
                            iconSearch,
                            color: Colors.black,
                          ),
                          fillColor: AppColors.greyInputs,
                        ),
                        CommonContainer(
                          onPress: () {
                            Get.toNamed(routeCreateCustomerV2);
                          },
                          alignment: AlignmentDirectional.center,
                          backgroundColor: AppColors.greyInputs,
                          borderRadius: 0.02,
                          width: 0.14,
                          height: 0.055,
                          touchEffect:
                              TouchableEffect(type: TouchTypes.scaleAndUp),
                          child: Icon(
                            Icons.add,
                            size: 0.02.flexAll,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // if (controller.showMessageSearch)
                  //   const NoResultSearchingContainer(
                  //     title: 'Please use box for searching',
                  //     hideAddCustomer: true,
                  //   )
                  // else
                  if (controller.showMessageNoResult)
                    const NoResultSearchingContainer()
                  else
                    ...controller.searchResult.map(
                      (dynamic item) => CustomerSearchResultContainer(
                        pressAddSite: () {
                          Get.to(
                            () => const AddNewSite(),
                            arguments: <String, dynamic>{
                              keyId: item['customer_id'],
                            },
                          );
                          // consoleLog(item);
                        },
                        customerData: item,
                        type: item['type'].contains('landlord')
                            ? CustomerType.individual
                            : CustomerType.company,
                        name: item['f_name'],
                        email: item['email'] ?? 'email test',
                        phone: item['phone'] ?? 'phone test',
                        listSites: item['customer']['sites'] ?? <dynamic>[],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
