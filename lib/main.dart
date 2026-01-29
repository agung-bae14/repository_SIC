import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sic/controllers/page_index_controller.dart';
import 'package:sic/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);
  Get.put(PageIndexController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SIC',
          theme: ThemeData(
              primaryColor: Color(0xff46b83d),
              useMaterial3: true,
              textTheme:
                  GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
          initialRoute: Routes.HOME,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
