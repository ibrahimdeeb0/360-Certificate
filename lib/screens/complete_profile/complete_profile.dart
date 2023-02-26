import '../../general_exports.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<CompleteProfileController>(
        init: CompleteProfileController(),
        builder: (CompleteProfileController controller) {
          return controller.setupStatus == SetupStatus.start
              ? Instruction(controller: controller)
              : controller.setupStatus == SetupStatus.fill
                  ? CompleteFillData(controller: controller)
                  : controller.setupStatus == SetupStatus.end
                      ? CompleteProfileDone(controller: controller)
                      : const SizedBox();
        },
      ),
    );
  }
}
