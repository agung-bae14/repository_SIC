import 'package:get/get.dart';

import 'package:sic/modules/login/views/login_page.dart';
import 'package:sic/modules/presensi/views/presensi_page.dart';
import 'package:sic/modules/profile/views/profile_page.dart';
import 'package:sic/pages/main_wrapper.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(name: _Paths.HOME, page: () => MainWrapper()),
    GetPage(name: _Paths.LOGIN, page: () => LoginPage()),
    GetPage(name: _Paths.PRESENSI, page: () => PresensiPage()),
    GetPage(name: _Paths.PROFILE, page: () => ProfilePage()),
  ];
}
