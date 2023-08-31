import '../../../general_exports.dart';

class UpcomingFormsController extends GetxController {
  bool isOpen = false;
  List<bool> isOpenList = <bool>[];
  List<Map<String, dynamic>> get moreItems => <Map<String, dynamic>>[
        <String, dynamic>{
          keyId: 0,
          keyTitle: 'Gas Safe CP1',
          keyDescription:
              'Gas Safe CP1 certification confirms that an engineer is qualified to work safely and competently on gas-fired boilers. It ensures compliance with gas safety regulations and the ability to perform installation, maintenance, and repairs.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 1,
          keyTitle: 'Gas/Service Maintenance',
          keyDescription:
              'Our certified experts ensure the safety, efficiency, and longevity of your gas appliances through scheduled check-ups, proactive care, and emergency services when needed. Your peace of mind is our priority.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 2,
          keyTitle: 'DICE (Domestic Electric Installation Certificate)',
          keyDescription:
              'A DICE is a document certifying the safety and compliance of electrical installations in homes, providing assurance for residents and future buyers.',
          keyIcon: iconElectrical,
        },
        <String, dynamic>{
          keyId: 3,
          keyTitle: 'Visual Inspection Certificate',
          keyDescription:
              'This certificate confirms that a thorough visual examination of a system or equipment has been conducted, ensuring its current condition and compliance with relevant standards.',
          keyIcon: iconEye,
        },
        <String, dynamic>{
          keyId: 4,
          keyTitle: 'Earthing & Bonding',
          keyDescription:
              'Earthing and bonding involve connecting electrical systems to the ground and ensuring all conductive parts are properly interconnected, preventing electrical hazards and ensuring safety.',
          keyIcon: iconRelation,
        },
        <String, dynamic>{
          keyId: 5,
          keyTitle: 'Electrical Isolation',
          keyDescription:
              'Electrical isolation refers to the process of disconnecting a circuit or equipment from its power source to ensure safety during maintenance, repairs, or when working on electrical systems.',
          keyIcon: iconElectrical,
        },
        <String, dynamic>{
          keyId: 6,
          keyTitle: 'Solar PV Test Report',
          keyDescription:
              'A Solar PV Test Report is an assessment detailing the performance, efficiency, and overall health of a solar photovoltaic system, ensuring it meets operational standards and functions optimally.',
          keyIcon: iconSun,
        },
        <String, dynamic>{
          keyId: 7,
          keyTitle: 'Gas Warning Notice',
          keyDescription:
              'A Gas Warning Notice is a formal notification indicating a potential gas safety issue, requiring immediate attention or action to address and rectify the identified problem for safety reasons.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 8,
          keyTitle: 'ND Gas Safety Record',
          keyDescription:
              'An ND Gas Safety Record is a documentation of the inspection and safety check of a gas appliance, ensuring it meets the necessary safety standards and is safe for use in non-domestic settings.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 9,
          keyTitle: 'Liquefied Petroleum Gas Safety Record',
          keyDescription:
              'A Liquefied Petroleum Gas Safety Record documents the thorough assessment and compliance verification of LPG-fueled equipment, certifying its safe operation and adherence to safety regulations.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 10,
          keyTitle: 'ND Catering',
          keyDescription:
              'ND Catering provides enduring excellence in culinary services, maintaining its tradition of quality through generations and technological transitions.',
          keyIcon: iconFire,
        },
        <String, dynamic>{
          keyId: 11,
          keyTitle: 'Fire Detect & Alarm Modification',
          keyDescription:
              'This service involves making necessary changes to fire detection and alarm systems to enhance their effectiveness, ensuring optimal safety and compliance.',
          keyIcon: iconBell,
        },
        <String, dynamic>{
          keyId: 12,
          keyTitle: 'Fire Detection & Alarm System Acceptance',
          keyDescription:
              'This process confirms that a fire detection and alarm system has been thoroughly tested, meets required standards, and is approved for operation to ensure reliable fire safety measures.',
          keyIcon: iconBell,
        },
        <String, dynamic>{
          keyId: 13,
          keyTitle: 'Fire Alarm System Commission Certificate',
          keyDescription:
              'This certificate verifies the successful installation, testing, and commissioning of a fire alarm system, ensuring its readiness and compliance with safety standards.',
          keyIcon: iconBell,
        },
        <String, dynamic>{
          keyId: 14,
          keyTitle: 'Fire Detection & Alarm System Installation',
          keyDescription:
              'This process involves placing and setting up components to establish a fire detection and alarm system, crucial for prompt and effective response to fire-related risks.',
          keyIcon: iconBell,
        },
        <String, dynamic>{
          keyId: 15,
          keyTitle: 'Fire Alarm System Verification',
          keyDescription:
              'This procedure confirms the accuracy and functionality of a fire alarm system through rigorous testing and assessment, ensuring its reliability in detecting and alerting to potential fires.',
          keyIcon: iconBell,
        },
        <String, dynamic>{
          keyId: 16,
          keyTitle: 'Fire Detection & Alarm System Design',
          keyDescription:
              'Creating a fire detection and alarm system layout, specifying components and their placement, to ensure comprehensive coverage and effective response to fire hazards.',
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
