import '../../general_exports.dart';

class ProfileSubscriptionInvoices extends StatelessWidget {
  const ProfileSubscriptionInvoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Subscription Invoices',
      ),
      body: GetBuilder<ProfileInvoicesController>(
        init: ProfileInvoicesController(),
        builder: (ProfileInvoicesController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles.copyWith(),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.025),
                  if (controller.allInvoicesData.isNotEmpty)
                    ...controller.allInvoicesData.map(
                      (dynamic element) => SubscriptionInvoiceCard(
                        invoiceNum: element['invoice_number'],
                        invoiceCost: '£ ${element['job']['total_amount']}',
                      ),
                    )
                  else if (controller.isStopLoading &&
                      controller.allInvoicesData.isEmpty)
                    CommonText(
                      'There is no Invoices',
                      style: appTextStyles.h3StyleBlack(),
                      containerStyle:
                          const CommonContainerModel(marginTop: 0.25),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
