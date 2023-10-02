import '../../general_exports.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: Header(
        backgroundColor: Colors.grey[100],
      ),
      body: GetBuilder<SubscriptionController>(
        init: SubscriptionController(),
        builder: (SubscriptionController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AttentionMessage(
                    message: 'test',
                    marginBottom: 0,
                    child: SearchWithWooz(
                      searchWithWoozController: controller.mapController,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
