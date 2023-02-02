import '../../general_exports.dart';

class Invoices extends StatelessWidget {
  const Invoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(
        title: 'Invoices',
        withBack: false,
      ),
      body: const Center(
        child: CommonText('Invoices Screen'),
      ),
    );
  }
}
