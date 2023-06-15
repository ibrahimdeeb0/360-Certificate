import '../../../general_exports.dart';

class CreateCustomerIndividualStep extends StatelessWidget {
  const CreateCustomerIndividualStep({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerV2Controller>(
      init: CreateCustomerV2Controller(),
      builder: (CreateCustomerV2Controller controller) {
        return Column(
          children: <Widget>[
            SelectCustomerTypeContainer(
              label: 'Individual',
              selectedType: CustomerType.individual,
              isSelected: controller.customerType != null
                  ? controller.customerType == CustomerType.individual
                  : null,
              onTap: () {
                controller.onSelectType(CustomerType.individual);
              },
            ),
            AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
              duration: const Duration(milliseconds: 300),
              width: 1.flexWidth,
              height: controller.customerType == CustomerType.individual
                  ? 0.12.flexHeight
                  : 0.0.flexHeight,
              // color: Colors.blueGrey,
              onEnd: controller.onEndExpanded,
              child: controller.customerType == CustomerType.individual
                  ? controller.showIndividualInputs
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CommonInput(
                              topLabelText: 'First Name',
                              hint: 'First Name',
                              width: 0.44,
                              controller: controller.iFName,
                              onChanged: controller.onChangeIInputs,
                            ),
                            CommonInput(
                              topLabelText: 'Last Name',
                              hint: 'First Name',
                              width: 0.44,
                              controller: controller.iLName,
                              onChanged: controller.onChangeIInputs,
                            ),
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox(),
            ),
          ],
        );
      },
    );
  }
}
