import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widgets/custom_back_button.dart';

class ProjectsScreen extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: 'بريق لخدمات التعدين',
      description:
      'بوابتك الذكية لعالم التعدين، حيث تجد جميع الخدمات والإعلانات والمعلومات التي تحتاجها لتطوير أعمالك في قطاع التعدين بكل سهولة واحترافية.',
      imageUrl: 'assets/icons/1.png',
    ),
    Project(
      title: 'حصاد للخدمات الزراعية',
      description:
      'منصة متكاملة لدعم المشاريع الزراعية في السودان، توفر لك أدوات التخطيط، مستلزمات الزراعة، والخدمات الميدانية في مكان واحد.',
      imageUrl: 'assets/icons/2.png',
    ),
    Project(
      title: 'أنعام لخدمات الثروة الحيوانية',
      description:
      'تطبيق شامل لتلبية احتياجات مربي المواشي والمستثمرين في قطاع الثروة الحيوانية، من الأعلاف والبيطرة حتى خدمات التسويق والنقل.',
      imageUrl: 'assets/icons/3.png',
    ),
    Project(
      title: 'إنجاز لإدارة عمليات المعدات',
      description:
      'حل تقني متطور لإدارة وتشغيل المعدات الثقيلة بكفاءة عالية،',
      imageUrl: 'assets/icons/4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لأن المحتوى باللغة العربية
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomBackButton()),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مشاريعنا', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              Text('78 تقييم', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: 4),
              color:  Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBarIndicator(
                    rating: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700]),
                            ),
                            SizedBox(height: 4),
                            Text(
                              project.description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          project.imageUrl,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String imageUrl;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
