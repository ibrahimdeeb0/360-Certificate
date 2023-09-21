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
        if (homeController.isUserSubscribe)
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
          keyTitle: 'Upcoming Forms',
          keyIcon: iconForm,
          keyOnPress: () => Get.to(() => const UpcomingForms()),
        },
        <String, dynamic>{
          keyTitle: 'Logout',
          keyIcon: iconLogout,
          keyOnPress: myAppController.onSignOut,
        },
        // if (currentMode == AppMode.dev)
        //   <String, dynamic>{
        //     keyTitle: 'Develop Forms',
        //     keyIcon: iconForm,
        //     keyOnPress: () => Get.to(() => const DevelopmentForms()),
        //   },
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
          'press_details': () {
            formsDialog(
              title: 'warning',
              description: 'The gas certificate is valid for only one year.',
              fontSizeDes: fontH2,
            );
          },
        },
        <String, dynamic>{
          keyId: 11,
          keyTitle: 'Warning Notice',
          keyOnPress: () {
            Get.toNamed(routeFormWarningNotice);
          },
          'press_details': () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyId: 31,
          keyTitle: 'Breakdown Service',
          keyOnPress: () {
            Get.toNamed(routeFormBreakdownService);
          },
          'press_details': () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },

        <String, dynamic>{
          keyId: 15,
          keyTitle: 'Maintenance Service',
          keyOnPress: () {
            Get.toNamed(routeFormMaintenanceService);
          },
          'press_details': () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },

        <String, dynamic>{
          keyId: 13,
          keyTitle: 'Gas Test & Purge',
          keyOnPress: () {
            Get.toNamed(routeFormGasTestPurge);
          },
          'press_details': () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },

        //! new form needed
        // <String, dynamic>{
        //   keyId: 26,
        //   keyTitle: 'Landlord Gas Safety record for the Leisure Industry',
        //   keyOnPress: () {
        //     Get.toNamed(routeFormLeisureIndustry);
        //   },
        // },

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
          keyId: 1,
          keyTitle: 'Portable Appliance Testing (PAT)',
          keyOnPress: () {
            Get.toNamed(routeFormPortableTest);
          },
          'press_details': () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyId: 3,
          keyTitle: 'Domestic Electrical Installation Certificate',
          keyOnPress: () {
            Get.toNamed(routeFormDomesticEic);
          },
          'press_details': () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyId: 4,
          keyTitle: 'Electrical Danger Notice',
          keyOnPress: () {
            Get.toNamed(routeFormDangerNotice);
          },
          'press_details': () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyId: 5,
          keyTitle: 'EICR',
          keyOnPress: () {
            Get.toNamed(routeFormEICR);
          },
          'press_details': () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyId: 2,
          keyTitle: 'Minor Works',
          keyOnPress: () {
            Get.toNamed(routeFormMinorWorks);
          },
          'press_details': () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyId: 32,
          keyTitle: 'Electrical Isolation',
          keyOnPress: () {
            Get.toNamed(routeFormElectricalIsolation);
          },
          'press_details': () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
      ],
    },
  ];

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
