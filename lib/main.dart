import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_to_watch_app/core/config/routes/app_routes.dart';
import 'package:what_to_watch_app/core/config/themes/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoute,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: appTheme(Mode.light),
      darkTheme: appTheme(Mode.dark),
    );
  }
}
