import 'package:carousel_slider/carousel_options.dart';
import 'package:get/state_manager.dart';

class SliderController extends GetxController {
  int current = 0;

  void onPageUpdated(int index, CarouselPageChangedReason reason) {
    current = index;
    update();
  }
}
