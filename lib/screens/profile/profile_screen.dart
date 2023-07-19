import '../../general_exports.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: profileController,
      builder: (ProfileController controller) {
        return Scaffold(
          appBar: Header(
            title: 'My Profile',
          ),
          body: ProfileComponent(
            emailAllowance: '0/100',
            diskSpace: '5 GB',
            // keepCertUsage: '0/100',
            deleteJobUsage: '0/100',
            keepCertUsage: controller.userDataProfile.isNotEmpty
                ? '${controller.userDataProfile['certificate_count']}/ ${homeController.showFreeAlert ? '20' : '100'} '
                : '',
          ),
        );
      },
    );
  }
}
