import '../../general_exports.dart';

enum NoteType {
  noteNew,
  noteUpdate,
}

class NotesTab extends StatelessWidget {
  const NotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CertificateDetailsController>(
      init: CertificateDetailsController(),
      builder: (CertificateDetailsController controller) {
        return Column(
          children: <Widget>[
            CommonText(
              'Add New Note',
              onPress: () => Get.toNamed(
                routeAddNewNote,
                arguments: <String, dynamic>{
                  keyId: controller.certId,
                  keyStatus: NoteType.noteNew,
                },
              ),
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              rightChild: const Icon(Icons.add_circle_outline),
              containerStyle: CommonContainerModel(
                width: 1,
                backgroundColor: Color(AppColors.primary).withOpacity(0.3),
                paddingHorizontal: 0.03,
                paddingVertical: 0.015,
                borderRadius: 0.02,
                touchEffect: TouchableEffect(type: TouchTypes.opacity),
              ),
            ),
            ...controller.certDetails[keyFormData]['notes'].map(
              (dynamic note) => NotesCard(
                title: note[keyTitle],
                details: note['body'],
              ),
            ),
            // NotesCard(),
            0.03.ph,
          ],
        );
      },
    );
  }
}

class NotesCard extends StatelessWidget {
  const NotesCard({
    super.key,
    this.title,
    this.details,
  });

  final String? title;
  final String? details;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      backgroundColor: Colors.grey[200],
      paddingHorizontal: 0.02,
      paddingVertical: 0.015,
      marginTop: 0.02,
      borderRadius: 0.02,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonText(
            title ?? 'Title',
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rowMainAxisSize: MainAxisSize.max,
            rightChild: CommonContainer(
              onPress: () {},
              touchEffect: TouchableEffect(type: TouchTypes.scaleAndFade),
              child: Icon(
                Icons.edit,
                color: Colors.grey[700],
              ),
            ),
          ),
          CommonText(
            details ??
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
            fontSize: fontBody,
            fontColor: Colors.grey[600],
            textAlign: TextAlign.start,
            marginVertical: 0.015,
          ),
        ],
      ),
    );
  }
}
