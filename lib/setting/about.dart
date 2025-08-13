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
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                    "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                    "It has survived not only five centuries,",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page "
                    "when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution "
                    "of letters, as opposed to using 'Content here, content here', making it look like readable English. "
                    "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, "
                    "and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),

              const SizedBox(height: 20),

              // القسم الثاني
              const Text(
                "حول الشركة",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                    "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                    "It has survived not only five centuries,",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page "
                    "when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution "
                    "of letters, as opposed to using 'Content here, content here', making it look like readable English. "
                    "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, "
                    "and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
