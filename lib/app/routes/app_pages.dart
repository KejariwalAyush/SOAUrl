import 'package:get/get.dart';

import 'package:soaurl/app/modules/aboutUs/bindings/about_us_binding.dart';
import 'package:soaurl/app/modules/aboutUs/views/about_us_view.dart';
import 'package:soaurl/app/modules/entrance/bindings/entrance_binding.dart';
import 'package:soaurl/app/modules/entrance/bindings/login_binding.dart';
import 'package:soaurl/app/modules/entrance/views/entrance_view.dart';
import 'package:soaurl/app/modules/entrance/views/login_view.dart';
import 'package:soaurl/app/modules/home/bindings/home_binding.dart';
import 'package:soaurl/app/modules/home/views/home_view.dart';
import 'package:soaurl/app/modules/notifications/bindings/notifications_binding.dart';
import 'package:soaurl/app/modules/notifications/views/notifications_view.dart';
import 'package:soaurl/app/modules/profile/bindings/profile_binding.dart';
import 'package:soaurl/app/modules/profile/views/profile_view.dart';
import 'package:soaurl/app/modules/qr/bindings/qr_binding.dart';
import 'package:soaurl/app/modules/qr/views/qr_view.dart';
import 'package:soaurl/app/modules/settings/bindings/settings_binding.dart';
import 'package:soaurl/app/modules/settings/views/settings_view.dart';
import 'package:soaurl/app/modules/short/bindings/short_binding.dart';
import 'package:soaurl/app/modules/short/views/short_view.dart';
import 'package:soaurl/app/modules/urlStats/bindings/url_stats_binding.dart';
import 'package:soaurl/app/modules/urlStats/views/url_stats_view.dart';

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
    GetPage(
      name: _Paths.SHORT,
      page: () => ShortView(),
      binding: ShortBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.URL_STATS + '/:data',
      page: () => UrlStatsView(),
      binding: UrlStatsBinding(),
    ),
  ];
}
