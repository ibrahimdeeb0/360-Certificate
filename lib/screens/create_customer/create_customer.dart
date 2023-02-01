import '../../general_exports.dart';

class CreateCustomer extends StatelessWidget {
  const CreateCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Add Customer',
      ),
      body: GetBuilder<CreateCustomerController>(
        init: CreateCustomerController(),
        builder: (CreateCustomerController controller) {
          return CommonContainer(
            width: 1,
            height: 1,
            backgroundColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommonText(
                  'Customer Details',
                  fontWeight: FontWeight.bold,
                  fontColor: AppColors.primary,
                  rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                  containerStyle: CommonContainerModel(
                    width: 1,
                    paddingHorizontal: 0.04,
                    paddingVertical: 0.016,
                    backgroundColor: AppColors.greyLight,
                  ),
                  rightChild: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: 0.0,
                          end: 1,
                          // end: controller.selectedAddCustomerId == 0
                          //     ? 0.25
                          //     : controller.selectedAddCustomerId == 1
                          //         ? 0.5
                          //         : controller.selectedAddCustomerId == 2
                          //             ? 0.75
                          //             : 1,
                        ),
                        duration: const Duration(milliseconds: 700),
                        builder: (BuildContext context, double value, _) =>
                            CircularProgressIndicator(value: value),
                      ),
                      const Align(
                        child: CommonText(
                          '1/1',
                          // controller.selectedAddCustomerId == 0
                          //     ? '1/4'
                          //     : controller.selectedAddCustomerId == 1
                          //         ? '2/4'
                          //         : controller.selectedAddCustomerId == 2
                          //             ? '3/4'
                          //             : '4/4',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CommonContainer(
                    paddingHorizontal: 0.04,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const CustomerInfo(),
                          //* Billing Address *//
                          if (!controller.isSelectBilling)
                            const BillingAddress(),
                          //* Finance Details *//
                          const FinanceDetails(),
                          SizedBox(height: DEVICE_HEIGHT * 0.02),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
