import 'package:get/get.dart';
import 'package:myprodtest/src/home/controller/home_controller.dart';
import 'package:myprodtest/src/home/repository/home_repository.dart';
import 'package:myprodtest/src/home/repository/home_repository_impl.dart';
import 'package:myprodtest/src/shared/services/dio/dio_service.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioService>(() => DioService());
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
