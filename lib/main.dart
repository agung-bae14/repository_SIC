import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sic/controllers/page_index_controller.dart';
import 'package:sic/modules/home/views/home_page.dart';
import 'package:sic/modules/login/views/login_page.dart';
import 'package:sic/modules/presensi/views/presensi_page.dart';
import 'package:sic/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(PageIndexController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIC',
      theme: ThemeData(
        primaryColor: Colors.green,
        useMaterial3: true,
      ),
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    );
  }
}
