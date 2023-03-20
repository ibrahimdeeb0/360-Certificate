import '../../general_exports.dart';

class FinanceDetails extends StatelessWidget {
  const FinanceDetails({
    required this.controller,
    super.key,
  });

  final CreateCustomerController controller;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      borderTopWidth: 2,
      borderTopColor: AppColors.greyLightBorder,
      marginTop: 0.025,
      borderRadius: 0.5,
      child: Column(
        children: <Widget>[
          CommonText(
            'Finance Details',
            fontColor: AppColors.blue,
            fontWeight: FontWeight.bold,
            marginTop: 0.02,
            marginBottom: 0.01,
            containerStyle: const CommonContainerModel(
              alignment: AlignmentDirectional.centerStart,
            ),
          ),

          const CommonText(
            'coming soon',
            marginRight: 0.01,
            fontSize: fontH3,
            fontColor: Colors.grey,
          ),

          // CommonInput(
          //   topLabelText: 'Credit Limit',
          //   hint: 'Credit Limit',
          //   controller: controller.customerFinanceCreditController,
          //   marginBottom: 0.012,
          // ),
          // CommonInput(
          //   topLabel: const TopLabelText(
          //     text: 'Payment Terms',
          //     isRequired: false,
          //   ),
          //   hint: 'Payment Terms',
          //   value: controller.paymentTerm ??
          //       controller.selectedPaymentTerms?[keyName] ??
          //       '',
          //   onTap: () {
          //     // controller.getPaymentTerms();
          //     Get.bottomSheet(
          //       const SelectPaymentTerm(),
          //       elevation: 0.0,
          //       isScrollControlled: true,
          //     );
          //   },
          //   marginBottom: 0.012,
          //   enabled: false,
          //   suffix: const Icon(Icons.keyboard_arrow_down),
          // ),
          // CommonText(
          //   'Send Statements',
          //   rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   containerStyle: const CommonContainerModel(
          //     width: 1,
          //     marginTop: 0.02,
          //   ),
          //   rightChild: RadioButtonYesNo(
          //     isSelect: controller.isSendStatements,
          //     onTapYes: () {
          //       controller.isSendStatements = true;
          //       controller.update();
          //     },
          //     onTapNo: () {
          //       controller.isSendStatements = false;
          //       controller.update();
          //     },
          //   ),
          // ),

          SizedBox(height: DEVICE_HEIGHT * 0.03),
        ],
      ),
    );
  }
}
