import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import '../../../general_exports.dart';

class ShowPdf extends StatelessWidget {
  const ShowPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CertificateDetailsController>(
      init: CertificateDetailsController(),
      builder: (CertificateDetailsController controller) {
        return Scaffold(
          body: Center(
            child: PDFViewer(document: controller.pdf),
          ),
        );
      },
    );
  }
}
