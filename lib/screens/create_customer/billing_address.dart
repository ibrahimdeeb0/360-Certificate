import '../../general_exports.dart';

class BillingAddress extends StatelessWidget {
  const BillingAddress({super.key});

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
                'Billing Address',
                fontColor: AppColors.blue,
                marginTop: 0.02,
                marginBottom: 0.01,
                containerStyle: const CommonContainerModel(
                  alignment: AlignmentDirectional.centerStart,
                ),
              ),
              const CommonInput(
                topLabelText: 'Billing Address',
                hint: ' Type Billing Address Here',
                marginBottom: 0.012,
              ),
              const CommonInput(
                topLabel: TopLabelText(
                  text: 'Street Number And Name',
                ),
                hint: 'Street Number And Name',
                marginBottom: 0.012,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  CommonInput(
                    topLabel: TopLabelText(
                      text: 'City',
                    ),
                    hint: 'City ',
                    width: 0.43,
                    marginBottom: 0.012,
                  ),
                  CommonInput(
                    topLabel: TopLabelText(
                      text: 'Postcode',
                    ),
                    hint: 'Postcode',
                    width: 0.43,
                    marginBottom: 0.012,
                  ),
                ],
              ),
              const CommonInput(
                topLabelText: 'Country',
                hint: 'Select Country',
                suffix: Icon(Icons.keyboard_arrow_down),
                marginBottom: 0.012,
              ),
            ],
          ),
        );
      },
    );
  }
}
