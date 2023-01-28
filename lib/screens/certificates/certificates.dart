import '../../general_exports.dart';

class Certificates extends StatelessWidget {
  const Certificates({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CertificatesController>(
      init: certificatesController,
      builder: (CertificatesController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: 'Certificates',
            withBack: false,
          ),
          body: const Center(
            child: CommonText('Certificates Screen'),
          ),
        );
      },
    );
  }
}
