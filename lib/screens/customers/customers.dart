import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class Customers extends StatelessWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CustomersController>(
        init: CustomersController(),
        builder: (CustomersController controller) {
          return Scaffold(
            appBar: Header(
              withBack: false,
              title: 'Customers',
              actionItem: ActionItem(
                type: ActionType.search,
                onPress: () => Get.toNamed(routeSearch),
              ),
            ),
            body: CommonContainer(
              style: appContainerStyles.containerStyles,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: DEVICE_HEIGHT * 0.02),
                    ...controller.allCustomers.map(
                      (dynamic item) => CustomerCard(
                        name: '${item['first_name']}'.capitalize,
                        type: '${item['customer_type']['name']}'.capitalize,
                        address: item['address'],
                        onPress: () {
                          Get.toNamed(
                            routeCustomerProfile,
                            arguments: <String, dynamic>{
                              keyId: item[keyId],
                            },
                          );
                        },
                      ),
                    ),
                    0.01.boxHeight,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    this.name,
    this.type,
    this.address,
    this.onPress,
  });

  final String? name;
  final String? type;
  final String? address;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress,
      style: appContainerStyles.greyCardContainer,
      paddingVertical: 0.015,
      marginBottom: 0.02,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CommonText(
                name ?? '',
                fontColor: AppColors.primary,
                marginHorizontal: 0.02,
                leftChild: SvgPicture.asset(
                  iconPerson,
                  color: Color(AppColors.primary),
                ),
              ),
              CommonText(
                type ?? '',
                fontSize: fontH3,
              ),
            ],
          ),
          0.015.boxHeight,
          CommonText(
            '',
            inlineSpans: <InlineSpan>[
              TextSpan(
                text: address ?? '',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: fontH4,
                ),
              ),
            ],
            textAlign: TextAlign.start,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            leftChild: Padding(
              padding: EdgeInsets.only(right: 0.02.flexWidth),
              child: SvgPicture.asset(
                iconLocation,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
