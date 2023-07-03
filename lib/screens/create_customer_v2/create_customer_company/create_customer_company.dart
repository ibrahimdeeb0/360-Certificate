import '../../../general_exports.dart';

class CreateCustomerCompanyStep extends StatelessWidget {
  const CreateCustomerCompanyStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerV2Controller>(
      init: CreateCustomerV2Controller(),
      builder: (CreateCustomerV2Controller controller) {
        return Column(
          children: <Widget>[
            SelectCustomerTypeContainer(
              label: 'Company',
              iconPath: iconCompany,
              isSelected: controller.customerType != null
                  ? controller.customerType == CustomerType.company
                  : null,
              onTap: () {
                controller.onSelectType(CustomerType.company);
              },
              onEnd: controller.onEndExpanded,
            ),
            if (controller.showCompanyInputs)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                child: Column(
                  children: <Widget>[
                    CommonInput(
                      topLabelText: 'Company Name',
                      hint: 'Enter Company Name',
                      controller: controller.customerInfoNameController,
                      keyboardType: TextInputType.name,
                      marginBottom: 0.03,
                    ),
                    AttentionMessage(
                      message:
                          'As you selected Business, this is the Business or Agents details, No the site property you are inspecting',
                      child: SearchWithWooz(
                        searchWithWoozController: controller.companyIfoAddress,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
