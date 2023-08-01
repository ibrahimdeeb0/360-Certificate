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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AttentionMessage(
                  message:
                      'As you selected Individual please enter the inspection property address. Please input the postcode below.',
                  child: SearchWithWooz(
                    searchWithWoozController: controller.customerIfoAddress,
                    showJustOneSite: true,
                  ),
                ),
                const AttentionMessage(
                  message: 'Please enter the details of the landlord/agent',
                ),
                CommonInput(
                  topLabelText: 'Phone Number',
                  hint: '000 000 0000',
                  controller: controller.customerInfoPhoneController,
                  keyboardType: TextInputType.phone,
                ),
                CommonInput(
                  topLabelText: 'Email Address',
                  hint: 'Enter Your Email Address',
                  controller: controller.customerInfoEmailController,
                  keyboardType: TextInputType.emailAddress,
                  marginBottom: 0.02,
                  focusNode: controller.email1FocusNode,
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(width: 2, color: Colors.red),
                  // ),
                ),
                SelectTypeSheet(
                  label: 'Contact Type',
                  hint: 'Select Contact Type',
                  value: controller.customerContactType != null
                      ? (controller.customerContactType as Enum)
                          .name
                          .capitalizeFirst
                      : '',
                  onTap: controller.selectCustomerContactType,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SelectTypeSheet extends StatelessWidget {
  const SelectTypeSheet({
    super.key,
    this.label,
    this.hint,
    this.value,
    this.onTap,
    this.isRequired = false,
  });
  final String? label;
  final String? hint;
  final String? value;
  final Function()? onTap;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      label ?? '',
      marginBottom: 0.012,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      marginRight: 0.01,
      containerStyle: const CommonContainerModel(
        marginVertical: 0.01,
      ),
      rightChild: isRequired
          ? const Icon(
              Icons.star,
              color: Colors.red,
              size: 12,
            )
          : const SizedBox(),
      bottomChild: InkWell(
        onTap: onTap,
        child: CommonInput(
          marginBottom: 0,
          hint: hint ?? '',
          value: value ?? '',
          enabled: false,
          suffix: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class ShowEmailMessageSheet extends StatelessWidget {
  const ShowEmailMessageSheet({super.key, this.pressYes, this.pressNo});
  final Function()? pressYes;
  final Function()? pressNo;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            0.03.boxHeight,
            const CommonText(
              'Are you want to complete without email?',
              marginBottom: 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CommonButton(
                  onPress: pressYes,
                  width: 0.44,
                  text: 'Yes',
                ),
                CommonButton(
                  onPress: pressNo,
                  width: 0.44,
                  text: 'No',
                  backgroundColor: Colors.blueGrey[100],
                  borderWidth: 2,
                  borderColor: AppColors.primary,
                  fontColor: AppColors.primary,
                ),
              ],
            ),
            0.03.boxHeight,
          ],
        ),
      ),
    );
  }
}
