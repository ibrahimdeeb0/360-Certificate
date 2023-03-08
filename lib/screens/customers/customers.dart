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
            ),
            body: CommonContainer(
              style: appContainerStyles.containerStyles,
              child: Column(
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.03),
                  CommonButton(
                    // onPress: () {
                    //   consoleLogPretty(controller.allCustomers);
                    // },
                    onPress: () => Get.toNamed(routeCustomerProfile),
                    text: 'Customer Profile',
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
