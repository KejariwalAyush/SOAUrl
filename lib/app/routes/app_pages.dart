import 'package:get/get.dart';

import 'package:soaurl/app/modules/entrance/bindings/entrance_binding.dart';
import 'package:soaurl/app/modules/entrance/bindings/login_binding.dart';
import 'package:soaurl/app/modules/entrance/views/entrance_view.dart';
import 'package:soaurl/app/modules/entrance/views/login_view.dart';
import 'package:soaurl/app/modules/home/bindings/home_binding.dart';
import 'package:soaurl/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ENTRANCE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ENTRANCE,
      page: () => Splash(),
      binding: EntranceBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
