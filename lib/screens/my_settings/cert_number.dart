import '../../general_exports.dart';

class CertNumber extends StatelessWidget {
  const CertNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Important Numbers',
      ),
      body: CommonContainer(
        style: appContainerStyles.containerStyles,
        child: Column(
          children: <Widget>[
            0.02.boxHeight,
            
          ],
        ),
      ),
    );
  }
}
