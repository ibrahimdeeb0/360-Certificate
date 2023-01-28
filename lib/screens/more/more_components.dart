import '../../general_exports.dart';

class ExpandableTile extends StatelessWidget {
  const ExpandableTile({
    this.title,
    this.leftIcon,
    this.children,
    Key? key,
  }) : super(key: key);
  final String? title;
  final Widget? leftIcon;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoreController>(
      init: MoreController(),
      global: false,
      builder: (MoreController controller) {
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Align(
              child: CommonText(
                title ?? 'Title',
                style: appTextStyles.h3StyleBlack().copyWith(
                      fontSize: fontHeader,
                      rowMainAxisSize: MainAxisSize.max,
                      textAlign: TextAlign.start,
                    ),
                containerStyle: const CommonContainerModel(
                  paddingBottom: 0.01,
                ),
                leftChild: Row(
                  children: <Widget>[
                    leftIcon ?? const SizedBox(),
                    SizedBox(width: DEVICE_WIDTH * 0.05),
                  ],
                ),
              ),
            ),
            textColor: Colors.black,
            collapsedTextColor: Colors.black,
            trailing: Icon(
              controller.isTileExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              size: 18,
              color: Color(AppColors.grey),
            ),
            children: children ?? <Widget>[],
            onExpansionChanged: (bool expanded) {
              controller.onExpansionChanged(
                expanded: expanded,
              );
            },
          ),
        );
      },
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
    this.title,
    this.leftIcon,
    this.rightIcon,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: DEVICE_HEIGHT * 0.02,
      title: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CommonText(
              title ?? 'Title',
              style: appTextStyles.h3StyleBlack().copyWith(
                    fontSize: fontHeader,
                    rowMainAxisSize: MainAxisSize.max,
                    textAlign: TextAlign.start,
                    columnMainAxisAlignment: MainAxisAlignment.center,
                  ),
              containerStyle: const CommonContainerModel(
                width: 0.7,
                //   backgroundColor: Colors.black26,
              ),
              leftChild: Row(
                children: <Widget>[
                  leftIcon ?? const SizedBox(),
                  SizedBox(width: DEVICE_WIDTH * 0.05),
                ],
              ),
            ),
            rightIcon ?? const SizedBox(),
          ],
        ),
      ),
      onTap: onTap != null ? onTap! : () {},
    );
  }
}

class ChildeTitle extends StatelessWidget {
  const ChildeTitle({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title ?? 'Title'),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      onTap: onTap != null ? onTap! : () {},
    );
  }
}
