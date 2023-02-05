import '../../general_exports.dart';

class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: GetBuilder<MySettingsController>(
        init: MySettingsController(),
        builder: (MySettingsController controller) {
          return const Center(child: CommonText('MySettings Screen'));
        },
      ),
    );
  }
}
