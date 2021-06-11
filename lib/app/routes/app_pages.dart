import 'package:get/get.dart';

import 'package:soaurl/app/modules/entrance/bindings/entrance_binding.dart';
import 'package:soaurl/app/modules/entrance/bindings/login_binding.dart';
import 'package:soaurl/app/modules/entrance/views/entrance_view.dart';
import 'package:soaurl/app/modules/entrance/views/login_view.dart';
import 'package:soaurl/app/modules/home/bindings/home_binding.dart';
import 'package:soaurl/app/modules/home/views/home_view.dart';
import 'package:soaurl/app/modules/profile/bindings/profile_binding.dart';
import 'package:soaurl/app/modules/profile/views/profile_view.dart';
import 'package:soaurl/app/modules/qr/bindings/qr_binding.dart';
import 'package:soaurl/app/modules/qr/views/qr_view.dart';
import 'package:soaurl/app/modules/settings/bindings/settings_binding.dart';
import 'package:soaurl/app/modules/settings/views/settings_view.dart';

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
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.QR,
      page: () => QrView(),
      binding: QrBinding(),
    ),
  ];
}
