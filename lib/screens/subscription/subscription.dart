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
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
            child: Column(
              children: const <Widget>[
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CommonText(
                    'Choose Your Plan',
                    fontSize: fontHeader,
                    marginTop: 0.02,
                    marginBottom: 0.04,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
