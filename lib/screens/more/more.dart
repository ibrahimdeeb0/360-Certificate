import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: Header(
      //   title: '',
      //   withBack: false,
      //   withShadow: false,
      // ),
      body: GetBuilder<MoreController>(
        init: MoreController(),
        builder: (MoreController controller) {
          return CommonContainer(
            style: const CommonContainerModel(
              paddingHorizontal: 0.04,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.06),
                  // const MoreComponents(),

                  CommonText(
                    'Hello, ${profileController.userDataProfile['first_name']}',
                    fontSize: fontH1,
                    fontWeight: FontWeight.bold,
                    marginRight: 0.02,
                    rightChild: Image.asset(
                      imageHello,
                      width: DEVICE_WIDTH * 0.08,
                      height: DEVICE_HEIGHT * 0.08,
                    ),
                    containerStyle: const CommonContainerModel(
                        // marginBottom: 0.01,
                        // backgroundColor: Colors.amber,
                        ),
                  ),
                  ...controller.moreItems.map(
                    (dynamic item) => MoreComponents(
                      title: item[keyTitle],
                      iconPath: item[keyIcon],
                      isLogout: item[keyTitle] == 'Logout',
                      onPress: item[keyOnPress],
                    ),
                  ),

                  // SizedBox(
                  //   height: DEVICE_HEIGHT * 0.03,
                  // ),
                  // MyListTile(
                  //   // onTap: () => Get.toNamed(routeViewCustomers),
                  //   title: 'Customers',
                  //   leftIcon: SvgPicture.asset(
                  //     iconCustomers,
                  //     color: Color(AppColors.colorBlack3),
                  //   ),
                  //   rightIcon: Icon(
                  //     Icons.arrow_forward_ios_rounded,
                  //     size: 12,
                  //     color: Color(AppColors.grey),
                  //   ),
                  // ),

                  // MyListTile(
                  //   // onTap: () => Get.toNamed(routeViewInvoices),
                  //   title: 'Finance',
                  //   leftIcon: SvgPicture.asset(
                  //     iconInvoice,
                  //     color: Color(AppColors.colorBlack3),
                  //   ),
                  //   rightIcon: Icon(
                  //     Icons.arrow_forward_ios_rounded,
                  //     size: 12,
                  //     color: Color(AppColors.grey),
                  //   ),
                  // ),
                  // MyListTile(
                  //   // onTap: () => Get.to(
                  //   //   () => const FormTemplate(),
                  //   //   transition: Transition.leftToRight,
                  //   // ),
                  //   title: 'Form Template',
                  //   leftIcon: SvgPicture.asset(
                  //     iconFormTemplate,
                  //     color: Color(AppColors.colorBlack3),
                  //   ),
                  //   rightIcon: Icon(
                  //     Icons.arrow_forward_ios_rounded,
                  //     size: 12,
                  //     color: Color(AppColors.grey),
                  //   ),
                  // ),
                  // MyListTile(
                  //   title: 'Help',
                  //   leftIcon: SvgPicture.asset(
                  //     iconHelp,
                  //     color: Color(AppColors.colorBlack3),
                  //   ),
                  //   rightIcon: Icon(
                  //     Icons.arrow_forward_ios_rounded,
                  //     size: 12,
                  //     color: Color(AppColors.grey),
                  //   ),
                  // ),
                  // MyListTile(
                  //   // onTap: () => Get.toNamed(routeReportAnIssue),
                  //   title: 'Report an Issue',
                  //   leftIcon: SvgPicture.asset(
                  //     iconReport,
                  //     color: Color(AppColors.colorBlack3),
                  //   ),
                  //   rightIcon: Icon(
                  //     Icons.arrow_forward_ios_rounded,
                  //     size: 12,
                  //     color: Color(AppColors.grey),
                  //   ),
                  // ),
                  // MyListTile(
                  //   title: 'Logout',
                  //   leftIcon: SvgPicture.asset(
                  //     iconLogout,
                  //     color: Color(AppColors.colorBlack3),
                  //   ),
                  //   onTap: myAppController.onSignOut,
                  // ),
                  // // SizedBox(height: DEVICE_HEIGHT * 0.06),
                  // // SizedBox(height: DEVICE_HEIGHT * 0.15),
                  // ExpandableTile(
                  //   title: 'Developer Testing',
                  //   leftIcon: SvgPicture.asset(
                  //     iconSettings,
                  //     color: Color(AppColors.colorBlack3),
                  //   ),
                  //   children: <Widget>[
                  //     /*  const ChildeTitle(title: 'Branding'),
                  //   const ChildeTitle(title: 'Job Categories'),
                  //   ChildeTitle(
                  //     title: 'My Profile',
                  //     onTap: () => Get.toNamed(routeMyProfile),
                  //   ), */
                  //     ChildeTitle(
                  //       title: 'Forms',
                  //       onTap: () => Get.toNamed(routeForms),
                  //     ),
                  //     // const ChildeTitle(title: 'Subscription'),
                  //   ],
                  // ),
                  SizedBox(height: DEVICE_HEIGHT * 0.1),
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
          );
        },
      ),
    );
  }
}

class MoreComponents extends StatelessWidget {
  const MoreComponents({
    super.key,
    this.title,
    this.iconPath,
    this.onPress,
    this.isLogout = false,
  });

  final String? title;
  final String? iconPath;
  final Function()? onPress;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPress: onPress,
      marginBottom: 0.01,
      height: 0.07,
      overlayColor: Colors.black12,
      backgroundColor: Colors.white,
      elevation: 0.0,
      width: 1,
      borderRadius: 0.0,
      child: CommonContainer(
        borderBottomWidth: 2.5,
        borderBottomColor: AppColors.greyLight,
        paddingVertical: 0.015,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CommonText(
              title ?? 'Label',
              marginLeft: 0.03,
              fontSize: fontH2,
              containerStyle: const CommonContainerModel(
                width: 0.7,
              ),
              leftChild: CircleContainer(
                backgroundColor:
                    isLogout ? Color(AppColors.red).withOpacity(0.1) : null,
                circuitSize: 0.12,
                iconWidget: SvgPicture.asset(
                  iconPath ?? iconCustomers,
                  color: isLogout
                      ? Color(AppColors.red)
                      : Color(AppColors.primary),
                ),
              ),
            ),
            if (!isLogout)
              Padding(
                padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.04),
                child: Icon(
                  Icons.arrow_forward,
                  color: Color(AppColors.black2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
