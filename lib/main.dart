import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'consts/consts.dart';
import 'providers/infoprovider.dart';
import 'screens/homescreen.dart';

void main() {
  initializeDateFormatting('en_US', null).then((_) {
    // Replace 'en_US' with the desired locale.
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => InfoProvider(),
          ),
        ],
        builder: (context, child) {
          //TODO:: Fix notification bar brightness
          removesplash();
          return const MaterialApp(
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            title: Consts.appName,
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF38ACDB)),
            //   useMaterial3: true,
            // ),
            home: HomeScreen(),
          );
        });
  }
}

void removesplash() async {
  return await Future.delayed(const Duration(seconds: 3), () {
    FlutterNativeSplash.remove();
  });
}
