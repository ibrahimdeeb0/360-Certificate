import '../../../general_exports.dart';

class CreateCustomerIndividualStep1 extends StatelessWidget {
  const CreateCustomerIndividualStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerV2Controller>(
      init: CreateCustomerV2Controller(),
      builder: (CreateCustomerV2Controller controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
          child: Column(
            children: <Widget>[
              CommonContainer(
                style: appContainerStyles.cardStyle,
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.info_outline,
                          color: Colors.orange[600],
                        ),
                        SizedBox(
                          width: 0.775.flexWidth,
                          child: CommonText(
                            'As you selected Individual please enter the inspection property address',
                            marginLeft: 0.015,
                            style: appTextStyles.h3DarkGreyStyle(),
                          ),
                        ),
                      ],
                    ),
                    SearchWithWooz(
                      searchWithWoozController:
                          controller.searchWithWoozController1,
                    ),
                  ],
                ),
              ),
              CommonContainer(
                style: appContainerStyles.cardStyle,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.info_outline,
                      color: Colors.orange[600],
                    ),
                    SizedBox(
                      width: 0.775.flexWidth,
                      child: CommonText(
                        'Please enter the details of the landlord/agent',
                        marginLeft: 0.015,
                        style: appTextStyles.h3DarkGreyStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              const CommonInput(
                topLabelText: 'Phone Number',
                hint: '000 000 0000',
              ),
              const CommonInput(
                topLabelText: 'Email Address',
                hint: 'Enter Your Email Address',
                marginBottom: 0.02,
              ),
              CommonText(
                'Contact Type',
                marginBottom: 0.012,
                columnCrossAxisAlignment: CrossAxisAlignment.start,
                bottomChild: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      RadioSelectionSheet(
                        items: const <ContactType>[
                          ContactType.landlord,
                          ContactType.agent,
                        ],
                        onSelectItem: (dynamic value) {
                          consoleLog(value);
                          controller.selectedContactType = value;
                          controller.update();
                        },
                        initialValue: controller.selectedContactType,
                      ),
                    );
                  },
                  child: CommonInput(
                    marginBottom: 0,
                    hint: 'Select Contact Type',
                    value: controller.selectedContactType != null
                        ? (controller.selectedContactType as Enum)
                            .name
                            .capitalizeFirst
                        : '',
                    enabled: false,
                    suffix: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
