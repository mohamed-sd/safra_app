import 'package:flutter/material.dart';
import 'package:safra_app/detailes/hotelDetalas.dart';
import 'package:safra_app/widgets/custom_back_button.dart';

class HotelScreen extends StatelessWidget {
  final List<String> hotelImages = [
    'assets/search/hotel.png',
    'assets/search/hotel.png',
    'assets/search/hotel.png',
    'assets/search/hotel.png',
  ];

  // بطاقة الفندق (شكل تذكرة)
  Widget buildHotelCard(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HotelDetailsScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 4))
          ],
        ),
        child: ClipPath(
          clipper: TicketClipper(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صور الفندق (تمرير أفقي)
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 280,
                      margin: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.asset(
                              hotelImages[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.25),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // تفاصيل السعر والتقييم
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '\$120 / الليلة',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        SizedBox(width: 4),
                        Text("4.7",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),

              // اسم الفندق مع تدرج أزرق-أبيض
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ Colors.white , Colors.blue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: const Text(
                  'فندق سلام روتانا - الخرطوم',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // الهيدر مع طبقة سوداء شفافة
  Widget buildHeader(BuildContext context) {
    return Stack(
      children: [
        // صورة الخلفية
        Image.asset(
          'assets/search/hotel.png',
          width: double.infinity,
          height: 240,
          fit: BoxFit.cover,
        ),
        // طبقة سوداء شفافة
        Container(
          width: double.infinity,
          height: 240,
          color: Colors.black.withOpacity(0.4),
        ),
        // تدرج علوي
        Container(
          height: 240,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.6)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // AppBar مخصص
        Positioned(
          top: 2,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 10,),
                  CustomBackButton(),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // معلومات الفندق
        Positioned(
          bottom: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "فندق سلام روتانا",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                "الخرطوم - السودان",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                "الوصول: 23 إبريل  •  المغادرة: 27 إبريل  •  2 ضيوف",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Column(
            children: [
              buildHeader(context),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => buildHotelCard(context),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 40,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue]),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.map, color: Colors.white),
                    label: const Text("عرض الخريطة",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const VerticalDivider(color: Colors.white),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, color: Colors.white),
                    label: const Text("ترشيحات",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// قص شكل التذكرة
class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 12;
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // قص دائري على اليمين واليسار
    path.addOval(Rect.fromCircle(center: Offset(0, size.height / 2), radius: radius));
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, size.height / 2), radius: radius));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
