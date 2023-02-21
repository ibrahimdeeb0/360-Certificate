import '../../general_exports.dart';

class NotesTab extends StatelessWidget {
  const NotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommonText(
          'Add New Note',
          onPress: () => Get.toNamed(routeAddNewNote),
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
        CommonContainer(
          backgroundColor: Colors.grey[200],
          paddingHorizontal: 0.02,
          paddingVertical: 0.015,
          marginTop: 0.02,
          borderRadius: 0.02,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonText(
                'Title',
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
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
                fontSize: fontBody,
                fontColor: Colors.grey[600],
                textAlign: TextAlign.start,
                marginVertical: 0.015,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
