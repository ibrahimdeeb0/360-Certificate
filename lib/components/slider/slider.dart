import 'package:carousel_slider/carousel_slider.dart';

import '../../general_exports.dart';

class SliderComponent extends StatelessWidget {
  const SliderComponent({
    this.items,
    this.height,
    Key? key,
  }) : super(key: key);

  final List<dynamic>? items;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderController>(
      init: SliderController(),
      builder: (SliderController controller) => Stack(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: height ?? DEVICE_HEIGHT * 0.31,
              // enlargeCenterPage: true,
              // autoPlay: true,
              viewportFraction: 1,
              onPageChanged: controller.onPageUpdated,
            ),
            items: items!
                .map(
                  (dynamic image) => image is String
                      ? CommonContainer(
                          style: const CommonContainerModel(
                            clipBehavior: Clip.hardEdge,
                            marginTop: 0.025,
                            marginBottom: 0.01,
                          ),
                          child: CachedImage(
                            image: image,
                            width: DEVICE_WIDTH * 0.9,
                            height: height ?? DEVICE_HEIGHT * 0.31,
                          ),
                        )
                      : image as Widget,
                )
                .toList(),
            carouselController: CarouselController(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.only(bottom: DEVICE_HEIGHT * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: items!.asMap().entries.map(
                  (dynamic entry) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: controller.current == entry.key
                          ? DEVICE_HEIGHT * 0.02
                          : DEVICE_WIDTH * 0.012,
                      height: DEVICE_WIDTH * 0.01,
                      margin: EdgeInsets.only(
                        top: DEVICE_WIDTH * 0.02,
                        left: DEVICE_WIDTH * 0.007,
                        right: DEVICE_WIDTH * 0.007,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          DEVICE_WIDTH * 0.015,
                        ),
                        color: (Color(
                          controller.current == entry.key
                              ? AppColors.primary
                              : AppColors.grey,
                        )).withOpacity(0.8),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
