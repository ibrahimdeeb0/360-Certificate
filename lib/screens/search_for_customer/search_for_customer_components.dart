import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class NoResultSearchingContainer extends StatelessWidget {
  const NoResultSearchingContainer({
    super.key,
    this.title,
    this.hideAddCustomer = false,
    this.icon,
  });

  final String? title;
  final bool hideAddCustomer;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      alignment: Alignment.center,
      marginTop: 0.13,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 50,
            child: icon ??
                SvgPicture.asset(
                  iconSearch,
                  width: 0.05.flexWidth,
                  height: 0.05.flexHeight,
                ),
          ),
          CommonText(
            title ?? 'No Result',
            fontSize: fontH1,
            marginTop: 0.02,
          ),
          if (!hideAddCustomer)
            CommonText(
              'Add New Customer',
              onPress: () {
                if (Get.isBottomSheetOpen!) {
                  Get.back();
                }
                Get.toNamed(routeCreateCustomerV2);
              },
              marginHorizontal: 0.01,
              fontColor: Colors.orange[800],
              leftChild: Icon(
                Icons.add,
                color: Colors.orange[800],
              ),
              containerStyle: CommonContainerModel(
                marginVertical: 0.02,
                touchEffect: TouchableEffect(
                  type: TouchTypes.scaleAndFade,
                  lowerBound: 0.8,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CustomerSearchResultContainer extends StatelessWidget {
  const CustomerSearchResultContainer({
    super.key,
    this.type = CustomerType.individual,
    this.customerData,
    this.name,
    this.phone,
    this.email,
    this.listSites,
    this.pressAddSite,
    this.pressShowSite,
  });
  final dynamic customerData;
  final CustomerType type;
  final String? name;
  final String? phone;
  final String? email;
  final List<dynamic>? listSites;
  final Function? pressAddSite;
  final Function? pressShowSite;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      marginHorizontal: 0.04,
      marginBottom: 0.02,
      paddingTop: 0.02,
      paddingBottom: 0.01,
      borderBottomWidth: 2,
      borderBottomColor: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomerInformationContainer(
            type: type,
            name: name,
            phone: phone,
            email: email,
          ),
          CommonText(
            'Add New Site',
            onPress: pressAddSite,
            marginHorizontal: 0.01,
            fontColor: Colors.orange[800],
            leftChild: Icon(
              Icons.add,
              color: Colors.orange[800],
            ),
            containerStyle: CommonContainerModel(
              marginVertical: 0.02,
              touchEffect: TouchableEffect(
                type: TouchTypes.scaleAndFade,
                lowerBound: 0.8,
              ),
            ),
          ),
          if (listSites != null)
            ...listSites!.map(
              (dynamic item) => SiteResultContainer(
                siteName: item['name'],
                postcode: item['postal_code'],
                onPress: () {
                  Get.bottomSheet(
                    ShowSiteDetailsSheet(
                      customerType: type,
                      customerData: customerData,
                      siteItem: item,
                    ),
                    isScrollControlled: true,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class ShowSiteDetailsSheet extends StatelessWidget {
  const ShowSiteDetailsSheet({
    required this.customerType,
    this.siteItem,
    this.customerData,
    super.key,
  });

  final dynamic customerData;
  final dynamic siteItem;
  final CustomerType customerType;

  @override
  Widget build(BuildContext context) {
    // consoleLog(customerItem);
    // if (allCountries
    //     .where((dynamic e) => e['name'] == addressData[keyCountry])
    //     .isNotEmpty) {
    //   selectedCountry = allCountries.firstWhereOrNull(
    //       (dynamic e) => e['name'] == addressData[keyCountry]);
    //   if (selectedCountry != null) {
    //     addressData[keyCountryId] = selectedCountry?[keyId];
    //   }
    // }
    return BottomSheetContainer(
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CommonText(
              'Confirm The Site ( Warehouse )',
              fontSize: fontH1,
              marginBottom: 0.03,
            ),
            CustomerInformationContainer(
              type: customerType,
              name: customerData['f_name'] ?? '',
              email: customerData['email'] ?? 'email test',
              phone: customerData['phone'] ?? 'email test',
            ),
            CommonContainer(
              width: 1,
              marginTop: 0.02,
              paddingTop: 0.02,
              borderTopWidth: 2,
              borderTopColor: Colors.grey.withOpacity(0.25),
              paddingHorizontal: 0.04,
              child: Column(
                children: <Widget>[
                  CertTitleItem(
                    title: 'Street No  & Name',
                    subTitle: siteItem['street_num'] ?? 'test',
                  ),
                  CertTitleItem(
                    title: 'City',
                    subTitle: siteItem['city'] ?? 'test',
                  ),
                  CertTitleItem(
                    title: 'State/Province',
                    subTitle: siteItem['state'] ?? 'test',
                  ),
                  CertTitleItem(
                    title: 'Postcode',
                    subTitle: siteItem['postal_code'] ?? 'test',
                  ),
                  const CertTitleItem(
                    title: 'Country',
                    subTitle: 'United Kingdom',
                  ),
                ],
              ),
            ),
            0.02.boxHeight,
            CommonButton(
              onPress: () {
                if (Get.isBottomSheetOpen!) {
                  Get.back();
                }
                myAppController.certFormInfo[keyCustomerId] =
                    customerData['customer_id'];
                myAppController.certFormInfo[keySiteId] = siteItem[keyId];

                consoleLog(myAppController.certFormInfo);

                //*  first back for close search screen
                //* second back for close select form screen

                Get
                  ..back()
                  ..back()
                  ..toNamed(
                    myAppController.certFormInfo[keyFormRoute],
                    arguments: <String, dynamic>{
                      formKeyFromCertificate: false,
                    },
                  );
              },
              text: 'Inspect',
              marginBottom: 0.015,
            ),
            TextButton(
              onPressed: () {
                hideKeyboard();
                Get.back();
              },
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll<Color>(
                  Colors.grey.withOpacity(0.3),
                ),
              ),
              child: const Center(
                child: CommonText(
                  'Go Back',
                  marginVertical: 0.006,
                ),
              ),
            ),
            0.02.boxHeight,
          ],
        ),
      ),
    );
  }
}

class CustomerInformationContainer extends StatelessWidget {
  const CustomerInformationContainer({
    required this.type,
    required this.name,
    required this.phone,
    required this.email,
    super.key,
  });

  final CustomerType type;
  final String? name;
  final String? phone;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 0.027.flexAll,
          backgroundColor: Colors.grey[300],
          child: SvgPicture.asset(
            type == CustomerType.individual ? iconPerson : iconCompany,
            width: 0.03.flexWidth,
            height: 0.03.flexHeight,
          ),
        ),
        0.04.boxWidth,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              name ?? '',
              fontSize: fontH2,
            ),
            0.01.boxHeight,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.grey[600],
                ),
                Container(
                  width: 0.62.flexWidth,
                  alignment: AlignmentDirectional.centerStart,
                  child: CommonText(
                    phone ?? '',
                    fontColor: Colors.grey[600],
                    textAlign: TextAlign.start,
                    marginHorizontal: 0.02,
                  ),
                ),
              ],
            ),
            0.01.boxHeight,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.mail_outline_outlined,
                  color: Colors.grey[600],
                ),
                Container(
                  width: 0.62.flexWidth,
                  alignment: AlignmentDirectional.centerStart,
                  child: CommonText(
                    email ?? '',
                    fontColor: Colors.grey[600],
                    textAlign: TextAlign.start,
                    marginHorizontal: 0.02,
                  ),
                ),
              ],
            ),
            // CommonText(
            //   email ?? '',
            //   fontColor: Colors.grey[600],
            //   marginHorizontal: 0.02,
            //   leftChild: Icon(
            //     Icons.mail_outline_outlined,
            //     color: Colors.grey[600],
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}

class SiteResultContainer extends StatelessWidget {
  const SiteResultContainer({
    super.key,
    this.siteName,
    this.postcode,
    this.onPress,
  });

  final String? siteName;
  final String? postcode;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress,
      style: appContainerStyles.cardStyle,
      paddingHorizontal: 0.02,
      touchEffect: TouchableEffect(type: TouchTypes.opacity),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommonText(
                  'Site Name',
                  fontColor: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  rightChild: Row(
                    children: <Widget>[
                      const CommonText(
                        '-',
                        marginHorizontal: 0.015,
                      ),
                      SizedBox(
                          width: 0.5.flexWidth,
                          child: CommonText(
                            siteName ?? '',
                            textAlign: TextAlign.start,
                          )),
                    ],
                  ),
                ),
                0.01.boxHeight,
                CommonText(
                  'Postcode',
                  fontColor: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  rightChild: Row(
                    children: <Widget>[
                      const CommonText(
                        '-',
                        marginHorizontal: 0.015,
                      ),
                      CommonText(postcode ?? ''),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward,
            size: 0.022.flexAll,
          ),
        ],
      ),
    );
  }
}
