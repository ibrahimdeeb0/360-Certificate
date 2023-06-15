import '../../../general_exports.dart';

class CreateCustomerIndividualStep2 extends StatelessWidget {
  const CreateCustomerIndividualStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerV2Controller>(
      init: CreateCustomerV2Controller(),
      builder: (CreateCustomerV2Controller controller) {
        return Column(
          children: <Widget>[
            0.03.boxHeight,
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
                          'test texts',
                          marginLeft: 0.015,
                          style: appTextStyles.h3DarkGreyStyle(),
                        ),
                      ),
                    ],
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
