import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onbills/screens/home.screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'OnBills';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt'),
        Locale('en'),
        Locale('fr'),
        Locale('es'),
        Locale('de'),
        Locale("es"),
      ],      
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomeScreen(),
    );
  }
}
