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
                HeaderTitleCard(controller: controller),
                Expanded(
                  child: CommonContainer(
                    paddingHorizontal: 0.04,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          if (controller.currentIndex == 0)
                            CustomerInfo(controller: controller),
                          //* Billing Address *//
                          if (controller.currentIndex == 0 &&
                              !controller.isSelectBilling)
                            BillingAddress(controller: controller),
                          //* Finance Details *//
                          if (controller.currentIndex == 0)
                            FinanceDetails(controller: controller),
                          if (controller.currentIndex == 1)
                            CustomerContacts(controller: controller),
                          if (controller.currentIndex == 2)
                            SiteAddress(controller: controller),
                          if (controller.currentIndex == 3)
                            SiteContacts(controller: controller),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CommonButton(
                                text: 'Back',
                                width: 0.44,
                                marginBottom: 0.02,
                                onPress: controller.onBackNext,
                                backgroundColor: AppColors.primaryOpacity,
                                fontColor: AppColors.primary,
                                borderWidth: 2,
                                borderColor: AppColors.primary,
                              ),
                              CommonButton(
                                text: 'Next',
                                width: 0.44,
                                marginBottom: 0.02,
                                onPress: controller.onPressNext,
                              ),
                            ],
                          ),
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

class HeaderTitleCard extends StatelessWidget {
  const HeaderTitleCard({
    required this.controller,
    super.key,
  });

  final CreateCustomerController controller;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      controller.titleName(),
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
              end: controller.currentIndex == 0
                  ? 0.25
                  : controller.currentIndex == 1
                      ? 0.5
                      : controller.currentIndex == 2
                          ? 0.75
                          : 1,
            ),
            duration: const Duration(milliseconds: 700),
            builder: (BuildContext context, double value, _) =>
                CircularProgressIndicator(
              value: value,
              color: Color(AppColors.primary),
            ),
          ),
          Align(
            child: CommonText(
              controller.currentIndex == 0
                  ? '1/4'
                  : controller.currentIndex == 1
                      ? '2/4'
                      : controller.currentIndex == 2
                          ? '3/4'
                          : '4/4',
            ),
          ),
        ],
      ),
    );
  }
}
