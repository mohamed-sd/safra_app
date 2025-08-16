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
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('تغيير اللغة'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.language, size: 80, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'اختر لغة التطبيق',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),

              // بطاقة الخيارات
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue, width: 1.2),
                ),
                child: Column(
                  children: [
                    RadioListTile<AppLanguage>(
                      value: AppLanguage.ar,
                      groupValue: _selected,
                      activeColor: Colors.blue,
                      title: const Text(
                        'العربية',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      secondary: const Icon(Icons.flag, color: Colors.black87),
                      onChanged: (v) => setState(() => _selected = v!),
                    ),
                    const Divider(height: 1),
                    RadioListTile<AppLanguage>(
                      value: AppLanguage.en,
                      groupValue: _selected,
                      activeColor: Colors.blue,
                      title: const Text(
                        'English',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      secondary: const Icon(Icons.flag_outlined, color: Colors.black87),
                      onChanged: (v) => setState(() => _selected = v!),
                    ),
                  ],
                ),
              ),

              const Spacer(),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                },
                child: const Text(
                  'اختيار اللغة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
