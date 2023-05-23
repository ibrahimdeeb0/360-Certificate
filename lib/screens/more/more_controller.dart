import 'package:package_info_plus/package_info_plus.dart';

import '../../general_exports.dart';

class MoreController extends GetxController {
  bool isTileExpanded = false;

  String? appVersion;

  List<Map<String, dynamic>> get moreItems => <Map<String, dynamic>>[
        // <String, dynamic>{
        //   keyTitle: 'Customers',
        //   keyIcon: iconCustomers,
        //   keyOnPress: () => Get.toNamed(routeCustomers),
        // },
        <String, dynamic>{
          keyTitle: 'Form Templates',
          keyIcon: iconFormTemplate,
          keyOnPress: () => Get.toNamed(routeFormTemplates),
        },
        <String, dynamic>{
          keyTitle: 'My Settings',
          keyIcon: iconSettings,
          keyOnPress: () => Get.toNamed(routeMySettings),
        },
        // <String, dynamic>{
        //   keyTitle: 'My Subscription',
        //   keyIcon: iconSubscription,
        //   keyOnPress: () => Get.toNamed(routeMySubscription),
        // },
        <String, dynamic>{
          keyTitle: 'Logout',
          keyIcon: iconLogout,
          keyOnPress: myAppController.onSignOut,
        },
        // <String, dynamic>{
        //   keyTitle: 'Develop Forms',
        //   keyIcon: iconForm,
        //   keyOnPress: () => Get.to(() => const DevelopmentForms()),
        // },
      ];

  @override
  Future<void> onReady() async {
    super.onReady();
    // final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    update();
  }

  void onExpansionChanged({bool expanded = false}) {
    isTileExpanded = expanded;
    update();
  }

  // Form
  List<Map<String, dynamic>> formItems = <Map<String, dynamic>>[
    <String, dynamic>{
      keyTitle: 'Gas',
      keyItems: <Map<String, dynamic>>[
        <String, dynamic>{
          keyId: 9,
          keyTitle: 'Landlord/Homeowner Gas Safety Record',
          keyOnPress: () {
            Get.toNamed(routeFormLandlord);
          },
        },
        <String, dynamic>{
          keyId: 11,
          keyTitle: 'Warning Notice',
          keyOnPress: () {
            Get.toNamed(routeFormWarningNotice);
          },
        },
        // <String, dynamic>{
        //   keyId: 0,
        //   keyTitle: 'Caravan Boat Gas Safety Inspection Record',
        // },
        // <String, dynamic>{
        //   keyId: 0,
        //   keyTitle: 'Warning Notice',
        // },
        // <String, dynamic>{
        //   keyId: 0,
        //   keyTitle: 'Gas Inspection Record',
        // },
        // <String, dynamic>{
        //   keyId: 0,
        //   keyTitle: 'Gas Testing And Purging',
        // },
        // <String, dynamic>{
        //   keyId: 0,
        //   keyTitle: 'Fumes Investigation Report',
        // },
        // <String, dynamic>{
        //   keyId: 0,
        //   keyTitle: 'Service/Maintenance Record',
        // },
        // <String, dynamic>{
        //   keyId: 0,
        //   keyTitle: 'Gas Boiler System Commissioning Checklist',
        // },
      ],
    },
    <String, dynamic>{
      keyTitle: 'Electrical',
      keyItems: <Map<String, dynamic>>[
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Portable Appliance Testing (PAT)',
          keyOnPress: () {
            Get.toNamed(routeFormPortableTest);
          },
        },
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Domestic Electrical Installation Certificate',
          keyOnPress: () {
            Get.toNamed(routeFormDomesticEic);
          },
        },
        <String, dynamic>{
          keyId: 4,
          keyTitle: 'Electrical Danger Notice',
          keyOnPress: () {
            Get.toNamed(routeFormDangerNotice);
          },
        },
        <String, dynamic>{
          keyId: 5,
          keyTitle: 'EICR',
          keyOnPress: () {
            Get.toNamed(routeFormEICR);
          },
        },
      ],
    },
  ];
}
