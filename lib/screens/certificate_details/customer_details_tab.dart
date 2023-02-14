import '../../general_exports.dart';

class CustomerDetailsTab extends StatelessWidget {
  const CustomerDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommonContainer(
          style: appContainerStyles.cardStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CertTitleItem(
                title: 'Company/Customer Name',
                subTitle: 'EICR',
              ),
              const CertTitleItem(
                title: 'Street No & Name',
                subTitle: '14 Orchard St, Bristol BS1 5EH',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  CertTitleItem(
                    title: 'City',
                    subTitle: 'London',
                  ),
                  CertTitleItem(
                    title: 'Country',
                    subTitle: 'UK',
                  ),
                  SizedBox(),
                ],
              ),
              const CertTitleItem(
                title: 'Postcode',
                subTitle: '00692',
              ),
              const CertTitleItem(
                title: 'Email',
                subTitle: 'Ahmed@Gmail.Com',
              ),
              CommonContainer(
                onPress: () {},
                touchEffect: TouchableEffect(type: TouchTypes.opacity),
                marginVertical: 0.015,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    CertTitleItem(
                      title: 'Payment Terms',
                      subTitle: 'Due Before Cert',
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
              CommonContainer(
                onPress: () {},
                touchEffect: TouchableEffect(type: TouchTypes.opacity),
                marginBottom: 0.015,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    CertTitleItem(
                      title: 'When to send the invoice',
                      subTitle: 'Per Week',
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
              const CertTitleItem(
                title: 'Overdue Amount ',
                subTitle: '3',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
