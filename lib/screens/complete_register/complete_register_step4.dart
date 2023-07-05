import '../../general_exports.dart';

class CompleteRegisterSteps4 extends StatelessWidget {
  const CompleteRegisterSteps4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteRegisterController>(
      init: CompleteRegisterController(),
      builder: (CompleteRegisterController controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonContainer(
                borderRadius: 0.01,
                backgroundColor: Colors.grey[200],
                paddingHorizontal: 0.02,
                paddingVertical: 0.01,
                child: CommonText(
                  "We'll now need your company address. This address will be displayed on all the certificates you create, ensuring your clients can easily contact you.",
                  textAlign: TextAlign.start,
                  fontSize: fontH3,
                  fontColor: Colors.grey[600],
                ),
              ),
              SizedBox(
                height: 0.02.flexHeight,
              ),
              CommonContainer(
                borderRadius: 0.01,
                backgroundColor: Colors.grey[200],
                paddingHorizontal: 0.02,
                paddingVertical: 0.01,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CommonText(
                      "Please start by entering your company's postcode *",
                      marginTop: 0.01,
                      marginBottom: 0.01,
                      textAlign: TextAlign.start,
                      fontSize: fontBody,
                      fontColor: Colors.grey[600],
                    ),
                    CommonInput(
                      hint: "Type The Postcode Of The Company's ",
                      enabled: false,
                      onTap: () => Get.bottomSheet(
                        const SelectCompanyType(),
                        isScrollControlled: true,
                      ),
                      hintStyle: const TextStyle(fontSize: fontH4),
                      prefix: const Icon(Icons.search),
                      fillColor: Colors.white,
                      borderColor: Colors.transparent,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    CommonText(
                      ' Manual Address Entry',
                      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                      rowMainAxisSize: MainAxisSize.max,
                      rightChild: Switch(
                        value: controller.isSwitch,
                        onChanged: (bool value) {
                          controller.updateSwitch(value);
                        },
                        activeTrackColor: Colors.green,
                        inactiveTrackColor: Colors.grey[400],
                        inactiveThumbColor: Colors.white,
                      ),
                    ),
                    if (controller.isSwitch == true)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const CommonInput(
                            topLabelText: 'Street No  & Name',
                            hint: '43 Downend Road',
                            fillColor: Colors.white,
                            borderColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          const CommonInput(
                            topLabelText: 'City',
                            hint: 'Bristol',
                            fillColor: Colors.white,
                            borderColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          const CommonInput(
                            topLabelText: 'State/Province',
                            hint: 'England',
                            fillColor: Colors.white,
                            borderColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          const CommonInput(
                            topLabelText: 'Postcode',
                            hint: 'BS16 5UF',
                            fillColor: Colors.white,
                            borderColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          const CommonInput(
                            topLabelText: 'Country',
                            hint: 'United Kingdom',
                            fillColor: Colors.white,
                            borderColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.02.flexHeight,
                          ),
                          // Divider(
                          //   thickness: 2,
                          //   color: Colors.grey[400],
                          // ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SelectCompanyType extends StatelessWidget {
  const SelectCompanyType({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (RegisterController controller) {
        return BottomSheetContainer(
          title: "Postcode Of The Company's ",
          responsiveContent: true,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.035),
                const CommonInput(
                  hint: "Type The Postcode Of The Company's ",
                  enabled: false,
                  hintStyle: TextStyle(fontSize: fontH4),
                  prefix: Icon(Icons.search),
                  fillColor: Colors.white,
                  borderColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                SizedBox(height: DEVICE_HEIGHT * 0.01),
                const Divider(),
                SizedBox(height: DEVICE_HEIGHT * 0.02),
              ],
            ),
          ),
        );
      },
    );
  }
}
