import 'package:flutter/material.dart';

class HotelDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality( // لدعم اللغة العربية
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          toolbarHeight: 0, // لإخفاء AppBar
        ),
        body: Column(
          children: [
            // صورة الفندق
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: PageView(
                    children: List.generate(5, (index) {
                      return Image.asset(
                        'assets/hotels/hotel1.jpg', // قم بإضافة صورة في مجلد assets
                        fit: BoxFit.cover,
                      );
                    }),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),

            // الاسم والتقييم والموقع
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("فندق سلام روتانا",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("الخرطوم",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Spacer(),

                  Icon(Icons.star, color: Colors.green, size: 20),
                  SizedBox(width: 4),
                  Text("4.7", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text("تقييم 1.5k", style: TextStyle(color: Colors.grey)),

                ],
              ),
            ),

            Divider(),

            // وسائل الراحة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("وسائل الراحة",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _iconWithLabel(Icons.wifi, "WiFi"),
                      _iconWithLabel(Icons.ac_unit, "Ac"),
                      _iconWithLabel(Icons.tv, "Tv"),
                      _iconWithLabel(Icons.free_breakfast, "Breakfast"),
                      _iconWithLabel(Icons.local_laundry_service, "Laundry"),
                      _iconWithLabel(Icons.water, "Geyser"),
                    ],
                  ),
                ],
              ),
            ),

            Divider(),

            // حول
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("حول",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  Text(
                    " فندق السلام روتانا من اعرق الفنادق في السودان وفيه كل سيل الراحة...",
                    style: TextStyle(height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            // الصف السفلي: مماثل، الصور، تقييم، موقع
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _bottomButton(Icons.article, "مماثل"),
                  _bottomButton(Icons.image, "الصور"),
                  _bottomButton(Icons.star, "تقييم"),
                  _bottomButton(Icons.map, "موقع"),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text("احجز الآن",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              Spacer(),
              Text("\$100.00",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(width: 5),
              Text("لـ 2 أشخاص", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconWithLabel(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.blue),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _bottomButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.grey[700]),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}