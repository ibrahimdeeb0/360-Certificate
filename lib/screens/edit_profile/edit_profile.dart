import '../../general_exports.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (EditProfileController controller) {
          return const Center(child: CommonText('EditProfile Screen'));
        },
      ),
    );
  }
}
