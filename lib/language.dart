import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum AppLanguage { ar, en }

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<Language> {
  AppLanguage _selected = AppLanguage.ar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية أنيقة
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).maybePop(),
          child:Icon(Icons.arrow_back , color: Colors.white),),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        title: Text(
          "hello".tr(),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // زر العربية
            _buildLangButton(
              title: "العربية",
              icon: Icons.language,
              selected: _selected == AppLanguage.ar,
              onTap: () {
                context.setLocale(const Locale('ar'));
                setState(() => _selected = AppLanguage.ar);
              },
            ),
            const SizedBox(height: 16),

            // زر الإنجليزية
            _buildLangButton(
              title: "English",
              icon: Icons.translate,
              selected: _selected == AppLanguage.en,
              onTap: () {
                context.setLocale(const Locale('en'));
                setState(() => _selected = AppLanguage.en);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLangButton({
    required String title,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? Colors.blue[800] : Colors.white,
          foregroundColor: selected ? Colors.white : Colors.black87,
          side: BorderSide(color: Colors.blue.shade800, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // نص في اليسار – أيقونة في اليمين
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Icon(icon, size: 24 , color: selected ? Colors.white : Colors.black,),
          ],
        ),
      ),
    );
  }
}
