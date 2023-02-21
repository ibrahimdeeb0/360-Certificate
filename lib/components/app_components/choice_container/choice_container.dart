import '../../../general_exports.dart';

class ChoiceContainer extends StatelessWidget {
  const ChoiceContainer({
    super.key,
    this.text,
    this.onPressDelete,
  });

  final String? text;
  final Function? onPressDelete;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text ?? '',
      fontSize: fontH3,
      marginRight: 0.01,
      rightChild: CommonContainer(
        onPress: onPressDelete,
        touchEffect: TouchableEffect(
          type: TouchTypes.scaleAndFade,
        ),
        child: Icon(
          Icons.close,
          color: Colors.red,
          size: (DEVICE_HEIGHT * 0.015) + (DEVICE_WIDTH * 0.015),
        ),
      ),
      containerStyle: CommonContainerModel(
        backgroundColor: Colors.grey[300],
        paddingHorizontal: 0.03,
        paddingVertical: 0.01,
        borderRadius: 0.1,
        marginRight: 0.02,
      ),
    );
  }
}
