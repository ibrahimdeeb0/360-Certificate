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
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ToggleButtons(
                  onPressed: controller.onChange,
                  isSelected: controller.isSelected
                      .map(
                        (bool element) => element,
                      )
                      .toList(),
                  children: const <Widget>[
                    Icon(Icons.anchor),
                    Icon(Icons.access_alarm),
                    Icon(Icons.account_balance_wallet_outlined),
                    Icon(Icons.add_call),
                    Icon(Icons.format_italic),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
