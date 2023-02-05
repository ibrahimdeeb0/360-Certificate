import '../../general_exports.dart';

class Customers extends StatelessWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: GetBuilder<CustomersController>(
        init: CustomersController(),
        builder: (CustomersController controller) {
          return const Center(child: CommonText('Customers Screen'));
        },
      ),
    );
  }
}
