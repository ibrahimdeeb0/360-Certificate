import '../../general_exports.dart';

class FinanceDetails extends StatelessWidget {
  const FinanceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerController>(
      init: CreateCustomerController(),
      builder: (CreateCustomerController controller) {
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
                marginTop: 0.02,
                marginBottom: 0.01,
                containerStyle: const CommonContainerModel(
                  alignment: AlignmentDirectional.centerStart,
                ),
              ),
              const CommonInput(
                topLabel: TopLabelText(
                  text: 'Credit Limit',
                ),
                hint: 'Credit Limit',
                marginBottom: 0.012,
              ),
              const CommonInput(
                topLabel: TopLabelText(
                  text: 'Payment Terms',
                ),
                hint: 'Payment Terms',
                marginBottom: 0.012,
                enabled: false,
                suffix: Icon(Icons.keyboard_arrow_down),
              ),
              CommonText(
                'Send Statements',
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                containerStyle: const CommonContainerModel(
                  width: 1,
                  marginTop: 0.02,
                ),
                rightChild: RadioButtonYesNo(
                  isSelect: controller.isSendStatements,
                  onTapYes: () {
                    controller.isSendStatements = true;
                    controller.update();
                  },
                  onTapNo: () {
                    controller.isSendStatements = false;
                    controller.update();
                  },
                ),
              ),
              SizedBox(height: DEVICE_HEIGHT * 0.03),
            ],
          ),
        );
      },
    );
  }
}
