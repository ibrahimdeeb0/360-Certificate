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
              onPress: () {
                consoleLogPretty(controller.certAttachments);
                Get.to(
                  () => const EditCertDetailsNote(),
                  arguments: <String, dynamic>{
                    keyId: controller.certId,
                    keyStatus: NoteType.noteNew,
                  },
                );
              },
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
            ...controller.certAttachments.map(
              (dynamic note) => NotesCard(
                title: note['note_title'] ?? '',
                details: note['note_body'] ?? '',
                images: note['image'] != null
                    ? <dynamic>[
                        note['image'],
                      ]
                    : <dynamic>[],
                onEdit: () {
                  if (note['attachment_type_id'] == 1) {
                    consoleLogPretty(note);
                    Get.to(
                      () => const EditCertImage(),
                      arguments: <String, dynamic>{
                        keyData: note,
                        keyId: controller.certId,
                      },
                    );
                  } else if (note['attachment_type_id'] == 2) {
                    consoleLogPretty(note);
                    Get.to(
                      () => const EditCertNote(),
                      arguments: <String, dynamic>{
                        keyData: note,
                        keyId: controller.certId,
                      },
                    );
                  } else if (note['attachment_type_id'] == 3) {
                    consoleLogPretty(note);
                    Get.to(
                      () => const EditCertDetailsNote(),
                      arguments: <String, dynamic>{
                        keyId: controller.certId,
                        keyStatus: NoteType.noteUpdate,
                        keyData: note,
                      },
                    );
                  }
                },
              ),
            ),
            /* ...controller.certDetails[keyFormData]['notes'].map(
              (dynamic note) => NotesCard(
                title: note[keyTitle],
                details: note['body'],
                images: note['files'],
                onEdit: () {
                  consoleLogPretty(note);
                  Get.toNamed(
                    routeAddNewNote,
                    arguments: <String, dynamic>{
                      keyId: controller.certId,
                      keyStatus: NoteType.noteUpdate,
                      'id_note': note[keyId],
                      keyTitle: note[keyTitle],
                      keyDetails: note['body'],
                      'images': note['files'],
                    },
                  );
                },
              ),
            ), */
            // NotesCard(),
            0.03.boxHeight,
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
    this.onEdit,
    this.images,
  });

  final String? title;
  final String? details;
  final Function? onEdit;
  final List<dynamic>? images;

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
              onPress: onEdit,
              touchEffect: TouchableEffect(type: TouchTypes.scaleAndFade),
              child: Icon(
                Icons.edit,
                color: Colors.grey[700],
              ),
            ),
          ),
          CommonText(
            details ?? '',
            fontSize: fontBody,
            fontColor: Colors.grey[600],
            textAlign: TextAlign.start,
            marginVertical: 0.015,
          ),
          if (images!.isNotEmpty)
            GridView.builder(
              // padding: EdgeInsets.only(
              //   bottom: DEVICE_HEIGHT * 0.02,
              // ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images?.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                // mainAxisExtent: DEVICE_HEIGHT * 0.1,
                // crossAxisSpacing: DEVICE_HEIGHT * 0.01,
              ),
              itemBuilder: (BuildContext context, int index) {
                return CommonContainer(
                  borderRadius: 0.02,
                  backgroundColor: Colors.black12,
                  size: 0.2,
                  marginTop: 0.02,
                  clipBehavior: Clip.hardEdge,
                  marginRight: 0.04,
                  onPress: () => Get.dialog(
                    ViewImageContainer(
                        imagePath: '${images?[index]['file_url']}'),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Hero(
                      tag: '${images?[index]['file_url']}',
                      child: CachedImage(
                        image: '${images?[index]['file_url']}',
                        withPlaceHolder: true,
                        fit: BoxFit.cover,
                        width: 1.flexWidth,
                        height: 1.flexHeight,
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
