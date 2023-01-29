import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<MoreController>(
          init: MoreController(),
          builder: (MoreController controller) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: Header(
                title: 'More',
                withBack: false,
              ),
              body: CommonContainer(
                style: const CommonContainerModel(
                  margin: 0.01,
                  padding: 0.01,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // SizedBox(
                      //   height: DEVICE_HEIGHT * 0.03,
                      // ),
                      MyListTile(
                        // onTap: () => Get.toNamed(routeViewCustomers),
                        title: 'Customers',
                        leftIcon: SvgPicture.asset(
                          iconCustomers,
                          color: Color(AppColors.colorBlack3),
                        ),
                        rightIcon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Color(AppColors.grey),
                        ),
                      ),

                      MyListTile(
                        // onTap: () => Get.toNamed(routeViewInvoices),
                        title: 'Finance',
                        leftIcon: SvgPicture.asset(
                          iconInvoice,
                          color: Color(AppColors.colorBlack3),
                        ),
                        rightIcon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Color(AppColors.grey),
                        ),
                      ),
                      MyListTile(
                        // onTap: () => Get.to(
                        //   () => const FormTemplate(),
                        //   transition: Transition.leftToRight,
                        // ),
                        title: 'Form Template',
                        leftIcon: SvgPicture.asset(
                          iconFormTemplate,
                          color: Color(AppColors.colorBlack3),
                        ),
                        rightIcon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Color(AppColors.grey),
                        ),
                      ),
                      MyListTile(
                        title: 'Help',
                        leftIcon: SvgPicture.asset(
                          iconHelp,
                          color: Color(AppColors.colorBlack3),
                        ),
                        rightIcon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Color(AppColors.grey),
                        ),
                      ),
                      MyListTile(
                        // onTap: () => Get.toNamed(routeReportAnIssue),
                        title: 'Report an Issue',
                        leftIcon: SvgPicture.asset(
                          iconReport,
                          color: Color(AppColors.colorBlack3),
                        ),
                        rightIcon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Color(AppColors.grey),
                        ),
                      ),
                      MyListTile(
                        title: 'Logout',
                        leftIcon: SvgPicture.asset(
                          iconLogout,
                          color: Color(AppColors.colorBlack3),
                        ),
                        onTap: myAppController.onSignOut,
                      ),
                      // SizedBox(height: DEVICE_HEIGHT * 0.06),
                      // SizedBox(height: DEVICE_HEIGHT * 0.15),
                      ExpandableTile(
                        title: 'Developer Testing',
                        leftIcon: SvgPicture.asset(
                          iconSettings,
                          color: Color(AppColors.colorBlack3),
                        ),
                        children: <Widget>[
                          /*  const ChildeTitle(title: 'Branding'),
                        const ChildeTitle(title: 'Job Categories'),
                        ChildeTitle(
                          title: 'My Profile',
                          onTap: () => Get.toNamed(routeMyProfile),
                        ), */
                          ChildeTitle(
                            title: 'Forms',
                            onTap: () => Get.toNamed(routeForms),
                          ),
                          // const ChildeTitle(title: 'Subscription'),
                        ],
                      ),
                      SizedBox(height: DEVICE_HEIGHT * 0.25),
                      GetBuilder<MoreController>(
                        init: MoreController(),
                        builder: (MoreController controller) {
                          return Center(
                            child: CommonText(
                              'App Version (${controller.appVersion}${currentMode == AppMode.dev ? '-dev' : ''}) ',
                              style: appTextStyles.h3GreyStyle(),
                            ),
                          );
                        },
                      ),

                      // SizedBox(height: DEVICE_HEIGHT * 0.1),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
