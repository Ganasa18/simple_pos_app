import 'package:flutter/material.dart';
import 'package:simple_pos_app/core/routes/names.dart';
import 'package:simple_pos_app/core/routes/pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:simple_pos_app/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Simple Apps Pos',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.INITIAL,
      getPages: AppPages.pages,
      builder: EasyLoading.init(),
    );
  }
}
