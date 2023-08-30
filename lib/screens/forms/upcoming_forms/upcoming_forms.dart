import 'package:flutter_svg/svg.dart';

import '../../../general_exports.dart';

class UpcomingForms extends StatelessWidget {
  const UpcomingForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Upcoming Forms',
        withShadow: true,
      ),
      body: GetBuilder<UpcomingFormsController>(
        init: UpcomingFormsController(),
        builder: (UpcomingFormsController controller) {
          return SingleChildScrollView(
            child: CommonContainer(
              // style: appContainerStyles.containerStyles,
              backgroundColor: Colors.white,
              paddingHorizontal: 0.03,
              child: Column(
                children: <Widget>[
                  ...controller.moreItems.map(
                    (dynamic item) => UpcomingFormsElement(
                      id: item[keyId],
                      title: item[keyTitle],
                      description: item[keyDescription],
                      iconType: item[keyIcon],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class UpcomingFormsElement extends StatelessWidget {
  const UpcomingFormsElement({
    super.key,
    this.iconStates,
    this.iconType,
    this.title,
    this.description,
    this.id,
  });
  final int? id;
  final String? iconType;
  final String? iconStates;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpcomingFormsController>(
        init: UpcomingFormsController(),
        builder: (UpcomingFormsController controller) {
          return Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => controller.toggleItemOpenState(id!),
                child: CommonContainer(
                  width: 1,
                  height: 0.1,
                  paddingHorizontal: 0.02,
                  marginTop: 0.02,
                  decoration: BoxDecoration(
                    borderRadius: controller.isOpenList[id!]
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))
                        : BorderRadius.circular(10),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurStyle: BlurStyle.solid,
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 0.4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CommonContainer(
                        width: 0.1,
                        height: 0.05,
                        borderRadius: 0.01,
                        backgroundColor: Color(AppColors.primary),
                        child: Center(
                          child: SvgPicture.asset(
                            iconType!,
                            // iconFire,
                            height: 0.03.flexHeight,
                            width: 0.04.flexWidth,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0.7.flexWidth,
                        child: CommonText(
                          title,
                          fontSize: fontH2,
                        ),
                      ),
                      SvgPicture.asset(
                        controller.isOpenList[id!]
                            ? iconArrowDown
                            : iconArrowGoi,
                        height: 0.02.flexHeight,
                        width: 0.02.flexWidth,
                      ),
                    ],
                  ),
                ),
              ),
              if (controller.isOpenList[id!])
                GestureDetector(
                  onTap: () => controller.toggleItemOpenState(id!),
                  child: CommonContainer(
                    width: 1,
                    paddingHorizontal: 0.02,
                    decoration: BoxDecoration(
                      borderRadius: controller.isOpenList[id!]
                          ? const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))
                          : BorderRadius.circular(10),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurStyle: BlurStyle.solid,
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 0.4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CommonText(
                      description,
                      marginHorizontal: 0.01,
                      marginVertical: 0.02,
                      textAlign: TextAlign.start,
                      fontColor: Colors.grey[500],
                    ),
                  ),
                ),
            ],
          );
        });
  }
}
