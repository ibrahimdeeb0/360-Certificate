import '../../general_exports.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    this.child,
    Key? key,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: CommonContainerModel(
        height: 1,
        width: 1,
        backgroundColor: AppColors.primaryOpacity,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              imageMainBackground,
              height: DEVICE_HEIGHT,
              fit: BoxFit.fill,
            ),
          ),
          child!,
        ],
      ),
    );
  }
}
