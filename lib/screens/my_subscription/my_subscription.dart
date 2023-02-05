import '../../general_exports.dart';

class MySubscription extends StatelessWidget {
  const MySubscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: GetBuilder<MySubscriptionController>(
        init: MySubscriptionController(),
        builder: (MySubscriptionController controller) {
          return const Center(child: CommonText('MySubscription Screen'));
        },
      ),
    );
  }
}
