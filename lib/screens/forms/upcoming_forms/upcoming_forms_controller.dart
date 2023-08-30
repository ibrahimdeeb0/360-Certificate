import '../../../general_exports.dart';

class UpcomingFormsController extends GetxController {
  bool isOpen = false;
  List<bool> isOpenList = <bool>[];
  List<Map<String, dynamic>> get moreItems => <Map<String, dynamic>>[
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Gas Safe CP1',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 1,
          keyTitle: 'Gas/Service Maintenance',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 2,
          keyTitle: 'DICE (Domestic Electric Installation Certificate)',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconElectrical,
        },
        <String, dynamic>{
          keyId: 3,
          keyTitle: 'Visual Inspection Certificate',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconEye,
        },
        <String, dynamic>{
          keyId: 4,
          keyTitle: 'Earthing & Bonding',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconRelation,
        },
        <String, dynamic>{
          keyId: 5,
          keyTitle: 'Electrical Isolation',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconElectrical,
        },
        <String, dynamic>{
          keyId: 6,
          keyTitle: 'Solar PV Test Report',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconSun,
        },
        <String, dynamic>{
          keyId: 7,
          keyTitle: 'Gas Warning Notice',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 8,
          keyTitle: 'ND Gas Safety Record',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 9,
          keyTitle: 'Liquefied Petroleum Gas Safety Record',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 10,
          keyTitle: 'ND Catering',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 11,
          keyTitle: 'Fire Detect & Alarm Modification',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconBell,
        },
        <String, dynamic>{
          keyId: 12,
          keyTitle: 'Fire Detection & Alarm System Acceptance',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconBell,
        },
        <String, dynamic>{
          keyId: 13,
          keyTitle: 'Fire Alarm System Commission Certificate',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconBell,
        },
        <String, dynamic>{
          keyId: 14,
          keyTitle: 'Fire Detection & Alarm System Installation',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconBell,
        },
        <String, dynamic>{
          keyId: 15,
          keyTitle: 'Fire Alarm System Verification',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconBell,
        },
        <String, dynamic>{
          keyId: 16,
          keyTitle: 'Fire Detection & Alarm System Design',
          keyDescription:
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It has survived not only five centuries, but also the leap into electronic typesetting.',
          keyIcon: iconBell,
        },
      ];

  void toggleItemOpenState(int index) {
    isOpenList[index] = !isOpenList[index];
    update();
  }

  void checkIsOpen() {
    if (isOpen == true) {
      isOpen = false;
    } else {
      isOpen = true;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    isOpenList = List<bool>.filled(moreItems.length, false);
  }
}
