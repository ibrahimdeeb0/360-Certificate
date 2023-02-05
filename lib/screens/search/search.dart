import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<SearchController>(
        init: SearchController(),
        builder: (SearchController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: Column(
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CommonContainer(
                      onPress: Get.back,
                      alignment: AlignmentDirectional.center,
                      paddingTop: 0.02,
                      touchEffect: TouchableEffect(type: TouchTypes.opacity),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 26,
                      ),
                    ),
                    CommonInput(
                      hint: 'Search for certificate, customer',
                      width: 0.85,
                      marginHorizontal: 0.04,
                      marginTop: 0.02,
                      prefix: SvgPicture.asset(
                        iconSearch,
                        color: Colors.black,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(DEVICE_WIDTH * 0.015),
                        ),
                        borderSide: BorderSide(
                          color: getColorType(Colors.white),
                          width: 1.5,
                        ),
                      ),
                      fillColor: AppColors.greyInputs,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
