import 'package:flutter_svg/svg.dart';

import '../../../general_exports.dart';

class SelectCustomerTypeContainer extends StatelessWidget {
  const SelectCustomerTypeContainer({
    super.key,
    this.selectedType,
    this.onTap,
    this.iconPath = iconPerson,
    this.label,
    this.isSelected,
    this.onEnd,
  });

  final CustomerType? selectedType;
  final Function()? onTap;
  final String iconPath;
  final String? label;
  final bool? isSelected;
  final Function()? onEnd;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Color(AppColors.grey).withOpacity(0.2);
            }
            return null;
          },
        ),
        child: CommonContainer(
          paddingVertical: 0.025,
          paddingHorizontal: 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    //                    null or  true
                    width: (isSelected == null || isSelected!)
                        ? 0.18.flexWidth
                        : 0.11.flexWidth,
                    height: (isSelected == null || isSelected!)
                        ? 0.08.flexHeight
                        : 0.05.flexHeight,
                    decoration: BoxDecoration(
                      border: isSelected != null
                          ? isSelected!
                              ? Border.all(
                                  width: 2,
                                  color: Color(AppColors.primary),
                                )
                              : null
                          : null,
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blueGrey.withOpacity(0.15),
                    ),
                    padding: EdgeInsets.all((isSelected != null)
                        ? isSelected!
                            ? 0.017.flexAll
                            : 0.008.flexAll
                        : 0.017.flexAll),
                    onEnd: onEnd,
                    child: SvgPicture.asset(
                      iconPath,
                      color: isSelected != null
                          ? isSelected!
                              ? Color(AppColors.primary)
                              : Colors.black
                          : Colors.black,
                    ),
                  ),
                  CommonText(
                    label ?? '',
                    fontWeight: FontWeight.w500,
                    fontColor: isSelected != null
                        ? isSelected!
                            ? AppColors.primary
                            : Colors.grey[700]
                        : Colors.black,
                    fontSize: isSelected != null
                        ? isSelected!
                            ? fontH2
                            : fontH3
                        : fontH2,
                    textAlign: TextAlign.start,
                    containerStyle: const CommonContainerModel(
                      width: 0.5,
                      marginHorizontal: 0.04,
                    ),
                  ),
                ],
              ),
              if (isSelected != null && isSelected!)
                Icon(
                  Icons.check_circle,
                  color: Colors.green[600],
                  size: 0.02.flexAll,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateCustomerTween extends StatelessWidget {
  const CreateCustomerTween({
    super.key,
    this.end,
    this.numbers,
  });

  final double? end;
  final String? numbers;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 0.0,
            end: end,
          ),
          duration: const Duration(milliseconds: 700),
          builder: (BuildContext context, double value, _) =>
              CircularProgressIndicator(
            value: value,
            color: Color(AppColors.primary),
            backgroundColor: Colors.grey[300],
          ),
        ),
        Align(
          child: CommonText(numbers ?? ''),
        ),
      ],
    );
  }
}

class CancelAddCustomerSheet extends StatelessWidget {
  const CancelAddCustomerSheet({
    super.key,
    this.onPressFirstBtn,
  });
  final Function()? onPressFirstBtn;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.info_outline,
                color: Colors.orange[700],
                size: 0.07.flexAll,
              ),
            ),
            const CommonText(
              'Would you like cancel process of adding Customer',
              marginBottom: 0.03,
              fontSize: fontH2,
              textAlign: TextAlign.start,
            ),
            CommonText(
              'When press yes operation will be canceled',
              rowMainAxisSize: MainAxisSize.max,
              textAlign: TextAlign.start,
              marginBottom: 0.04,
              fontColor: Colors.grey[700],
            ),
            CommonButton(
              onPress: onPressFirstBtn,
              text: 'Yes would like cancel the operation',
              backgroundColor: Colors.grey[200],
              fontColor: Colors.black,
              marginBottom: 0.02,
            ),
            CommonButton(
              onPress: () {
                if (Get.isBottomSheetOpen!) {
                  Get.back();
                }
              },
              text: 'No',
              marginBottom: 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

class AttentionMessage extends StatelessWidget {
  const AttentionMessage({
    super.key,
    this.message,
    this.child,
    this.marginBottom,
  });
  final String? message;
  final Widget? child;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: appContainerStyles.cardStyle,
      marginBottom: marginBottom,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.info_outline,
                color: Colors.orange[600],
              ),
              SizedBox(
                width: 0.775.flexWidth,
                child: CommonText(
                  message ?? '',
                  marginLeft: 0.015,
                  style: appTextStyles.h3DarkGreyStyle(),
                ),
              ),
            ],
          ),
          if (child != null) 0.015.boxHeight,
          child ?? const SizedBox(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ToggleYesNo extends StatefulWidget {
  ToggleYesNo({
    required this.onChange,
    this.toggleValue = false,
    this.text,
    super.key,
  });

  bool toggleValue;
  final String? text;
  final ValueChanged<bool> onChange;

  @override
  State<ToggleYesNo> createState() => _ToggleYesNoState();
}

class _ToggleYesNoState extends State<ToggleYesNo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CommonText(
          widget.text ?? '',
          textAlign: TextAlign.start,
          fontColor: Colors.grey[700],
          containerStyle: const CommonContainerModel(width: 0.7),
          bottomChild: const SizedBox(),
        ),
        CommonButton(
          onPress: () {
            setState(() {
              widget.toggleValue = !widget.toggleValue;
            });
            widget.onChange.call(widget.toggleValue);
          },
          text: widget.toggleValue ? 'Yes' : 'No',
          backgroundColor:
              widget.toggleValue ? AppColors.primary : Colors.orange[700],
          // : Color(AppColors.primary).withOpacity(0.3),
          // borderWidth: 2,
          // borderColor: AppColors.primary,
          fontColor: widget.toggleValue ? AppColors.white : AppColors.white,
          // fontColor: AppColors.white,
          fontWeight: FontWeight.bold,
          width: 0.2,
          height: 0.043,
        ),
      ],
    );
  }
}
