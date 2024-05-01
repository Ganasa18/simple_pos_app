import 'package:get/get.dart';
import 'package:simple_pos_app/core/routes/names.dart';
import 'package:simple_pos_app/module/home/view.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const HomePage(),
    ),
  ];
}
