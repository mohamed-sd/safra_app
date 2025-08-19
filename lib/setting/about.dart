import 'package:flutter/material.dart';

import '../widgets/custom_back_button.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // دعم اللغة العربية
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomBackButton()),
          title: const Text(
            "معلومات عنا",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // القسم الأول
              const Text(
                "كيف بدأنا",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                " نحن: منصة سفرة - بوابتك نحو آفاق لا حدود لها "
                    ,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                "  في عالم يتسارع، حيث تتشابك الرغبات مع الفرص، تبرز منصة سفرة كوجهتك الذكية والملهمة لاستكشاف عوالم جديدة من السفر والإقامة. نحن نؤمن بأن كل رحلة هي قصة، وكل إقامة هي تجربة فريدة، ولذلك صممنا منصتنا لتكون رفيقك الأمثل في نسج هذه القصص وتشكيل تلك التجارب. "
                 ,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),

              const SizedBox(height: 20),

              // القسم الثاني
              // const Text(
              //   "حول الشركة",
              //   style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const SizedBox(height: 8),
              const Text(
""                  ,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                "                   ",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
