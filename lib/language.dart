import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safra_app/home.dart';

enum AppLanguage { ar, en }

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<Language> {
  AppLanguage _selected = AppLanguage.ar;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello".tr())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("welcome".tr(),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (context.locale.languageCode == 'en') {
                  context.setLocale(const Locale('ar'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              child: Text("change_lang".tr()),
            )
          ],
        ),
      ),
    );
  }
}
