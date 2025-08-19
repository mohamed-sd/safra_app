import 'package:flutter/material.dart';
import 'package:safra_app/appColors.dart';
import 'package:safra_app/confirm/flight_confirm.dart';
import '../confirm/ship_confirm.dart';
import '../widgets/custom_back_button.dart';

class ShipDetails extends StatefulWidget {
  final String? fromCity;
  final String? toCity;

  const ShipDetails({Key? key, this.fromCity, this.toCity}) : super(key: key);

  @override
  State<ShipDetails> createState() => _ShipDetailsState();
}

class _ShipDetailsState extends State<ShipDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _offsetAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );

    // تشغيل الأنيميشن عند فتح الصفحة
    Future.delayed(Duration(milliseconds: 300), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String fromCity;
    String toCity;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Appcolors.background,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 80), // مساحة للزر الثابت
              child: Column(
                children: [
                  // صورة مع معلومات الرحلة
                  Stack(
                    children: [
                      Image.asset(
                        "assets/search/ship.jpg",
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: 250,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Positioned(
                        top: 40,
                        right: 16,
                        child: CustomBackButton(),
                      ),
                      Positioned(
                        top: 80,
                        right: 16,
                        child: Row(
                          children: [
                            Text("1 المسافر", style: TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                            Text("23 يوليو 2019", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          children: [
                            // من
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'ميناء بورسودان',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'من الخرطوم',
                                prefixIcon: Icon(
                                  Icons.directions_boat,
                                  color: Colors.blue,
                                ),
                              ),
                              onChanged: (value) => fromCity = value,
                              validator: (value) =>
                              value == null || value.isEmpty
                                  ? 'أدخل مدينة الانطلاق'
                                  : null,
                            ),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: ' ميناء جدة ',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'الي جدة',
                                prefixIcon: Icon(
                                  Icons.directions_boat,
                                  color: Colors.blue,
                                ),
                              ),
                              onChanged: (value) => toCity = value,
                              validator: (value) =>
                              value == null || value.isEmpty
                                  ? 'أدخل الوجهة'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // معلومات الأمتعة
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        baggageInfo("20 كجم", "الأمتعة المشحونة"),
                        baggageInfo("20 كجم", "الأمتعة المشحونة"),
                        baggageInfo("6 كجم", "حقيبة يد"),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  // أسعار المقاعد
                  seatOption("\$158.50", "اقتصادي", "50 مقعد متبقي"),
                  seatOption("\$210.00", "اقتصادي مميز", "78 مقعد متبقي"),
                  seatOption("\$300.00", "درجة رجال الأعمال", "25 مقعد متبقي"),
                ],
              ),
            ),

            // زر الحجز الثابت بأسفل الشاشة مع أنيميشن
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ShipConfirm()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text("احجز الآن",
                              style:
                              TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text("\$158.00",
                              style:
                              TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget baggageInfo(String weight, String label) {
    return Column(
      children: [
        Icon(Icons.luggage, color: Colors.black54),
        SizedBox(height: 4),
        Text(weight, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget seatOption(String price, String title, String seatsLeft) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(seatsLeft, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          Text(price,
              style:
              TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold)),

        ],
      ),
    );
  }
}
