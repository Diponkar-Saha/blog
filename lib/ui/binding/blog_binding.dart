import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/blog_controller.dart';


class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataController>(
          () => DataController(),
    );
  }
}
