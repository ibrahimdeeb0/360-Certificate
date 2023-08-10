import '../../../../general_exports.dart';

class EditCertNote extends StatelessWidget {
  const EditCertNote({
    super.key,
    this.noteData,
  });
  final dynamic noteData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Edit Note',
        withShadow: true,
      ),
      body: GetBuilder<EditCertNoteController>(
        init: EditCertNoteController(),
        builder: (EditCertNoteController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            paddingTop: 0.02,
            child: Column(
              children: <Widget>[
                FormAddNoteCard(),
              ],
            ),
          );
        },
      ),
    );
  }
}
