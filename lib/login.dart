import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safra_app/home.dart';
import 'package:safra_app/sign_up.dart';
import 'appColors.dart';
import 'detailes/hotelDetalas.dart'; // استدعاء ملف الألوان

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/icons/logo.png', // شعار سفرة
                height: 100,
              ),
              SizedBox(height: 24),

              // Welcome Text
              Text(
                'مرحباً بك في سفرة!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.primary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'سجل دخولك لتبدأ رحلتك معنا',
                style: TextStyle(
                  fontSize: 16,
                  color: Appcolors.textDark.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 32),

              // Email Field
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 16),

              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 12),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // الانتقال إلى صفحة استعادة كلمة المرور
                  },
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(color: Appcolors.primary),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolors.primary,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "login".tr(),
                    style: TextStyle(fontSize: 17, color: Colors.white , fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ليس لديك حساب؟'),
                  TextButton(
                    onPressed: () {

                    },
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                      child: Text(
                        'إنشاء حساب جديد',
                        style: TextStyle(color: Appcolors.primary),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // OR divider
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "أو الدخول عبر",
                      style: TextStyle(color: Appcolors.textDark.withOpacity(0.7)),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: 24),

              // Google Sign-In Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: Image.asset('assets/icons/google.png', height: 24),
                  label: Text(
                    'تسجيل الدخول عبر Google',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    // تنفيذ تسجيل الدخول عبر Google
                  },
                ),
              ),
              SizedBox(height: 12),

              // Facebook Sign-In Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: Image.asset('assets/icons/fb.png', height: 24),
                  label: Text(
                    'تسجيل الدخول عبر Facebook',
                    style: TextStyle(color: Color(0xFF1877F2)),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    // تنفيذ تسجيل الدخول عبر Facebook
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
