import '../../../general_exports.dart';

class PayForSubscribe extends StatelessWidget {
  const PayForSubscribe({super.key, this.certType, this.planeType, this.price});

  final String? certType;
  final String? planeType;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: GetBuilder<PayForSubscribeController>(
        init: PayForSubscribeController(),
        builder: (PayForSubscribeController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CommonContainer(
                    style: appContainerStyles.cardStyle,
                    width: 0.0,
                    child: Column(
                      children: <Widget>[
                        CommonText(
                          'Subscribe to $certType',
                          fontSize: fontH2,
                          marginBottom: 0.01,
                          fontColor: Colors.grey[700],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CommonText(
                              '$price',
                              leftChild: CommonText(
                                '£',
                                marginHorizontal: 0.01,
                                fontSize: fontHeader,
                                fontWeight: FontWeight.bold,
                                fontColor: AppColors.primary,
                              ),
                              letterSpacing: 1.5,
                              fontSize: fontHeader,
                              fontWeight: FontWeight.bold,
                              fontColor: AppColors.primary,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CommonText(
                                'Per ${planeType!.capitalize}',
                                fontSize: fontH3,
                                marginHorizontal: 0.02,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CommonInput(
                    topLabelText: 'Your Email',
                    hint: 'Enter Your Email',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    marginBottom: 0.02,
                    onChanged: controller.onChangeInputs,
                    enabled: false,
                  ),
                  CommonContainer(
                    style: appContainerStyles.cardStyle,
                    backgroundColor: Colors.grey.withOpacity(0.15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonInput(
                          topLabelText: "Card Information's",
                          hint: '1234  1234  1234  1234',
                          controller: controller.cardNumbController,
                          keyboardType: TextInputType.phone,
                          onChanged: controller.onChangeInputs,
                          textInputFormatters: [CardNumberInputFormatter()],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CommonInput(
                              topLabelText: 'Expiry Month',
                              hint: 'MM',
                              width: 0.38,
                              controller: controller.expireMonthController,
                              keyboardType: TextInputType.datetime,
                              onChanged: controller.onChangeInputs,
                            ),
                            const Align(
                              alignment: AlignmentDirectional.center,
                              child: CommonText(
                                '/',
                                // fontWeight: FontWeight.bold,
                                fontSize: 30,
                                marginTop: 0.04,
                                marginHorizontal: 0.02,
                              ),
                            ),
                            CommonInput(
                              topLabelText: 'Expiry Year',
                              hint: 'YYYY',
                              width: 0.38,
                              controller: controller.expireYearController,
                              keyboardType: TextInputType.datetime,
                              onChanged: controller.onChangeInputs,
                            ),
                          ],
                        ),
                        CommonInput(
                          topLabelText: 'CVC',
                          hint: 'CVC',
                          width: 0.38,
                          controller: controller.cvcController,
                          keyboardType: TextInputType.phone,
                          onChanged: controller.onChangeInputs,
                        ),
                      ],
                    ),
                  ),
                  CommonInput(
                    topLabelText: 'Name on card',
                    hint: 'Enter Name on card',
                    marginBottom: 0.02,
                    controller: controller.nameCardController,
                    keyboardType: TextInputType.name,
                    onChanged: controller.onChangeInputs,
                  ),
                  CommonInput(
                    topLabelText: 'Country or region',
                    hint: 'United Kingdom  (UK)',
                    value: 'United Kingdom  (UK)',
                    controller: controller.countryController,
                    keyboardType: TextInputType.name,
                    onChanged: controller.onChangeInputs,
                    marginBottom: 0.03,
                    enabled: false,
                  ),
                  CommonContainer(
                    width: 1,
                    paddingRight: 0.03,
                    paddingBottom: 0.015,
                    borderRadius: 0.02,
                    marginBottom: 0.02,
                    backgroundColor: Colors.grey.withOpacity(0.15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          onPressed: controller.onToggleSaveCardInfo,
                          icon: controller.isSaveCardInfo
                              ? const Icon(Icons.check_box)
                              : const Icon(Icons.check_box_outline_blank),
                        ),
                        CommonText(
                          'Securely save my Information for I-click checkout',
                          textAlign: TextAlign.start,
                          marginBottom: 0.01,
                          bottomChild: CommonText(
                            'Pay faster on Harry Mied and everywhere links is accepted',
                            textAlign: TextAlign.start,
                            fontSize: fontH3,
                            fontColor: Colors.grey[600],
                          ),
                          containerStyle: const CommonContainerModel(
                            width: 0.75,
                            paddingTop: 0.015,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CommonButton(
                    onPress: controller.onPressComplete,
                    text: 'Subscribe',
                    marginVertical: 0.01,
                  ),
                  CommonText(
                    'By confirming your subscription, you allow Harry Mied to charge your card for this payment and future payments in accordance with their terms. You cen always cancel your subscription.',
                    fontColor: Colors.grey[700],
                    fontSize: fontH3,
                    marginTop: 0.01,
                    marginBottom: 0.02,
                  ),
                  const CommonText(
                    'Terms privacy',
                    fontSize: fontH3,
                    marginBottom: 0.04,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
