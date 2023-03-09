import '../../general_exports.dart';

class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'My Settings',
      ),
      body: GetBuilder<MySettingsController>(
        init: MySettingsController(),
        builder: (MySettingsController controller) {
          return controller.userData.isNotEmpty
              ? Column(
                  children: <Widget>[
                    SettingHeader(
                      onEdit: () => Get.toNamed(routeProfile),
                      name:
                          '${controller.userData['first_name']} ${controller.userData['last_name']}'
                              .capitalize,
                      image: controller.userData['image_profile_url'] == null
                          ? const CircleContainer()
                          : CommonContainer(
                              backgroundColor: AppColors.grey,
                              size: 0.18,
                              borderRadius: 1,
                              clipBehavior: Clip.hardEdge,
                              child: CachedImage(
                                image:
                                    '${controller.userData['image_profile_url']}',
                                width: DEVICE_WIDTH * 1,
                                height: DEVICE_WIDTH * 1,
                                withPlaceHolder: true,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                      child: CommonContainer(
                        width: 1,
                        backgroundColor: Colors.white,
                        paddingHorizontal: 0.04,
                        // paddingTop: 0.02,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              CommonText(
                                'Turn Invoice Feature',
                                rowMainAxisSize: MainAxisSize.max,
                                rowMainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                rightChild: CommonText(
                                  'coming soon',
                                  marginRight: 0.01,
                                  fontSize: fontH3,
                                  fontColor: Colors.grey,
                                  rightChild: Switch(
                                    activeColor: Colors.green,
                                    value: false,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                                containerStyle: appContainerStyles
                                    .bottomBorderStyle
                                    .copyWith(marginBottom: 0.015),
                              ),
                              ItemCard(
                                title: 'Company Email',
                                subTitle: controller.userData['email'],
                                hideArrow: true,
                              ),
                              ItemCard(
                                title: 'Company Phone Number',
                                subTitle: controller.userData['phone'],
                                hideArrow: true,
                              ),
                              ItemCard(
                                onPressItem: () => Get.to(
                                  () => const UpdatePostcode(),
                                  arguments: <String, dynamic>{
                                    keyData: controller.userData,
                                  },
                                ),
                                title: 'Type In The Postcode',
                                subTitle:
                                    controller.userData['registered_address'],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox();
        },
      ),
    );
  }
}

class SettingHeader extends StatelessWidget {
  const SettingHeader({
    super.key,
    this.name,
    this.onEdit,
    this.image,
  });
  final String? name;
  final Function? onEdit;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      backgroundColor: Colors.grey[100],
      paddingHorizontal: 0.04,
      paddingVertical: 0.015,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonText(
            name ?? 'Nick Marry',
            marginHorizontal: 0.02,
            leftChild: image ??
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(AppColors.grey).withOpacity(0.2),
                ),
          ),
          CommonContainer(
            onPress: onEdit,
            touchEffect: TouchableEffect(type: TouchTypes.scaleAndFade),
            child: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
