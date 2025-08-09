import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppartmentsDetailes extends StatelessWidget {
  final String title = "شقق مفروشة - الخرطوم";
  final String location = "الخرطوم، السودان";
  final double pricePerNight = 35000; // بالجنيه السوداني
  final String description = '''
استمتع بإقامة مميزة في شقق مفروشة راقية بوسط الخرطوم،
قريبة من جميع الخدمات والمراكز التجارية، 
مع تكييف، إنترنت مجاني، ومطبخ مجهز بالكامل.
  ''';

  final List<String> images = [
    "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
    "https://images.unsplash.com/photo-1600585154526-990dced4df8a",
    "https://images.unsplash.com/photo-1600585154184-1f3f76c71a52",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الصور القابلة للتمرير
          PageView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                  // طبقة شفافة داكنة
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // زر العودة
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                backgroundColor: Colors.black45,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),

          // المحتوى السفلي
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.45,
              minChildSize: 0.45,
              maxChildSize: 0.85,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // العنوان والموقع
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.apartment, color: Colors.blue),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.grey, size: 18),
                              SizedBox(width: 4),
                              Text(location, style: TextStyle(color: Colors.grey)),
                            ],
                          ),

                          SizedBox(height: 15),

                          // السعر
                          Row(
                            children: [
                              Text(
                                "${NumberFormat('#,###').format(pricePerNight)} SDG",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(width: 6),
                              Text("لكل ليلة", style: TextStyle(color: Colors.grey)),
                            ],
                          ),

                          SizedBox(height: 15),

                          // الوصف
                          Text(
                            description,
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),

                          SizedBox(height: 25),

                          // زر احجز الآن مع أنيميشن
                          Center(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.blue,
                                  elevation: 5,
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("تم إرسال طلب الحجز")),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.event_available, color: Colors.white),
                                    SizedBox(width: 8),
                                    Text(
                                      "احجز الآن",
                                      style: TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
