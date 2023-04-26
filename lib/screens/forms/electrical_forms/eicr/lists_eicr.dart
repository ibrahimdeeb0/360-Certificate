import '../../../../general_exports.dart';

class EICRListsForm {
  List<Map<String, dynamic>> listRenderWidgets = <Map<String, dynamic>>[
    <String, dynamic>{
      'head_label': '1.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle: '1.1. Condition Of Service Cable',
          formKey: formKey1_1Cable,
        },
        <String, dynamic>{
          keyTitle: '1.2. Condition Of Service Head',
          formKey: formKey1_2Head,
        },
        <String, dynamic>{
          keyTitle: '1.3. Condition Of Distributor’s Earthing Arrangement',
          formKey: formKey1_3Arrangement,
        },
        <String, dynamic>{
          keyTitle: '1.4. Condition Of Meter Tails - Distributor/Consumer',
          formKey: formKey1_4Consumer,
        },
        <String, dynamic>{
          keyTitle:
              '1.5. Condition Of Metering Equipment Including Isolator (Where Present)',
          formKey: formKey1_5Isolator,
        },
        <String, dynamic>{
          keyTitle:
              '1.6. Person Ordering Work /Duty Holder Notified if Appropriate',
          formKey: formKey1_6Appropriate,
        },
        <String, dynamic>{
          keyTitle:
              '2.0. Presence Of Adequate Arrangements For other Source such as Micro Generators (551.6; 551.7)',
          formKey: formKey2_0Generators,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '13.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle:
              '3.1. Presence And Condition Of Distributor’s Earthing Arrangement \n(542.1.2.1; 542.1.2.2)',
          formKey: formKey3_1,
        },
        <String, dynamic>{
          keyTitle:
              '3.2. Presence And Condition Of Earth Electrode Connection Where Applicable \n(542.1.2.3)',
          formKey: formKey3_2,
        },
        <String, dynamic>{
          keyTitle:
              '3.3. Provision of Earthing or Bounding Labels at All Appropriate \n(514.13)',
          formKey: formKey3_3,
        },
        <String, dynamic>{
          keyTitle: '3.4. Adequacy Of Earthing Conductor Size (542.3; 543.1.1)',
          formKey: formKey3_4,
        },
        <String, dynamic>{
          keyTitle:
              '3.5. Accessibility Of Earthing Conductor Connections (543.3.2)',
          formKey: formKey3_5,
        },
        <String, dynamic>{
          keyTitle:
              '3.6. Adequacy Of Main Protective Bonding Conductor Sizes (544.1)',
          formKey: formKey3_6,
        },
        <String, dynamic>{
          keyTitle:
              '3.7. Adequacy Of Main Protective Bonding Conductor Connections (543.3.2; 544.1.2)',
          formKey: formKey3_7,
        },
        <String, dynamic>{
          keyTitle:
              '3.8. Accessibility And Condition Of Other Protective Bonding Connections (543.3.3.1; 543.3.2)',
          formKey: formKey3_8,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '4.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle:
              '4.1. Adequacy Of Working Space or Accessibility To The Consumer Unit or Distribution Board (132.12; 513.1)',
          formKey: formKey4_1,
        },
        <String, dynamic>{
          keyTitle: '4.2. Security Of Fixing (134.1.1)',
          formKey: formKey4_2,
        },
        <String, dynamic>{
          keyTitle:
              '4.3. Condition Of Enclosure(S) In Terms Of Ip Rating Etc (416.2)',
          formKey: formKey4_3,
        },
        <String, dynamic>{
          keyTitle:
              '4.4 Condition Of Enclosure(S) In Terms Of Fire Rating Etc (421.1.201; 526.5)',
          formKey: formKey4_4,
        },
        <String, dynamic>{
          keyTitle:
              '4.5. Enclosure Not Damage or Deteriorated So As To Impair Safety \n(621.2)',
          formKey: formKey4_5,
        },
        <String, dynamic>{
          keyTitle:
              '4.6. Presence Of Main Linked Switch \n(As Required By 537.1.4)',
          formKey: formKey4_6,
        },
        <String, dynamic>{
          keyTitle:
              '4.7. Operation Of Main Switch - (Functional Check)  (612.13.2)',
          formKey: formKey4_7,
        },
        <String, dynamic>{
          keyTitle:
              '4.8. Manual Operation Of Circuit Breakers And RCDs To Prove Disconnection (643.10)',
          formKey: formKey4_8,
        },
        <String, dynamic>{
          keyTitle:
              '4.9. Correct Identification Of Circuit Details And Protective Device (514.8.1; 514.9.1)',
          formKey: formKey4_9,
        },
        <String, dynamic>{
          keyTitle:
              '4.10. Presence Of RCD six-monthly Test Notice, Where Required (514.12.2)',
          formKey: formKey4_10,
        },
        <String, dynamic>{
          keyTitle:
              '4.11. Presence Of Alternative Supply Warning Notice At or Near Consumer Unit/Distribution Board (514.15)',
          formKey: formKey4_11,
        },
        <String, dynamic>{
          keyTitle:
              '4.12. Presence Of Other Required Labelling (Please Specify) (Section 514)',
          formKey: formKey4_12,
        },
        <String, dynamic>{
          keyTitle:
              '4.13. Compatibility of Protective Device, Bases and Other Components; \nCorrect Type and Rating \n(No Signs of Unacceptable Thermal Damage, Arcing or Overheating) \n(411.3.2; 411.4; 411.5; 411.6; Sections 432, 433)',
          formKey: formKey4_13,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '4.14',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle:
              '4.14. Single-Pole Switching Or Protective Devices In Line Conductor Only (132.14.1; 530.3.3)',
          formKey: formKey4_14,
        },
        <String, dynamic>{
          keyTitle:
              '4.15. Protection Against Mechanical Damage Where Cables Enter Consumer Unit/Distribution Board (522.8.1; 522.8.11)',
          formKey: formKey4_15,
        },
        <String, dynamic>{
          keyTitle:
              '4.16. Protection Against Electromagnetic Effects Where Cables Enter Consumer Unit/Distribution Board/Enclosures (521.5.1)',
          formKey: formKey4_16,
        },
        <String, dynamic>{
          keyTitle:
              '4.17. RCD(s) Provided For Fault Protection - Includes RCBOs (411.4.204; 411.5.2; 531.2)',
          formKey: formKey4_17,
        },
        <String, dynamic>{
          keyTitle:
              '4.18. RCD(S) Provided For Additional Protection/Requirements - Includes RCBOs (411.3.3; 415.1)',
          formKey: formKey4_18,
        },
        <String, dynamic>{
          keyTitle:
              '4.19. Confirmation Of Indication That SPD is Functional (651.4)',
          formKey: formKey4_19,
        },
        <String, dynamic>{
          keyTitle:
              '4.20. Confirmation That all Conductor Connections, Including Connections To Busbars, Are Correctly Located In Terminals And Are Tight And Secure (526.1)',
          formKey: formKey4_20,
        },
        <String, dynamic>{
          keyTitle:
              '4.21. Adequate Arrangements Where A Generating Set as a Switched Alternative To The Public Supply (551.6)',
          formKey: formKey4_21,
        },
        <String, dynamic>{
          keyTitle:
              '4.22. Adequate Arrangements Where A Generating Set Operates In Parallel With The Public Supply (551.7)',
          formKey: formKey4_22,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '5.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle: '5.1. Identification Of Conductors (514.3.1)',
          formKey: formKey5_1,
        },
        <String, dynamic>{
          keyTitle:
              '5.2. Cables Correctly Supported Throughout Their Run (521.10.202; 522.8.5)',
          formKey: formKey5_2,
        },
        <String, dynamic>{
          keyTitle: '5.3. Condition Of Insulation Of Live Parts (416.1)',
          formKey: formKey5_3,
        },
        <String, dynamic>{
          keyTitle:
              '5.4. Non-Sheathed Cables Protected By Enclosure In Conduit, Ducting Or Trunking (521.10.1) (To Include The Integrity Of Conduit And Trunking Systems In Metallic And Plastic',
          formKey: formKey5_4,
        },
        <String, dynamic>{
          keyTitle:
              '5.5. Adequacy Of Cables Or Current-Carrying Capacity With Regard For The Type And Nature Of Installation (Section 523)',
          formKey: formKey5_5,
        },
        <String, dynamic>{
          keyTitle:
              '5.6. Co-ordination Between Conductors And Overload Protective Device (433.1; 533.2.1)',
          formKey: formKey5_6,
        },
        <String, dynamic>{
          keyTitle:
              '5.7. Adequacy Of Protective Devices: Type And Rated Current For Fault Protection (411.3)',
          formKey: formKey5_7,
        },
        <String, dynamic>{
          keyTitle:
              '5.8. Presence And Adequacy Of Circuit Protective Conductors (411.3.1; Section 543)',
          formKey: formKey5_8,
        },
        <String, dynamic>{
          keyTitle:
              '5.9 Wiring Systems(S) Appropriate For The Type And Nature Of The Installation And External Influences (Section 522)',
          formKey: formKey5_9,
        },
        <String, dynamic>{
          keyTitle:
              '5.10. Concealed Cables Installed In Prescribed Zones (See Section C in this Report: Extent And Limitations) (522.6.202)',
          formKey: formKey5_10,
        },
        <String, dynamic>{
          keyTitle:
              '5.11. Cables Concealed Under Floors, Above Ceilings, Or In Walls/ Partitions, Adequately Protected Against Damage (See Section C in this Report: Extent And Limitations) (522.6.204)',
          formKey: formKey5_11,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '5.12',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle:
              '* For All Socket-Outlets Of Rating 32A Or Less, Unless And Exception Is Permitted (411.3.3) ',
          formKey: formKey5_12_1,
        },
        <String, dynamic>{
          keyTitle:
              '* For The Supply of Mobile Equipment Not Exceeding 32A Rating For Use Outdoors (411.3.3)',
          formKey: formKey5_12_2,
        },
        <String, dynamic>{
          keyTitle:
              '* For Cables Concealed In Walls at A Depth Of Less Than 50mm (522.6.202; 522.6.203)',
          formKey: formKey5_12_3,
        },
        <String, dynamic>{
          keyTitle:
              '* For Cables Concealed In Walls/Partitions Containing Metal Parts Regardless Of Depth (522.6.203)',
          formKey: formKey5_12_4,
        },
        <String, dynamic>{
          keyTitle:
              '* For Circuit Supply Luminaries within Domestic (Household) Premises (411.3.4)',
          formKey: formKey5_12_5,
        },
        <String, dynamic>{
          keyTitle:
              '5.13. Provision Of Fire Barriers, Sealing Arrangements And Protection Against Thermal Effects (Section 527) ',
          formKey: formKey5_13,
        },
        <String, dynamic>{
          keyTitle:
              '5.14. Band If Cables Segregated/Separated From Band I Cables (528.1)',
          formKey: formKey5_14,
        },
        <String, dynamic>{
          keyTitle:
              '5.15. Cables Segregated or Separated From Communications Cabling (528.2)',
          formKey: formKey5_15,
        },
        <String, dynamic>{
          keyTitle:
              '5.16. Cables Segregated or Separated From Non-Electrical Service (528.3)',
          formKey: formKey5_16,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '5.17',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle:
              '* Connections Soundly Made And Under No Undue Strain (526.6)',
          formKey: formKey5_17_1,
        },
        <String, dynamic>{
          keyTitle:
              '* No Basic Insulation Of A Conductor Visible Outside of The Enclosure (526.8) ',
          formKey: formKey5_17_2,
        },
        <String, dynamic>{
          keyTitle:
              '* Connections Of Live Conductors Adequately Enclosed (526.5)',
          formKey: formKey5_17_3,
        },
        <String, dynamic>{
          keyTitle:
              '* Adequately Connected At The Point Of Entry To Enclosure (Glands, Bushes etc.) (522.8.5)',
          formKey: formKey5_17_4,
        },
        <String, dynamic>{
          keyTitle:
              '5.18. Conditions Of Accessories Including Socket-Outlets, Switches And Joint Boxes (651.2 (v))',
          formKey: formKey5_18,
        },
        <String, dynamic>{
          keyTitle:
              '5.19. Suitability Of Accessories For External Influences (512.2)',
          formKey: formKey5_19,
        },
        <String, dynamic>{
          keyTitle:
              '5.20. Adequacy Of Working  Space/Accessibility To Equipment (132.12; 513.1)',
          formKey: formKey5_20,
        },
        <String, dynamic>{
          keyTitle:
              '5.21. Single-Pole Switching Or Protective Devices In Line Conductors Only (132.14.1, 530.3.2)',
          formKey: formKey5_21,
        },
      ],
    },
    // 7
    <String, dynamic>{
      'head_label': '6.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle:
              '6.1. Additional Protection for All Circuits By A 30mA RCD (not applicable if design pre BS 7671)  (701.411.3.3)',
          formKey: formKey6_1,
        },
        <String, dynamic>{
          keyTitle:
              '6.2. Where Used as A Protective Measure, The Requirements For SELV or PELV have been met (701.414.4.5)',
          formKey: formKey6_2,
        },
        <String, dynamic>{
          keyTitle:
              '6.3. Shaver Supply Units Comply with BS EN 61558-2-5 Formerly BS 3535  (701.512.3)',
          formKey: formKey6_3,
        },
        <String, dynamic>{
          keyTitle:
              '6.4. Presence of Supplementary Bounding Conductors, Unless not Required by BS 7671:2018  (701.415.2)',
          formKey: formKey6_4,
        },
        <String, dynamic>{
          keyTitle:
              '6.5. Low Voltage (e.g 230 V) Socket-Outlets Sited at Least 2.5 m from zone 1  (701.512.2)',
          formKey: formKey6_5,
        },
        <String, dynamic>{
          keyTitle:
              '6.6. Suitability of The Equipment for External Influences for Installed Location in Term of IP Rating  (701.512.2)',
          formKey: formKey6_6,
        },
        <String, dynamic>{
          keyTitle:
              '6.7. Suitability of The Equipment for Installation in A Particular Zone  (701.512.3)',
          formKey: formKey6_7,
        },
        <String, dynamic>{
          keyTitle:
              '6.8. Suitability Of Current-Using Equipment For Particular Within The Location (701.55)',
          formKey: formKey6_8,
        },
      ],
    },
    // 8
    <String, dynamic>{
      'head_label': 'input_na',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle: '8.2',
          'input_form_key': formKey8_2Input,
          'button_form_key': formKey8_2BTN,
        },
        <String, dynamic>{
          keyTitle: '8.3',
          'input_form_key': formKey8_3Input,
          'button_form_key': formKey8_3BTN,
        },
        <String, dynamic>{
          keyTitle: '8.4',
          'input_form_key': formKey8_4Input,
          'button_form_key': formKey8_4BTN,
        },
        <String, dynamic>{
          keyTitle: '8.5',
          'input_form_key': formKey8_5Input,
          'button_form_key': formKey8_5BTN,
        },
        <String, dynamic>{
          keyTitle: '8.6',
          'input_form_key': formKey8_6Input,
          'button_form_key': formKey8_6BTN,
        },
        <String, dynamic>{
          keyTitle: '8.7',
          'input_form_key': formKey8_7Input,
          'button_form_key': formKey8_7BTN,
        },
      ],
    },
    <String, dynamic>{
      'head_label': 'input_na_part2',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle: '8.8',
          'input_form_key': formKey8_8Input,
          'button_form_key': formKey8_8BTN,
        },
        <String, dynamic>{
          keyTitle: '8.9',
          'input_form_key': formKey8_9Input,
          'button_form_key': formKey8_9BTN,
        },
        <String, dynamic>{
          keyTitle: '8.10',
          'input_form_key': formKey8_10Input,
          'button_form_key': formKey8_10BTN,
        },
        <String, dynamic>{
          keyTitle: '8.11',
          'input_form_key': formKey8_11Input,
          'button_form_key': formKey8_11BTN,
        },
        <String, dynamic>{
          keyTitle: '8.12',
          'input_form_key': formKey8_12Input,
          'button_form_key': formKey8_12BTN,
        },
        <String, dynamic>{
          keyTitle: '8.13',
          'input_form_key': formKey8_13Input,
          'button_form_key': formKey8_13BTN,
        },
        <String, dynamic>{
          keyTitle: '8.14',
          'input_form_key': formKey8_14Input,
          'button_form_key': formKey8_14BTN,
        },
        <String, dynamic>{
          keyTitle: '8.15',
          'input_form_key': formKey8_15Input,
          'button_form_key': formKey8_15BTN,
        },
        <String, dynamic>{
          keyTitle: '8.16',
          'input_form_key': formKey8_16Input,
          'button_form_key': formKey8_16BTN,
        },
        <String, dynamic>{
          keyTitle: '8.17',
          'input_form_key': formKey8_17Input,
          'button_form_key': formKey8_17BTN,
        },
        <String, dynamic>{
          keyTitle: '8.18',
          'input_form_key': formKey8_18Input,
          'button_form_key': formKey8_18BTN,
        },
        <String, dynamic>{
          keyTitle: '8.19',
          'input_form_key': formKey8_19Input,
          'button_form_key': formKey8_19BTN,
        },
        <String, dynamic>{
          keyTitle: '8.20',
          'input_form_key': formKey8_20Input,
          'button_form_key': formKey8_20BTN,
        },
        <String, dynamic>{
          keyTitle: '8.21',
          'input_form_key': formKey8_21Input,
          'button_form_key': formKey8_21BTN,
        },
        <String, dynamic>{
          keyTitle: '8.22',
          'input_form_key': formKey8_22Input,
          'button_form_key': formKey8_22BTN,
        },
        <String, dynamic>{
          keyTitle: '8.23',
          'input_form_key': formKey8_23Input,
          'button_form_key': formKey8_23BTN,
        },
        <String, dynamic>{
          keyTitle: '8.24',
          'input_form_key': formKey8_24Input,
          'button_form_key': formKey8_24BTN,
        },
        <String, dynamic>{
          keyTitle: '8.25',
          'input_form_key': formKey8_25Input,
          'button_form_key': formKey8_25BTN,
        },
        <String, dynamic>{
          keyTitle: '8.26',
          'input_form_key': formKey8_26Input,
          'button_form_key': formKey8_26BTN,
        },
        <String, dynamic>{
          keyTitle: '8.27',
          'input_form_key': formKey8_27Input,
          'button_form_key': formKey8_27BTN,
        },
        <String, dynamic>{
          keyTitle: '8.28',
          'input_form_key': formKey8_28Input,
          'button_form_key': formKey8_28BTN,
        },
        <String, dynamic>{
          keyTitle: '8.29',
          'input_form_key': formKey8_29Input,
          'button_form_key': formKey8_29BTN,
        },
        <String, dynamic>{
          keyTitle: '8.30',
          'input_form_key': formKey8_30Input,
          'button_form_key': formKey8_30BTN,
        },
        <String, dynamic>{
          keyTitle: '8.31',
          'input_form_key': formKey8_31Input,
          'button_form_key': formKey8_31BTN,
        },
        <String, dynamic>{
          keyTitle: '8.32',
          'input_form_key': formKey8_32Input,
          'button_form_key': formKey8_32BTN,
        },
        <String, dynamic>{
          keyTitle: '8.33',
          'input_form_key': formKey8_33Input,
          'button_form_key': formKey8_33BTN,
        },
      ],
    },
  ];

  List<String> listReasonsSuggestions = <String>[
    'Assess compliance with BS 7671',
    'Change of occupancy',
    'Change of use of premises',
    'HMO License',
    'Inspection after water damage',
    'Inspection after fire damage',
    'Local Authority request',
    'Mortgage lender request',
    'Public entertainments license',
    'No electrical certificate available',
    'Landlord electrical safety report',
    'Insurance request',
  ];
  List<String> listExtentSuggestions = <String>[
    '100% of installation',
    '50% of installation (3.82 of GN 3)',
    '25% of installation (3.82 of GN 3)',
    'Consumer unit change',
    'Sub main only as agreed',
    'New circuit',
    'Earthing/bonding upgrade',
  ];
  List<String> listAgreedSuggestions = <String>[
    ' No lifting of floors',
    'HVAC control cables not tested',
    'No inspection of concealed cables',
    'Unverified circuits not tested',
    'Sampling used 10%',
    'Sampling used 25%',
    'Sampling used 50%',
    'Sampling used 75%',
  ];
  List<String> listNominalVoltage = <String>[
    '230',
    '240',
    '110',
    '415',
    '400',
    'Other',
  ];
  List<String> listTypeI = <String>[
    'Rod',
    'Mat',
    'Copper Plate',
    'Building Structure',
    'Tape',
    'N/A',
    'Limited',
    'Other',
  ];
  List<String> listBS = <String>[
    'BS 88',
    'BS 3036',
    'BS 1361',
    'BS 1362',
    'BS 60898',
    'BS 3871',
    'BS 60947-2',
    'BS 60947',
    'BS 4293',
    'BS 61008',
    'BS 61009',
    'BS 5419',
    'N/A',
    'Limited',
    'Other',
  ];
  List<String> listTypeH = <String>[
    'Fuse HRC - Type gG',
    'Fuse HRC - Type mG',
    'Fuse HRC - Type aG',
    'Fuse (Semi - enclosed)',
    'Fuse HRC - Type 1',
    'Fuse HRC - Type 2',
    'Fuse HRC Obsolete',
    'MCB Type B',
    'MCB Type C',
    'MCB Type D',
    'MCB - Type 1',
    'MCB - Type 2',
    'MCB - Type 3',
    'MCB - Type 4',
    'MCB - Type B',
    'MCB - Type C',
    'MCB - Type D',
    'MCB Obsolete Type',
    'MCCB',
    'MCCB Obsolete Type',
    'ACB ',
    'ACB Obsolete Type',
    'RCD/RCBO - Type B',
    '61009 RCD/RCBO - Type C',
    'RCD/RCBO - Type D',
    'Isolator',
    'HBC - Type 1',
    'Fuse HBC - Type 1',
    'Fuse HBC',
    'N/A',
    'L/M',
    'Other',
  ];
  List<String> listRatedCurrentI = <String>[
    '5',
    '6',
    '7.5',
    '10',
    '15',
    '16',
    '20',
    '25',
    '30',
    '32',
    '40',
    '45',
    '50',
    '60',
    '63',
    '80',
    '100',
    'N/A',
    'Other',
  ];
  List<String> listConductorMaterial = <String>[
    'Copper',
    'Aluminum',
    'Steel',
    'N/V',
    'N/A',
    'None',
    'Other',
  ];
  List<String> listConductorCSA = <String>[
    '1.0',
    '1.5',
    '2.5',
    '4',
    '6',
    '10',
    '16',
    '25',
    '35',
    '50',
    '70',
    '95',
    '120',
    '150',
    '185',
    '240',
    '300',
    '400',
    '500',
    '630',
    'Conduit',
    'Trunking',
    'Armour',
    'MICC',
    'N/A',
    'Other'
  ];
  List<String> listTypeBS = <String>[
    '60947 type B',
    '60947 type C',
    '61009 type B',
    '88 type gG',
    '88 type mG',
    '88 type aM',
    '3036 (S-E)',
    '1361 type 1',
    '1361 type 2',
    '1362',
    '60898 type B',
    '60898 type C',
    '60898 type D',
    '3871 type 1',
    '3871 type 2',
    '3871 type 3',
    '3871 type 4',
    '3871 type B',
    '3871 type C',
    '3871 type D',
    '60947 - 2 MCCB',
    '60947 - 2 ACB',
    '60947 - 2 type D',
    '4293 RCD',
    '61008 RCD',
    '5419 Isolator',
    '60947 - 3 isolator',
    'N/A',
    'LIMITED',
    'Other',
  ];
  List<String> listRCDOperationCurrent = <String>[
    '30',
    '100',
    '300',
    '500',
    'N/A',
    'N/V',
    'L|M',
    'Other'
  ];
  List<String> listRatedTimeDelay = <String>[
    '100',
    '200',
    '300',
    '400',
    '500',
  ];
  List<String> listNumOfPoles = <String>[
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'Other'
  ];

  List<String> observationCode = <String>[
    'C1',
    'C2',
    'C3',
    'F1',
  ];

  List<String> observationLocationRef = <String>[
    'Kitchen',
    'Bathroom',
    'Hallway',
    'Bedroom',
    'Other',
  ];

  List<Map<String, dynamic>> observationDetails = <Map<String, dynamic>>[
    <String, dynamic>{
      keyTitle: 'C1',
      'description':
          'Requires immediate action to be taken which would be to inform the duty holder or responsible person for the installation immediately, both verbally and in writing, of the risk of injury that exists. If code C1 is used only unsatisfactory can be given as overall result.',
    },
    <String, dynamic>{
      keyTitle: 'C2',
      'description':
          'Potentially dangerous-urgent remedial action required. If code C2 is used only unsatisfactory can be given as overall result.',
    },
    <String, dynamic>{
      keyTitle: 'C3',
      'description':
          'Installation is not necessarily dangerous but it may not comply with the current version of the regulations or for example, may have damaged fittings that do not have exposed live parts. A codeC3, in itself, should not warrant an overall unsatisfactory report.',
    },
  ];
  // Domestic EICR

  List<String> acOrDc = <String>[
    'A/C',
    'D/C',
  ];

  List<String> nominalVoltageEIC = <String>[
    '400/230',
    '230/230',
    '230',
    '240',
    '110',
    '415',
    'Other',
  ];
  List<String> bsEIC = <String>[
    'BS88 Fuse HRC',
    'BS3036 Fuse (Semi-enclosed)',
    'BS 1361 Fuse HBC',
    'Fuse Obsolete Type',
    'BS EN 60898 MCB',
    'BS3871 MCB',
    'MCB Obsolete Type',
    'BS EN 60947-2 MCCB',
    'MCCB Obsolete Type',
    'BS EB 60947-2 ACB',
    'ACB Obsolete Type',
    'BS EN 60947-2 MCB',
    'BS EN 61009 RCD/RCBO',
    'BS EN 60947-3 Isolator',
    'BS 5419 Isolator',
    'BS 1361',
    'BS 1362 Domestic',
    'N/A',
    'LIM',
    'Other',
  ];
  List<String> typeBsEIC = <String>[
    'Type gG',
    'Type mG',
    'Type aM',
    '(S-E)',
    'Type B',
    'Type C',
    'Type D',
    'Type 1',
    'Type 2',
    'Type 3',
    'Type 4',
    'MCCB',
    'ACB',
    'RCD',
    'Isolator',
    'N/A',
    'LIM',
    'Other',
  ];
  List<String> locationEIC = <String>[
    'Hall',
    'Stairway',
    'Front Room',
    'Rear Room',
    'Shop Front',
    'Shop Rear',
    'Office',
    'Front Office',
    'Back Office',
    'Outside',
    'Side of House',
    'Front of House',
    'Rear of House',
    'Other',
  ];
  List<String> typeBSMainSwitch = <String>[
    'BS88 Fuse HRC - Type gG',
    'BS88 Fuse HRC - Type mG',
    'BS88 Fuse HRC - Type aM',
    'BS3036 Fuse (Semi-enclosed)',
    'BS 1361 Fuse HBC - Type 1',
    'BS 1361 Fuse HBC - Type 2',
    'Fuse Obsolete Type',
    'BS EN 60898 MCB Type B',
    'BS EN 60898 MCB Type C',
    'BS EN 60898 MCB Type D',
    'BS3871 MCB - Type 1',
    'BS3871 MCB - Type 2',
    'BS3871 MCB - Type 3',
    'BS3871 MCB - Type 4',
    'BS3871 MCB - Type B',
    'BS3871 MCB - Type C',
    'BS3871 MCB - Type D',
    'MCB Obsolete Type',
    'BS EN 60947-2 MCCB',
    'MCCB Obsolete Type',
    'BS EB 60947-2 ACB',
    'ACB Obsolete Type',
    'BS EN 60947-2 MCB Type B',
    'BS EN 60947-2 MCB Type C',
    'BS EN 60947-2 MCB Type D',
    'BS EN 60947-2 MCB Type B',
   
    'BS EN 61009 RCD/RCBO - Type B',
    'BS EN 61009 RCD/RCBO - Type C',
    'BS EN 61009 RCD/RCBO - Type D',
    'BS EN 60947-3 Isolator',
    'BS 5419 Isolator',
    'BS 1361 Fuse HBC - Type 1',
    'BS 1361 Fuse HBC - Type 2',
    'BS 1361 Fuse HBC',
    'BS 1361',
    'BS 1362 Domestic',
    'N/A',
    'LIM',
    'Other',
  ];
  // List<String> test = <String>[
  //   '',
  //   '',
  // ];
  // List<String> test = <String>[
  //   '',
  //   '',
  // ];
  // List<String> test = <String>[
  //   '',
  //   '',
  // ];
  // List<String> test = <String>[
  //   '',
  //   '',
  // ];
}

/*

  <String, dynamic>{
      'head_label': '4.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle:
              '',
          formKey: formKey4_1,
        },
      ],
    },

*/
