import '../../../../../general_exports.dart';

class CircuitDetails extends StatelessWidget {
  const CircuitDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DBController>(
      init: DBController(),
      builder: (DBController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: '',
            // actionItem: ActionItem(
            //   type: ActionType.save,
            //   onPress: Get.back,
            // ),
          ),
          body: Column(
            children: <Widget>[
              0.02.ph,
            ],
          ),
        );
      },
    );
  }
}
