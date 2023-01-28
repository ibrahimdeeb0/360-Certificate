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
            certificateUsage: '0/100',
            quoteUsage: '0/100',
            jobsUsage: controller.userDataProfile.isNotEmpty
                ? '${controller.userDataProfile['jobs_count']}/100'
                : '',
          ),
        );
      },
    );
  }
}
