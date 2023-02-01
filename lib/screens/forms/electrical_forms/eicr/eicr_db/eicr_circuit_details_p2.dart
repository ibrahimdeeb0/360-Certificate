import '../../../../../general_exports.dart';

class CircuitDetailsP2 extends StatelessWidget {
  const CircuitDetailsP2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DistributionBoardController>(
      init: DistributionBoardController(),
      builder: (DistributionBoardController controller) {
        return CommonContainer(
          style: const CommonContainerModel(
            paddingHorizontal: 0.04,
          ),
          child: Column(
            children: <Widget>[
              CommonContainer(
                style: appContainerStyles.bottomBorderContainer
                    .copyWith(paddingHorizontal: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CommonText(
                      'Continuity Ω',
                      rowMainAxisSize: MainAxisSize.max,
                      fontWeight: FontWeight.bold,
                      containerStyle: CommonContainerModel(
                        marginBottom: 0.015,
                      ),
                    ),
                    const CommonText(
                      'Ring final Circuit only (measured end to end)',
                      textAlign: TextAlign.start,
                      columnCrossAxisAlignment: CrossAxisAlignment.start,
                      rowCrossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    SizedBox(height: DEVICE_HEIGHT * 0.03),
                    SmallInputField(
                      title: 'R1',
                      value: controller.childCircuitData[formKeyR1E],
                      onChanged: (dynamic value) =>
                          controller.onChangeChildeDbValues(formKeyR1E, value),
                      keyboardType: TextInputType.number,
                    ),
                    SmallInputField(
                      title: 'Rn',
                      value: controller.childCircuitData[formKeyRnE],
                      onChanged: (dynamic value) =>
                          controller.onChangeChildeDbValues(formKeyRnE, value),
                      keyboardType: TextInputType.number,
                    ),
                    SmallInputField(
                      title: 'R2',
                      suffix: const CommonText('Ω'),
                      onChanged: (dynamic value) =>
                          controller.onChangeChildeDbValues(formKeyR2E, value),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              CommonContainer(
                style: appContainerStyles.bottomBorderContainer
                    .copyWith(paddingHorizontal: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CommonText(
                      'All Circuits',
                      rowMainAxisSize: MainAxisSize.max,
                      fontWeight: FontWeight.bold,
                      containerStyle: CommonContainerModel(
                        marginBottom: 0.015,
                      ),
                    ),
                    const CommonText(
                      'at least one column to be completed',
                    ),
                    SizedBox(height: DEVICE_HEIGHT * 0.03),
                    SmallInputField(
                      title: 'R1 + R2',
                      value: controller.childCircuitData[formKeyR1R2F],
                      onChanged: (dynamic value) => controller
                          .onChangeChildeDbValues(formKeyR1R2F, value),
                      keyboardType: TextInputType.number,
                    ),
                    SmallInputField(
                      title: 'R2',
                      value: controller.childCircuitData[formKeyR2F],
                      onChanged: (dynamic value) =>
                          controller.onChangeChildeDbValues(formKeyR2F, value),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              CommonContainer(
                style: appContainerStyles.bottomBorderContainer
                    .copyWith(paddingHorizontal: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CommonText(
                      'Insulation Resistance',
                      rowMainAxisSize: MainAxisSize.max,
                      fontWeight: FontWeight.bold,
                      containerStyle: CommonContainerModel(
                        marginBottom: 0.015,
                      ),
                    ),
                    SmallInputField(
                      title: 'IR Test Voltage',
                      suffix: const CommonText('v'),
                      onChanged: (dynamic value) => controller
                          .onChangeChildeDbValues(formKeyIrTestVoltageF, value),
                      keyboardType: TextInputType.number,
                    ),
                    SmallInputField(
                      title: 'Live/Live',
                      suffix: const CommonText('M Ω'),
                      onChanged: (dynamic value) => controller
                          .onChangeChildeDbValues(formKeyLiveLiveF, value),
                      keyboardType: TextInputType.number,
                    ),
                    SmallInputField(
                      title: 'Live/Neutral',
                      suffix: const CommonText('M Ω'),
                      onChanged: (dynamic value) => controller
                          .onChangeChildeDbValues(formKeyLiveNeutralF, value),
                      keyboardType: TextInputType.number,
                    ),
                    SmallInputField(
                      title: 'Live/Earth',
                      suffix: const CommonText('M Ω'),
                      onChanged: (dynamic value) => controller
                          .onChangeChildeDbValues(formKeyLiveEarthF, value),
                      keyboardType: TextInputType.number,
                    ),
                    SmallInputField(
                      title: 'Neutral/Earth',
                      suffix: const CommonText('M Ω'),
                      onChanged: (dynamic value) => controller
                          .onChangeChildeDbValues(formKeyNeutralEarthF, value),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              CommonContainer(
                style: appContainerStyles.bottomBorderContainer
                    .copyWith(paddingHorizontal: 0.0),
                child: Column(
                  children: <Widget>[
                    FormToggleButton(
                      title: 'Polarity',
                      toggleType: FormToggleType.passFailed,
                      value: controller.childCircuitData[formKeyPolarityG],
                      onChangeValue: (dynamic value) {
                        controller.onChangeChildeDbValues(
                            formKeyPolarityG, value);
                      },
                    ),
                  ],
                ),
              ),
              CommonContainer(
                style: appContainerStyles.bottomBorderContainer
                    .copyWith(paddingHorizontal: 0.0),
                child: Column(
                  children: <Widget>[
                    SmallInputField(
                      title: 'Maximum Measured (Ω)',
                      suffix: const CommonText('Ω'),
                      onChanged: (dynamic value) => controller
                          .onChangeChildeDbValues(formKeyNeutralEarthF, value),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              CommonContainer(
                style: appContainerStyles.bottomBorderContainer
                    .copyWith(paddingHorizontal: 0.0),
                child: Column(
                  children: <Widget>[
                    const CommonText(
                      'RCD',
                      rowMainAxisSize: MainAxisSize.max,
                      fontWeight: FontWeight.bold,
                      containerStyle: CommonContainerModel(
                        marginBottom: 0.015,
                      ),
                    ),
                    SmallInputField(
                      title: '*Disconnection Time',
                      suffix: const CommonText('Ω'),
                      onChanged: (dynamic value) =>
                          controller.onChangeChildeDbValues(
                              formKeyDisconnectionTimeI, value),
                      keyboardType: TextInputType.number,
                    ),
                    FormToggleButton(
                      title: 'Test Button / Functionality',
                      toggleType: FormToggleType.passFailed,
                      value: controller.childCircuitData[formKeyTestButtonI],
                      onChangeValue: (dynamic value) {
                        controller.onChangeChildeDbValues(
                            formKeyTestButtonI, value);
                      },
                    ),
                  ],
                ),
              ),
              CommonContainer(
                style: appContainerStyles.bottomBorderContainer
                    .copyWith(paddingHorizontal: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CommonText(
                      'AFDD',
                      rightChild: const CommonText(
                        '*Arc Fault Detection Device',
                        fontSize: fontH5,
                        containerStyle: CommonContainerModel(marginLeft: 0.02),
                      ),
                      style: appTextStyles.h3StyleBlack().copyWith(
                            rowMainAxisSize: MainAxisSize.max,
                            fontFamily: 'outfitBold',
                          ),
                      containerStyle: const CommonContainerModel(
                        marginBottom: 0.02,
                      ),
                    ),
                    FormToggleButton(
                      title: 'Test Button / Functionality',
                      toggleType: FormToggleType.passFailed,
                      value: controller.childCircuitData[formKeyTestButtonJ],
                      onChangeValue: (dynamic value) {
                        controller.onChangeChildeDbValues(
                            formKeyTestButtonJ, value);
                      },
                    ),
                    const CommonText(
                      '*Not All AFDD have a test button',
                      fontSize: fontH5,
                    ),
                  ],
                ),
              ),
              CommonContainer(
                style: CommonContainerModel(
                  marginTop: 0.03,
                  marginBottom: 0.01,
                  paddingVertical: 0.01,
                  borderWidth: 1,
                  borderRadius: 0.03,
                  width: 1,
                  height: 0.08,
                  backgroundColor: Color(AppColors.textGrey).withOpacity(0.1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      imageCircuitElectrical,
                      width: DEVICE_WIDTH * 0.16,
                      height: DEVICE_HEIGHT * 0.06,
                    ),
                    CommonText(
                      'Mark Circuit as Complete?',
                      fontColor: AppColors.textGrey,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: DEVICE_WIDTH * 0.1),
                      child: Switch(
                        activeColor: Color(AppColors.primary),
                        activeTrackColor:
                            Color(AppColors.primary).withOpacity(0.5),
                        inactiveThumbColor: Colors.blueGrey.shade600,
                        inactiveTrackColor: Colors.grey.shade400,
                        splashRadius: 50.0,
                        value: controller.childCircuitData['mark_as_completed'],
                        onChanged: (bool value) {
                          controller.childCircuitData['mark_as_completed'] =
                              value;
                          controller.update();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: DEVICE_HEIGHT * 0.02),
            ],
          ),
        );
      },
    );
  }
}
