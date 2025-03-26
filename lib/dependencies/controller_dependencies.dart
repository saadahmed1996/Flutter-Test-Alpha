import 'package:al_busayra_project/controllers/auth_controller.dart';
import 'package:al_busayra_project/controllers/global_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => GlobalController());
  Get.lazyPut(() => AuthController());
}
