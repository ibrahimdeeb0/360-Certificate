import '../../../../general_exports.dart';

class EicrController extends GetxController {
  DateTime currentTime = DateTime.now();

  List<Map<String, dynamic>> listRenderWidgets = <Map<String, dynamic>>[
    <String, dynamic>{
      'head_label': '1.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          'title': '1.1. Condition Of Service Cable',
          'form_key': formKey1_1Cable,
        },
        <String, dynamic>{
          'title': '1.2. Condition Of Service Head',
          'form_key': formKey1_2Head,
        },
        <String, dynamic>{
          'title': '1.3. Condition Of Distributor’s Earthing Arrangement',
          'form_key': formKey1_3Arrangement,
        },
        <String, dynamic>{
          'title': '1.4. Condition Of Meter Tails - Distributor/Consumer',
          'form_key': formKey1_4Consumer,
        },
        <String, dynamic>{
          'title':
              '1.5. Condition Of Metering Equipment Including Isolator (Where Present)',
          'form_key': formKey1_5Isolator,
        },
        <String, dynamic>{
          'title':
              '1.6. Person Ordering Work /Duty Holder Notified if Appropriate',
          'form_key': formKey1_6Appropriate,
        },
        <String, dynamic>{
          'title':
              '2.0. Presence Of Adequate Arrangements For other Source such as Micro Generators (551.6; 551.7)',
          'form_key': formKey2_0Generators,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '13.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          'title':
              '3.1. Presence And Condition Of Distributor’s Earthing Arrangement \n(542.1.2.1; 542.1.2.2)',
          'form_key': formKey3_1,
        },
        <String, dynamic>{
          'title':
              '3.2. Presence And Condition Of Earth Electrode Connection Where Applicable \n(542.1.2.3)',
          'form_key': formKey3_2,
        },
        <String, dynamic>{
          'title':
              '3.3. Provision of Earthing or Bounding Labels at All Appropriate \n(514.13)',
          'form_key': formKey3_3,
        },
        <String, dynamic>{
          'title': '3.4. Adequacy Of Earthing Conductor Size (542.3; 543.1.1)',
          'form_key': formKey3_4,
        },
        <String, dynamic>{
          'title':
              '3.5. Accessibility Of Earthing Conductor Connections (543.3.2)',
          'form_key': formKey3_5,
        },
        <String, dynamic>{
          'title':
              '3.6. Adequacy Of Main Protective Bonding Conductor Sizes (544.1)',
          'form_key': formKey3_6,
        },
        <String, dynamic>{
          'title':
              '3.7. Adequacy Of Main Protective Bonding Conductor Connections (543.3.2; 544.1.2)',
          'form_key': formKey3_7,
        },
        <String, dynamic>{
          'title':
              '3.8. Accessibility And Condition Of Other Protective Bonding Connections (543.3.3.1; 543.3.2)',
          'form_key': formKey3_8,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '4.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          'title':
              '4.1. Adequacy Of Working Space or Accessibility To The Consumer Unit or Distribution Board (132.12; 513.1)',
          'form_key': formKey4_1,
        },
        <String, dynamic>{
          'title': '4.2. Security Of Fixing (134.1.1)',
          'form_key': formKey4_2,
        },
        <String, dynamic>{
          'title':
              '4.3. Condition Of Enclosure(S) In Terms Of Ip Rating Etc (416.2)',
          'form_key': formKey4_3,
        },
        <String, dynamic>{
          'title':
              '4.4 Condition Of Enclosure(S) In Terms Of Fire Rating Etc (421.1.201; 526.5)',
          'form_key': formKey4_4,
        },
        <String, dynamic>{
          'title':
              '4.5. Enclosure Not Damage or Deteriorated So As To Impair Safety \n(621.2)',
          'form_key': formKey4_5,
        },
        <String, dynamic>{
          'title':
              '4.6. Presence Of Main Linked Switch \n(As Required By 537.1.4)',
          'form_key': formKey4_6,
        },
        <String, dynamic>{
          'title':
              '4.7. Operation Of Main Switch - (Functional Check)  (612.13.2)',
          'form_key': formKey4_7,
        },
        <String, dynamic>{
          'title':
              '4.8. Manual Operation Of Circuit Breakers And RCDs To Prove Disconnection (643.10)',
          'form_key': formKey4_8,
        },
        <String, dynamic>{
          'title':
              '4.9. Correct Identification Of Circuit Details And Protective Device (514.8.1; 514.9.1)',
          'form_key': formKey4_9,
        },
        <String, dynamic>{
          'title':
              '4.10. Presence Of RCD six-monthly Test Notice, Where Required (514.12.2)',
          'form_key': formKey4_10,
        },
        <String, dynamic>{
          'title':
              '4.11. Presence Of Alternative Supply Warning Notice At or Near Consumer Unit/Distribution Board (514.15)',
          'form_key': formKey4_11,
        },
        <String, dynamic>{
          'title':
              '4.12. Presence Of Other Required Labelling (Please Specify) (Section 514)',
          'form_key': formKey4_12,
        },
        <String, dynamic>{
          'title':
              '4.13. Compatibility of Protective Device, Bases and Other Components; \nCorrect Type and Rating \n(No Signs of Unacceptable Thermal Damage, Arcing or Overheating) \n(411.3.2; 411.4; 411.5; 411.6; Sections 432, 433)',
          'form_key': formKey4_13,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '4.14',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          'title':
              '4.14. Single-Pole Switching Or Protective Devices In Line Conductor Only (132.14.1; 530.3.3)',
          'form_key': formKey4_14,
        },
        <String, dynamic>{
          'title':
              '4.15. Protection Against Mechanical Damage Where Cables Enter Consumer Unit/Distribution Board (522.8.1; 522.8.11)',
          'form_key': formKey4_15,
        },
        <String, dynamic>{
          'title':
              '4.16. Protection Against Electromagnetic Effects Where Cables Enter Consumer Unit/Distribution Board/Enclosures (521.5.1)',
          'form_key': formKey4_16,
        },
        <String, dynamic>{
          'title':
              '4.17. RCD(s) Provided For Fault Protection - Includes RCBOs (411.4.204; 411.5.2; 531.2)',
          'form_key': formKey4_17,
        },
        <String, dynamic>{
          'title':
              '4.18. RCD(S) Provided For Additional Protection/Requirements - Includes RCBOs (411.3.3; 415.1)',
          'form_key': formKey4_18,
        },
        <String, dynamic>{
          'title':
              '4.19. Confirmation Of Indication That SPD is Functional (651.4)',
          'form_key': formKey4_19,
        },
        <String, dynamic>{
          'title':
              '4.20. Confirmation That all Conductor Connections, Including Connections To Busbars, Are Correctly Located In Terminals And Are Tight And Secure (526.1)',
          'form_key': formKey4_20,
        },
        <String, dynamic>{
          'title':
              '4.21. Adequate Arrangements Where A Generating Set as a Switched Alternative To The Public Supply (551.6)',
          'form_key': formKey4_21,
        },
        <String, dynamic>{
          'title':
              '4.22. Adequate Arrangements Where A Generating Set Operates In Parallel With The Public Supply (551.7)',
          'form_key': formKey4_22,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '5.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          'title': '5.1. Identification Of Conductors (514.3.1)',
          'form_key': formKey5_1,
        },
        <String, dynamic>{
          'title':
              '5.2. Cables Correctly Supported Throughout Their Run (521.10.202; 522.8.5)',
          'form_key': formKey5_2,
        },
        <String, dynamic>{
          'title': '5.3. Condition Of Insulation Of Live Parts (416.1)',
          'form_key': formKey5_3,
        },
        <String, dynamic>{
          'title':
              '5.4. Non-Sheathed Cables Protected By Enclosure In Conduit, Ducting Or Trunking (521.10.1) (To Include The Integrity Of Conduit And Trunking Systems In Metallic And Plastic',
          'form_key': formKey5_4,
        },
        <String, dynamic>{
          'title':
              '5.5. Adequacy Of Cables Or Current-Carrying Capacity With Regard For The Type And Nature Of Installation (Section 523)',
          'form_key': formKey5_5,
        },
        <String, dynamic>{
          'title':
              '5.6. Co-ordination Between Conductors And Overload Protective Device (433.1; 533.2.1)',
          'form_key': formKey5_6,
        },
        <String, dynamic>{
          'title':
              '5.7. Adequacy Of Protective Devices: Type And Rated Current For Fault Protection (411.3)',
          'form_key': formKey5_7,
        },
        <String, dynamic>{
          'title':
              '5.8. Presence And Adequacy Of Circuit Protective Conductors (411.3.1; Section 543)',
          'form_key': formKey5_8,
        },
        <String, dynamic>{
          'title':
              '5.9 Wiring Systems(S) Appropriate For The Type And Nature Of The Installation And External Influences (Section 522)',
          'form_key': formKey5_9,
        },
        <String, dynamic>{
          'title':
              '5.10. Concealed Cables Installed In Prescribed Zones (See Section C in this Report: Extent And Limitations) (522.6.202)',
          'form_key': formKey5_10,
        },
        <String, dynamic>{
          'title':
              '5.11. Cables Concealed Under Floors, Above Ceilings, Or In Walls/ Partitions, Adequately Protected Against Damage (See Section C in this Report: Extent And Limitations) (522.6.204)',
          'form_key': formKey5_11,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '5.12',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          'title':
              '* For All Socket-Outlets Of Rating 32A Or Less, Unless And Exception Is Permitted (411.3.3) ',
          'form_key': formKey5_12_1,
        },
        <String, dynamic>{
          'title':
              '* For The Supply of Mobile Equipment Not Exceeding 32A Rating For Use Outdoors (411.3.3)',
          'form_key': formKey5_12_2,
        },
        <String, dynamic>{
          'title':
              '* For Cables Concealed In Walls at A Depth Of Less Than 50mm (522.6.202; 522.6.203)',
          'form_key': formKey5_12_3,
        },
        <String, dynamic>{
          'title':
              '* For Cables Concealed In Walls/Partitions Containing Metal Parts Regardless Of Depth (522.6.203)',
          'form_key': formKey5_12_4,
        },
        <String, dynamic>{
          'title':
              '* For Circuit Supply Luminaries within Domestic (Household) Premises (411.3.4)',
          'form_key': formKey5_12_5,
        },
        <String, dynamic>{
          'title':
              '5.13. Provision Of Fire Barriers, Sealing Arrangements And Protection Against Thermal Effects (Section 527) ',
          'form_key': formKey5_13,
        },
        <String, dynamic>{
          'title':
              '5.14. Band If Cables Segregated/Separated From Band I Cables (528.1)',
          'form_key': formKey5_14,
        },
        <String, dynamic>{
          'title':
              '5.15. Cables Segregated or Separated From Communications Cabling (528.2)',
          'form_key': formKey5_15,
        },
        <String, dynamic>{
          'title':
              '5.16. Cables Segregated or Separated From Non-Electrical Service (528.3)',
          'form_key': formKey5_16,
        },
      ],
    },
    <String, dynamic>{
      'head_label': '5.17',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          'title':
              '* Connections Soundly Made And Under No Undue Strain (526.6)',
          'form_key': formKey5_17_1,
        },
        <String, dynamic>{
          'title':
              '* No Basic Insulation Of A Conductor Visible Outside of The Enclosure (526.8) ',
          'form_key': formKey5_17_2,
        },
        <String, dynamic>{
          'title':
              '* Connections Of Live Conductors Adequately Enclosed (526.5)',
          'form_key': formKey5_17_3,
        },
        <String, dynamic>{
          'title':
              '* Adequately Connected At The Point Of Entry To Enclosure (Glands, Bushes etc.) (522.8.5)',
          'form_key': formKey5_17_4,
        },
        <String, dynamic>{
          'title':
              '5.18. Conditions Of Accessories Including Socket-Outlets, Switches And Joint Boxes (651.2 (v))',
          'form_key': formKey5_18,
        },
        <String, dynamic>{
          'title':
              '5.19. Suitability Of Accessories For External Influences (512.2)',
          'form_key': formKey5_19,
        },
        <String, dynamic>{
          'title':
              '5.20. Adequacy Of Working  Space/Accessibility To Equipment (132.12; 513.1)',
          'form_key': formKey5_20,
        },
        <String, dynamic>{
          'title':
              '5.21. Single-Pole Switching Or Protective Devices In Line Conductors Only (132.14.1, 530.3.2)',
          'form_key': formKey5_21,
        },
      ],
    },
    // 7
    <String, dynamic>{
      'head_label': '6.0',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          'title':
              '6.1. Additional Protection for All Circuits By A 30mA RCD (not applicable if design pre BS 7671)  (701.411.3.3)',
          'form_key': formKey6_1,
        },
        <String, dynamic>{
          'title':
              '6.2. Where Used as A Protective Measure, The Requirements For SELV or PELV have been met (701.414.4.5)',
          'form_key': formKey6_2,
        },
        <String, dynamic>{
          'title':
              '6.3. Shaver Supply Units Comply with BS EN 61558-2-5 Formerly BS 3535  (701.512.3)',
          'form_key': formKey6_3,
        },
        <String, dynamic>{
          'title':
              '6.4. Presence of Supplementary Bounding Conductors, Unless not Required by BS 7671:2018  (701.415.2)',
          'form_key': formKey6_4,
        },
        <String, dynamic>{
          'title':
              '6.5. Low Voltage (e.g 230 V) Socket-Outlets Sited at Least 2.5 m from zone 1  (701.512.2)',
          'form_key': formKey6_5,
        },
        <String, dynamic>{
          'title':
              '6.6. Suitability of The Equipment for External Influences for Installed Location in Term of IP Rating  (701.512.2)',
          'form_key': formKey6_6,
        },
        <String, dynamic>{
          'title':
              '6.7. Suitability of The Equipment for Installation in A Particular Zone  (701.512.3)',
          'form_key': formKey6_7,
        },
        <String, dynamic>{
          'title':
              '6.8. Suitability Of Current-Using Equipment For Particular Within The Location (701.55)',
          'form_key': formKey6_8,
        },
      ],
    },
    // 8
    <String, dynamic>{
      'head_label': 'input_na',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          'title': '8.2',
          'input_form_key': formKey8_2Input,
          'button_form_key': formKey8_2BTN,
        },
        <String, dynamic>{
          'title': '8.3',
          'input_form_key': formKey8_3Input,
          'button_form_key': formKey8_3BTN,
        },
        <String, dynamic>{
          'title': '8.4',
          'input_form_key': formKey8_4Input,
          'button_form_key': formKey8_4BTN,
        },
        <String, dynamic>{
          'title': '8.5',
          'input_form_key': formKey8_5Input,
          'button_form_key': formKey8_5BTN,
        },
        <String, dynamic>{
          'title': '8.6',
          'input_form_key': formKey8_6Input,
          'button_form_key': formKey8_6BTN,
        },
        <String, dynamic>{
          'title': '8.7',
          'input_form_key': formKey8_7Input,
          'button_form_key': formKey8_7BTN,
        },
      ],
    },
    <String, dynamic>{
      'head_label': 'input_na_part2',
      'data': <Map<String, dynamic>>[
        <String, dynamic>{
          'title': '8.8',
          'input_form_key': formKey8_8Input,
          'button_form_key': formKey8_8BTN,
        },
        <String, dynamic>{
          'title': '8.9',
          'input_form_key': formKey8_9Input,
          'button_form_key': formKey8_9BTN,
        },
        <String, dynamic>{
          'title': '8.10',
          'input_form_key': formKey8_10Input,
          'button_form_key': formKey8_10BTN,
        },
        <String, dynamic>{
          'title': '8.11',
          'input_form_key': formKey8_11Input,
          'button_form_key': formKey8_11BTN,
        },
        <String, dynamic>{
          'title': '8.12',
          'input_form_key': formKey8_12Input,
          'button_form_key': formKey8_12BTN,
        },
        <String, dynamic>{
          'title': '8.13',
          'input_form_key': formKey8_13Input,
          'button_form_key': formKey8_13BTN,
        },
        <String, dynamic>{
          'title': '8.14',
          'input_form_key': formKey8_14Input,
          'button_form_key': formKey8_14BTN,
        },
        <String, dynamic>{
          'title': '8.15',
          'input_form_key': formKey8_15Input,
          'button_form_key': formKey8_15BTN,
        },
        <String, dynamic>{
          'title': '8.16',
          'input_form_key': formKey8_16Input,
          'button_form_key': formKey8_16BTN,
        },
        <String, dynamic>{
          'title': '8.17',
          'input_form_key': formKey8_17Input,
          'button_form_key': formKey8_17BTN,
        },
        <String, dynamic>{
          'title': '8.18',
          'input_form_key': formKey8_18Input,
          'button_form_key': formKey8_18BTN,
        },
        <String, dynamic>{
          'title': '8.19',
          'input_form_key': formKey8_19Input,
          'button_form_key': formKey8_19BTN,
        },
        <String, dynamic>{
          'title': '8.20',
          'input_form_key': formKey8_20Input,
          'button_form_key': formKey8_20BTN,
        },
        <String, dynamic>{
          'title': '8.21',
          'input_form_key': formKey8_21Input,
          'button_form_key': formKey8_21BTN,
        },
        <String, dynamic>{
          'title': '8.22',
          'input_form_key': formKey8_22Input,
          'button_form_key': formKey8_22BTN,
        },
        <String, dynamic>{
          'title': '8.23',
          'input_form_key': formKey8_23Input,
          'button_form_key': formKey8_23BTN,
        },
        <String, dynamic>{
          'title': '8.24',
          'input_form_key': formKey8_24Input,
          'button_form_key': formKey8_24BTN,
        },
        <String, dynamic>{
          'title': '8.25',
          'input_form_key': formKey8_25Input,
          'button_form_key': formKey8_25BTN,
        },
        <String, dynamic>{
          'title': '8.26',
          'input_form_key': formKey8_26Input,
          'button_form_key': formKey8_26BTN,
        },
        <String, dynamic>{
          'title': '8.27',
          'input_form_key': formKey8_27Input,
          'button_form_key': formKey8_27BTN,
        },
        <String, dynamic>{
          'title': '8.28',
          'input_form_key': formKey8_28Input,
          'button_form_key': formKey8_28BTN,
        },
        <String, dynamic>{
          'title': '8.29',
          'input_form_key': formKey8_29Input,
          'button_form_key': formKey8_29BTN,
        },
        <String, dynamic>{
          'title': '8.30',
          'input_form_key': formKey8_30Input,
          'button_form_key': formKey8_30BTN,
        },
        <String, dynamic>{
          'title': '8.31',
          'input_form_key': formKey8_31Input,
          'button_form_key': formKey8_31BTN,
        },
        <String, dynamic>{
          'title': '8.32',
          'input_form_key': formKey8_32Input,
          'button_form_key': formKey8_32BTN,
        },
        <String, dynamic>{
          'title': '8.33',
          'input_form_key': formKey8_33Input,
          'button_form_key': formKey8_33BTN,
        },
      ],
    },
  ];

  Map<String, dynamic> gazSafetyData = <String, dynamic>{
    'remedial_works_completed': false,
    // declaration section
    formKeyEICRdeclaration: <String, dynamic>{
      formKeyInspectedName: '',
      formKeyInspectedDate: '',
      formKeyInspectedPosition: '',
      formKeyReportContractor: '',
      formKeyReportName: '',
      formKeyReportDate: '',
    },
    // Page 1
    formKeyReasonProducingA: '',
    formKeyDateTestingA: '',
    formKeyOccupierB: '',
    formKeyDomesticB: 'N/A',
    formKeyCommercialB: 'N/A',
    formKeyIndustrialB: 'N/A',
    formKeyOtherB: 'N/A',
    formKeyIfOtherB: '',
    formKeyEstimatedAgeB: '',
    formKeyEvidenceYesB: 'N/A',
    formKeyEvidenceNoB: 'N/A',
    formKeyEvidenceNotApparentB: 'N/A',
    formKeyIfYesB: '',
    formKeyInstallationAvailableYesB: 'N/A',
    formKeyInstallationAvailableNoB: 'N/A',
    formKeyDateLastInspectionB: '',
    // Page 2
    formKeyExtentElectricalC: '',
    formKeyAgreedLimitationsC: '',
    formKeyAgreedLimitationsWithC: '',
    formKeyPositionC: '',
    formKeyOperationalLimitationC: '',
    formKeyGeneralConditionD: '',
    formKeyOverallAssessmentD: '',
    formKeyAlternativeSourceD: 'N/A',
    //
    formKeyRecommendationsE: '',
    formKeyScheduleInspectionE: 'N/A',
    formKeyScheduleTestE: 'N/A',
    // Page 3
    formKeyConfirmationSupplyF: 'N/A',
    formKeyTNCSF: 'N/A',
    formKeyTNSF: 'N/A',
    formKeyTTF: 'N/A',
    formKeyTNCF: 'N/A',
    formKeyITF: 'N/A',
    formKeyACF: 'N/A',
    formKeyDCF: 'N/A',
    formKey1Phase2WireF: 'N/A',
    formKey1Phase3WireF: 'N/A',
    formKey2WireF: 'N/A',
    formKey2Phase3WireF: 'N/A',
    formKey3WireF: 'N/A',
    formKey3Phase3WireF: 'N/A',
    formKey3Phase4WireF: 'N/A',
    formKeyOtherF: 'N/A',
    formKeyNominalVoltageF: '',
    formKeyNominalFrequencyFF: '50',
    formKeyEarthFaultLoopF: '',
    formKeyPFC: '',
    formKeyBSF: '',
    formKeyTypeF: 'N/A',
    formKeyRatedCurrentF: 'N/A',
    formKeyShortCircuitCapacityF: 'N/A',
    // Page 5
    formKeyDistributorFacilityG: 'N/A',
    formKeyInstallationEarthElectrodeG: 'N/A',
    formKeyTypeG: '',
    formKeyElectrodeResistanceG: '',
    formKeyLocationTheEarthElectrodeG: '',
    formKeyConductorMaterialH1: 'Copper',
    formKeyConductorCsaH1: '',
    formKeyContinuityCheckH1: 'N/A',
    formKeyConductorMaterialH2: 'Copper',
    formKeyConductorCsaH2: '',
    formKeyContinuityCheckH2: 'N/A',
    formKeyWaterInstallationPipesH: 'N/A',
    formKeyGasInstallationH: 'N/A',
    formKeyOilInstallationPipesH: 'N/A',
    formKeyStructuralSteelH: 'N/A',
    formKeyOtherServicesH: 'N/A',
    // Page 6
    formKeyTypeBsI: '',
    formKeyNoPolesI: '',
    formKeySupplyConductorMaterialI: 'Copper',
    formKeySupplyConductorCsaI: '',
    formKeyVoltageRatingI: '',
    formKeyRatedCurrentI: '',
    formKeyRcdOperationCurrentI: 'N/A',
    formKeyRatedTimeDelayI: 'N/A',
    formKeyRcdOperationTimeI: 'N/A',
    // Page 8 - 16
    formKeyEarthFaultJ: '',
    formKeyInsulationResistanceJ: '',
    formKeyContinuityJ: '',
    formKeyRcdJ: '',
    formKeyMftJ: '',
    formKeyOtherJ: '',
    // Page 9 N/A Buttons
    formKey1_1Cable: 'N/A',
    formKey1_2Head: 'N/A',
    formKey1_3Arrangement: 'N/A',
    formKey1_4Consumer: 'N/A',
    formKey1_5Isolator: 'N/A',
    formKey1_6Appropriate: 'N/A',
    formKey2_0Generators: 'N/A',
    formKey3_1: 'N/A',
    formKey3_2: 'N/A',
    formKey3_3: 'N/A',
    formKey3_4: 'N/A',
    formKey3_5: 'N/A',
    formKey3_6: 'N/A',
    formKey3_7: 'N/A',
    formKey3_8: 'N/A',
    formKey4_1: 'N/A',
    formKey4_2: 'N/A',
    formKey4_3: 'N/A',
    formKey4_4: 'N/A',
    formKey4_5: 'N/A',
    formKey4_6: 'N/A',
    formKey4_7: 'N/A',
    formKey4_8: 'N/A',
    formKey4_9: 'N/A',
    formKey4_10: 'N/A',
    formKey4_11: 'N/A',
    formKey4_12: 'N/A',
    formKey4_13: 'N/A',
    formKey4_14: 'N/A',
    formKey4_15: 'N/A',
    formKey4_16: 'N/A',
    formKey4_17: 'N/A',
    formKey4_18: 'N/A',
    formKey4_19: 'N/A',
    formKey4_20: 'N/A',
    formKey4_21: 'N/A',
    formKey4_22: 'N/A',
    formKey5_1: 'N/A',
    formKey5_2: 'N/A',
    formKey5_3: 'N/A',
    formKey5_4: 'N/A',
    formKey5_5: 'N/A',
    formKey5_6: 'N/A',
    formKey5_7: 'N/A',
    formKey5_8: 'N/A',
    formKey5_9: 'N/A',
    formKey5_10: 'N/A',
    formKey5_11: 'N/A',
    formKey5_12_1: 'N/A',
    formKey5_12_2: 'N/A',
    formKey5_12_3: 'N/A',
    formKey5_12_4: 'N/A',
    formKey5_12_5: 'N/A',
    formKey5_13: 'N/A',
    formKey5_14: 'N/A',
    formKey5_15: 'N/A',
    formKey5_16: 'N/A',
    formKey5_17_1: 'N/A',
    formKey5_17_2: 'N/A',
    formKey5_17_3: 'N/A',
    formKey5_17_4: 'N/A',
    formKey5_18: 'N/A',
    formKey5_19: 'N/A',
    formKey5_20: 'N/A',
    formKey5_21: 'N/A',
    formKey6_1: 'N/A',
    formKey6_2: 'N/A',
    formKey6_3: 'N/A',
    formKey6_4: 'N/A',
    formKey6_5: 'N/A',
    formKey6_6: 'N/A',
    formKey6_7: 'N/A',
    formKey6_8: 'N/A',
    formKey7_1: 'N/A',
    formKey8_1: 'N/A',
    //*--*//
    formKey8_2Input: '',
    formKey8_2BTN: 'N/A',
    formKey8_3Input: '',
    formKey8_3BTN: 'N/A',
    formKey8_4Input: '',
    formKey8_4BTN: 'N/A',
    formKey8_5Input: '',
    formKey8_5BTN: 'N/A',
    formKey8_6Input: '',
    formKey8_6BTN: 'N/A',
    formKey8_7Input: '',
    formKey8_7BTN: 'N/A',
    formKey8_8Input: '',
    formKey8_8BTN: 'N/A',
    formKey8_9Input: '',
    formKey8_9BTN: 'N/A',
    formKey8_10Input: '',
    formKey8_10BTN: 'N/A',
    formKey8_11Input: '',
    formKey8_11BTN: 'N/A',
    formKey8_12Input: '',
    formKey8_12BTN: 'N/A',
    formKey8_13Input: '',
    formKey8_13BTN: 'N/A',
    formKey8_14Input: '',
    formKey8_14BTN: 'N/A',
    formKey8_15Input: '',
    formKey8_15BTN: 'N/A',
    formKey8_16Input: '',
    formKey8_16BTN: 'N/A',
    formKey8_17Input: '',
    formKey8_17BTN: 'N/A',
    formKey8_18Input: '',
    formKey8_18BTN: 'N/A',
    formKey8_19Input: '',
    formKey8_19BTN: 'N/A',
    formKey8_20Input: '',
    formKey8_20BTN: 'N/A',
    formKey8_21Input: '',
    formKey8_21BTN: 'N/A',
    formKey8_22Input: '',
    formKey8_22BTN: 'N/A',
    formKey8_23Input: '',
    formKey8_23BTN: 'N/A',
    formKey8_24Input: '',
    formKey8_24BTN: 'N/A',
    formKey8_25Input: '',
    formKey8_25BTN: 'N/A',
    formKey8_26Input: '',
    formKey8_26BTN: 'N/A',
    formKey8_27Input: '',
    formKey8_27BTN: 'N/A',
    formKey8_28Input: '',
    formKey8_28BTN: 'N/A',
    formKey8_29Input: '',
    formKey8_29BTN: 'N/A',
    formKey8_30Input: '',
    formKey8_30BTN: 'N/A',
    formKey8_31Input: '',
    formKey8_31BTN: 'N/A',
    formKey8_32Input: '',
    formKey8_32BTN: 'N/A',
    formKey8_33Input: '',
    formKey8_33BTN: 'N/A',
    allDistributionBoardData: <dynamic>[],
    allObservationData: <dynamic>[],
    formKeyRemarks: '',
  };

  void onChangeFormDataValue(String? key, dynamic value) {
    gazSafetyData[key!] = value;
  }

  //*----------Section E Part 5---------*//
  void onConfirmDate(DateTime dateTime) {
    gazSafetyData[formKeyRecommendationsE] =
        dateTime.toString().split(' ').first;
    update();
  }

  //* Circuit - Page Numbers *//
  String pagesNum() {
    //   if (isTemplate) {
    //     if (selectedId == listFormSections.length - 1) {
    //       return '${listFormSections.length - 1}/${listFormSections.length - 1}';
    //     } else {
    //       return '${selectedId + 1}/${listFormSections.length - 1}';
    //     }
    //   } else {
    //     if (selectedId == listFormSections.length) {
    //       return '${listFormSections.length}/${listFormSections.length}';
    //     } else {
    //       return '${selectedId + 1}/${listFormSections.length}';
    //     }
    //   }
    // }

    return '20/20';
  }
}
