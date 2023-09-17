import '../../general_exports.dart';

class Invoices extends StatelessWidget {
  const Invoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Header(
        title: 'Invoices',
        withBack: false,
      ),
      body: GetBuilder<InvoicesController>(
        init: InvoicesController(),
        builder: (InvoicesController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  0.03.boxHeight,
                  SearchWithWooz(
                    searchWithWoozController: controller.woozController,
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
