import '../../../../general_exports.dart';

class EditCertImage extends StatelessWidget {
  const EditCertImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Edit Image',
        withShadow: true,
      ),
      body: GetBuilder<EditCertImageController>(
        init: EditCertImageController(),
        builder: (EditCertImageController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            paddingTop: 0.02,
            child: Column(
              children: <Widget>[
                // FormAddImageCard(
                //   fileName: controller.imageClass?.imageName!.split('/').last,
                //   isIncluded: controller.imageClass?.isIncluded,
                //   note: item.note,
                //   pressToggleInclude: () => pressToggleInclude(
                //       controller: controller, itemIndex: itemIndex, item: item),
                //   pressView: () => pressView(
                //       controller: controller, itemIndex: itemIndex, item: item),
                //   pressDelete: () => pressDelete(
                //       controller: controller, itemIndex: itemIndex, item: item),
                //   pressNote: () => pressNote(
                //       controller: controller, itemIndex: itemIndex, item: item),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
