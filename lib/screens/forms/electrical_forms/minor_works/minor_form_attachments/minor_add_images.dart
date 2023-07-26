import '../../../../../general_exports.dart';

class MinorAddImage extends StatelessWidget {
  const MinorAddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Images & Notes',
        withShadow: true,
      ),
      body: GetBuilder<MinorAttachmentsController>(
        init: MinorAttachmentsController(),
        builder: (MinorAttachmentsController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            paddingTop: 0.02,
            child: controller.imagesData.isNotEmpty
                ? Stack(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CommonText(
                              'Uploaded Images',
                              fontColor: AppColors.primary,
                              fontSize: fontH2,
                              marginBottom: 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                            if (controller.imagesData.isNotEmpty)
                              ...controller.imagesData.map(
                                (FormImageClass item) => FormAddImageCard(
                                  fileName: item.file.path
                                      .split('/')
                                      .last
                                      .split('picker')
                                      .last,
                                  imagePath: item.file.path,
                                  pressToggleInclude: () {
                                    // consoleLog(item.file.path);
                                    final int itemIndex =
                                        controller.imagesData.indexOf(item);
                                    controller.imagesData[itemIndex]
                                        .isIncluded = !item.isIncluded;
                                    controller.update();
                                  },
                                  isIncluded: item.isIncluded,
                                  pressView: () {
                                    Get.dialog(
                                      ViewImageContainer(
                                        imagePath: item.file.path,
                                        imageType: ImageFormatType.local,
                                        isFullScreen: true,
                                      ),
                                    );
                                  },
                                  pressDelete: item.onPress,
                                  pressNote: () {
                                    if (item.note == null) {
                                      Get.to(() => const MinorImageNote());
                                    }
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 0.02.flexHeight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CommonButton(
                                text: 'Cancel',
                                width: 0.45,
                                backgroundColor: Colors.white,
                                fontColor: AppColors.primary,
                                borderWidth: 1,
                                borderColor: AppColors.primary,
                              ),
                              CommonButton(
                                onPress: () {
                                  controller.pickImage();
                                },
                                text: 'Upload',
                                width: 0.45,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      CommonText(
                        'Uploaded Images',
                        fontColor: AppColors.primary,
                        fontSize: fontH2,
                        marginBottom: 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                      CommonText(
                        'No dat available',
                        fontColor: Colors.grey[700],
                        marginBottom: 0.1,
                      ),
                      CommonButton(
                        onPress: () {
                          controller.pickImage();
                        },
                        child: const CommonText(
                          'No dat available',
                          fontColor: Colors.white,
                          rightChild: Icon(
                            Icons.file_upload_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class FormAddImageCard extends StatelessWidget {
  const FormAddImageCard({
    super.key,
    this.fileName,
    this.pressView,
    this.pressDelete,
    this.pressNote,
    this.pressToggleInclude,
    this.isIncluded = false,
    this.imagePath,
  });

  final String? fileName;
  final Function()? pressView;
  final Function()? pressDelete;
  final Function()? pressNote;
  final Function()? pressToggleInclude;
  final bool isIncluded;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          CommonInput(
            topLabelText: 'File Name',
            enabled: false,
            fillColor: Colors.grey[200],
            value: fileName ?? '',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton.icon(
                onPressed: pressView,
                icon: Icon(
                  Icons.visibility,
                  color: Color(AppColors.primary),
                ),
                label: CommonText(
                  'View',
                  style: appTextStyles.h3BoldStyle(),
                ),
              ),
              CommonContainer(
                backgroundColor: Colors.grey[400],
                height: 0.03,
                width: 0.005,
              ),
              Hero(
                tag: imagePath ?? '',
                child: TextButton.icon(
                  onPressed: pressDelete,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[900],
                  ),
                  label: CommonText(
                    'Delete',
                    style: appTextStyles.h3BoldStyle(),
                  ),
                ),
              ),
              CommonContainer(
                backgroundColor: Colors.grey[400],
                height: 0.03,
                width: 0.005,
              ),
              TextButton.icon(
                onPressed: pressNote,
                icon: Icon(
                  Icons.drive_file_rename_outline,
                  color: Colors.orange[700],
                ),
                label: CommonText(
                  'Note',
                  style: appTextStyles.h3BoldStyle(),
                ),
              ),
            ],
          ),
          CommonText(
            'Do Not Include In Pdf',
            rightChild: IconButton(
              onPressed: pressToggleInclude,
              icon: isIncluded
                  ? Icon(
                      Icons.check_box,
                      color: Color(AppColors.primary),
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.grey[400],
                    ),
            ),
            rowMainAxisSize: MainAxisSize.max,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            containerStyle: appContainerStyles.topBottomBorderStyle.copyWith(
              paddingVertical: 0.01,
              marginTop: 0.01,
              marginBottom: 0.02,
              paddingHorizontal: 0,
            ),
          ),
        ],
      ),
    );
  }
}

/*

              CommonText(
                'Uploaded Images',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
              CommonText(
                'No dat available',
                fontColor: Colors.grey[700],
                marginBottom: 0.1,
              ),
              CommonButton(
                onPress: () {},
                child: const CommonText(
                  'No dat available',
                  fontColor: Colors.white,
                  rightChild: Icon(
                    Icons.file_upload_outlined,
                    color: Colors.white,
                  ),
                ),
              ),

*/

class DisplayImage extends StatelessWidget {
  const DisplayImage({required this.filePath, super.key});
  final String filePath;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CommonContainer(
          paddingHorizontal: 0.08,
          paddingVertical: 0.05,
          borderRadius: 0.04,
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.grey,
          // child:
          // Image.file(
          //   File(filePath),
          //   fit: BoxFit.contain,
          // ),
        ),
      ),
    );
  }
}
