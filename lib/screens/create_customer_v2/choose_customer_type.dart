import '../../general_exports.dart';

class ChooseCustomerType extends StatelessWidget {
  const ChooseCustomerType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerV2Controller>(
      init: CreateCustomerV2Controller(),
      builder: (CreateCustomerV2Controller controller) {
        return Column(
          children: <Widget>[
            const CreateCustomerIndividualStep(),
            CommonContainer(
              borderBottomWidth: 3,
              borderBottomColor: Colors.grey[200],
              marginHorizontal: 0.04,
            ),
            const CreateCustomerCompanyStep(),
          ],
        );
      },
    );
  }
}
