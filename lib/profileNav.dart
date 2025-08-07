import 'package:flutter/material.dart';
import 'package:safra_app/login.dart';
import 'package:safra_app/project.dart';

import 'appColors.dart';

class Profilenav extends StatelessWidget {
  const Profilenav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Appcolors.Appbackground,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // 🔷 الهيدر: صورة + اسم + زر الصفحة الشخصية
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('assets/profile.jpg'), // استبدل بالصورة الحقيقية
                      ),
                      SizedBox(height: 10),
                      Text(
                        'محمد إدريس',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: فتح صفحة الحساب
                        },
                         child: Text('عرض الصفحة الشخصية' , style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // 🟦 قائمة العناصر
                buildMenuItem(Icons.support_agent, 'الدعم'),
                buildMenuItem(Icons.info_outline, 'معلومات عنا'),
                buildMenuItem(Icons.description_outlined, 'البنود والظروف'),


                InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProjectsScreen()),
                      );
                    },
                    child: buildMenuItem(Icons.work_outline, 'مشاريعي ')),


                buildMenuItem(Icons.language, 'تغيير اللغة'),
                buildMenuItem(Icons.share, 'شارك التطبيق'),
                buildMenuItem(Icons.star_border, 'قيّم التطبيق'),
                InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: buildMenuItem(Icons.logout, 'تسجيل الخروج', color: Colors.red)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title, {Color? color}) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: color ?? Colors.blue),
        title: Text(title, style: TextStyle(fontSize: 16)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
