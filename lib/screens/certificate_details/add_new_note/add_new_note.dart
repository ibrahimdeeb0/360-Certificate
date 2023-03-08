import '../../../general_exports.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewNotesController>(
      init: AddNewNotesController(),
      builder: (AddNewNotesController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Add New Note',
            actionItem: ActionItem(
              type: ActionType.save,
              onPress: controller.onPressSave,
            ),
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.03),
                  CommonInput(
                    hint: 'Title',
                    marginBottom: 0.02,
                    controller: controller.titleNote,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                  ),
                  CommonInput(
                    hint: 'Typing...',
                    controller: controller.detailsNote,
                    textInputAction: TextInputAction.newline,
                    maxLines: 14,
                    marginBottom: 0.02,
                  ),
                  CommonText(
                    'Add Photo / Video',
                    // onPress: () => Get.toNamed(routeAddNewNote),
                    onPress: () {},
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rightChild: const Icon(Icons.camera_alt_outlined),
                    containerStyle: CommonContainerModel(
                      width: 1,
                      backgroundColor: Colors.grey[300],
                      paddingHorizontal: 0.03,
                      paddingVertical: 0.015,
                      borderRadius: 0.02,
                      touchEffect: TouchableEffect(type: TouchTypes.opacity),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
