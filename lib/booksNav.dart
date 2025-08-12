import 'package:flutter/material.dart';
import 'package:safra_app/ticketBus.dart';
import 'package:safra_app/tickets/cab_ticket.dart';
import 'package:safra_app/tickets/flight_ticket.dart';
import 'package:safra_app/tickets/hotel_ticket.dart';
import 'package:safra_app/tickets/train_ticket.dart';

import 'appColors.dart';

class Booksnav extends StatelessWidget {
   Booksnav({Key? key}) : super(key: key);

  final List<Tab> tabs = const [
    Tab(text: 'جميع الحجوزات'),
    Tab(text: 'الطيران'),
    Tab(text: 'القطار'),
    Tab(text: 'الفندق'),
    Tab(text: 'الأوتوبيس'),
    Tab(text: 'يوم الإجازة'),
    Tab(text: 'الإقامة'),
    Tab(text: 'أخرى'),
  ];

  final List<Image> icons = [
    Image.asset(
      'assets/book.png',
      height: 40,
    ),       // جميع الحجوزات
    Image.asset(
      'assets/homeHead/ic_flight.png',
      height: 40,
    ),           // طيران
    Image.asset(
      'assets/homeHead/ic_train.png',
      height: 40,
    ),           // قطار
    Image.asset(
      'assets/homeHead/ic_hotels.png',
      height: 40,
    ),             // فندق
    Image.asset(
      'assets/homeHead/ic_bus.png',
      height: 40,
    ),   // أوتوبيس
    Image.asset(
      'assets/homeHead/ic_holiday.png',
      height: 40,
    ),     // يوم الإجازة
    Image.asset(
      'assets/homeHead/ic_homestay.png',
      height: 40,
    ),              // الإقامة
    Image.asset(
      'assets/homeHead/ic_more.png',
      height: 40,
    ),       // أخرى
  ];

  final List<List<Map<String, dynamic>>> bookingsData = const [
    [
      {'title': 'رحلة طيران إلى دبي', 'desc': 'الساعة 10 صباحًا', 'price': 1500},
      {'title': 'حجز فندق في القاهرة', 'desc': '3 ليالٍ', 'price': 750},
      {'title': 'أوتوبيس إلى الأسكندرية', 'desc': '5 مساءً', 'price': 120},
    ],
    [
      {'title': 'طيران إلى دنقلا', 'desc': '8 صباحًا', 'price': 950},
      {'title': 'طيران إلى كسلا', 'desc': '2 مساءً', 'price': 3200},
    ],
    [
      {'title': 'قطار عطبرة إلى الخرطوم', 'desc': '11 صباحًا', 'price': 60},
    ],
    [
      {'title': 'فندق النيل', 'desc': '4 ليالٍ - مزدوج', 'price': 2200},
      {'title': 'فندق السلام', 'desc': 'ليلتان - مفردة', 'price': 950},
    ],
    [
      {'title': 'بص الدمازين ', 'desc': 'يوم الإثنين', 'price': 90},
    ],
    [
      {'title': 'رحلة جبلية', 'desc': 'الجمعة القادمة', 'price': 350},
    ],
    [
      {'title': 'إقامة طويلة بالدامر', 'desc': 'حتى نهاية الشهر', 'price': 3000},
    ],
    [
      {'title': 'حجز خاص', 'desc': 'يحتاج مراجعة', 'price': 0},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            backgroundColor: Appcolors.Appbackground,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('حجوزاتي'),
              bottom: TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                isScrollable: true,
                indicatorColor: Colors.blue,
                tabs: tabs,
              ),
            ),
            body: TabBarView(
              children: List.generate(bookingsData.length, (tabIndex) {
                final icon = icons[tabIndex];
                final bookings = bookingsData[tabIndex];

                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child:
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15 , vertical: 0),
                        leading: icon,
                        title:  Container(
                          child: Text(
                            'السعر: ${booking['price']} جنيه',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w800 , fontSize: 16),
                          ) ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Text(
                          booking['title'],
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        ),

                            Text(booking['desc'], style: TextStyle(color: Colors.grey[600] , fontSize: 11)),
                            SizedBox(height: 5),

                          ],
                        ),
                        trailing: Icon(Icons.keyboard_double_arrow_left, size: 30 , color: Colors.blue,),
                        onTap: () {
                          // التنقل إلى صفحة التفاصيل لاحقًا
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CabTicket()),
                          );
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
