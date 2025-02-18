import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/constants/env.dart';
import 'package:partner_hub/app/init/init_services.dart';
import 'package:partner_hub/app/routes/app_pages.dart';
import 'package:partner_hub/app/services/cureentpartner.dart';

SupabaseConfigModel get currentEnv => EnvConfig.getCurrentENV(Env.dev);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await initDependencies();
  await UserPreferences().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Partner Hub',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class ObjectClassOpening {}
