import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class CreateCustomerV2 extends StatelessWidget {
  const CreateCustomerV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(
        title: '',
      ),
      body: GetBuilder<CreateCustomerV2Controller>(
        init: CreateCustomerV2Controller(),
        builder: (CreateCustomerV2Controller controller) {
          return Column(
            children: <Widget>[
              CommonContainer(
                // paddingHorizontal: 0.04,
                // paddingVertical: 0.015,
                style: appContainerStyles.bottomShadowStyle,
                paddingHorizontal: 0.04,
                child: const CommonText(
                  'Is this customer an Individual or a company?',
                  fontSize: fontH2,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      0.03.boxHeight,
                      //  CircleAvatar
                      SelectCustomerTypeContainer(
                        label: 'Individual',
                        selectedType: CustomerType.individual,
                        isSelected: controller.customerType != null
                            ? controller.customerType == CustomerType.individual
                            : null,
                        onTap: () {
                          controller.onSelectType(CustomerType.individual);
                        },
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.grey.withOpacity(0.2),
                        endIndent: 0.04.flexWidth,
                        indent: 0.04.flexWidth,
                      ),
                      SelectCustomerTypeContainer(
                        label: 'Company', //Individual
                        iconPath: iconCompany,
                        isSelected: controller.customerType != null
                            ? controller.customerType == CustomerType.company
                            : null,
                        onTap: () {
                          controller.onSelectType(CustomerType.company);
                        },
                      ),

                      0.03.boxHeight,
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SelectCustomerTypeContainer extends StatelessWidget {
  const SelectCustomerTypeContainer({
    super.key,
    this.selectedType,
    this.onTap,
    this.iconPath = iconPerson,
    this.label,
    this.isSelected,
  });

  final CustomerType? selectedType;
  final Function()? onTap;
  final String iconPath;
  final String? label;
  final bool? isSelected;

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
