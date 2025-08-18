import 'package:flutter/material.dart';
import 'package:safra_app/confirm/hotel_confirm.dart';
import 'package:safra_app/tickets/hotel_ticket.dart';

import '../widgets/custom_back_button.dart';

class HotelDetailsScreen extends StatefulWidget {
  @override
  _HotelDetailsScreenState createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _slideAnimation =
        Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            // صور الفندق
            SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView(
                children: List.generate(5, (index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/hotels/hotel1.jpg',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),

            // AppBar
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    CustomBackButton(),
                    Spacer(),
                    _circleButton(Icons.favorite_border, () {}),
                  ],
                ),
              ),
            ),

            // تفاصيل الفندق
            DraggableScrollableSheet(
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 1.0,
              builder: (context, scrollController) {
                return SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _hotelHeader(),
                          Divider(height: 24),
                          _amenities(),
                          Divider(height: 24),
                          _aboutHotel(),
                          SizedBox(height: 20),
                          _bookingCard(),
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),

        // زر احجز الآن
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HotelConfirm()));
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                colors: [Colors.blue.shade700, Colors.blueAccent],
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("احجز الآن",
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Text("\$100.00",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(width: 5),
                Text("لـ 2 أشخاص", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(8),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _hotelHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("فندق سلام روتانا",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("الخرطوم", style: TextStyle(color: Colors.grey)),
          ],
        ),
        Spacer(),
        Icon(Icons.star, color: Colors.green, size: 20),
        SizedBox(width: 4),
        Text("4.7", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 8),
        Text("تقييم 1.5k", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _amenities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("وسائل الراحة",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _iconWithLabel(Icons.wifi, "WiFi"),
            _iconWithLabel(Icons.ac_unit, "AC"),
            _iconWithLabel(Icons.tv, "TV"),
            _iconWithLabel(Icons.free_breakfast, "فطور"),
            _iconWithLabel(Icons.local_laundry_service, "غسيل"),
            _iconWithLabel(Icons.water, "سخان"),
          ],
        ),
      ],
    );
  }

  Widget _aboutHotel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("حول",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 8),
        Text(
          "فندق السلام روتانا من أعرق الفنادق في السودان ويوفر جميع وسائل الراحة...",
          style: TextStyle(height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _bookingCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _dateColumn("تاريخ الوصول", "15 أغسطس 2025"),
                _dateColumn("تاريخ المغادرة", "20 أغسطس 2025"),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade300),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(16)),
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.white],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Center(
              child: Text(
                "حجز باسم: أحمد محمد",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateColumn(String title, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        Text(date, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
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
}
