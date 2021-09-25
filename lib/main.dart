import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/controller/dynamic_link_controller.dart';
import 'package:shopping_app/pages/details_page.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/utils/colors.dart';

void main() async {
  Get.put(DynamicLinkController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme:
              GoogleFonts.podkovaTextTheme(Theme.of(context).textTheme.apply(
                    bodyColor: MyColors.txtBlack,
                  ))),
      home: Home(),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/details', page: () => ClothDetails()),
      ],
    );
  }
}
