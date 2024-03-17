import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:muhammad_riski_testimoni/core/helper/navigator_helper.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/controlller/home_controller.dart';
import 'package:muhammad_riski_testimoni/feature/dashboard/presentation/page/main_home_page.dart';

main() {
  runApp(TestimoniApp());
}

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}

class TestimoniApp extends StatefulWidget {
  const TestimoniApp({super.key});

  @override
  State<TestimoniApp> createState() => _TestimoniAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _TestimoniAppState? state =
        context.findAncestorStateOfType<_TestimoniAppState>();
    state?.setLocale(newLocale);
  }
}

class _TestimoniAppState extends State<TestimoniApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    _locale = locale;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      initialRoute: routeName.root,
      getPages: [
        GetPage(name: routeName.root, page: () => MainHomePage()),
        GetPage(name: routeName.search, page: () => MainHomePage()),
      ],
    );
  }
}
