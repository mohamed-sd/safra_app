import 'package:flutter/material.dart';
import 'package:safra_app/ticketBus.dart';
import 'package:safra_app/tickets/appartment_ticket.dart';
import 'package:safra_app/tickets/bus_ticket.dart';
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
    Tab(text: 'البواخر'),
    Tab(text: 'القطارات'),
    Tab(text: 'الباصات'),
    Tab(text: 'الحافلات'),
    Tab(text: 'سيارات اجرة'),
    Tab(text: 'الفنادق'),
    Tab(text: 'الشقق'),
  ];

  final List<Image> icons = [
    Image.asset('assets/book.png', height: 40), // جميع الحجوزات
    Image.asset('assets/homeHead/ic_flight.png', height: 40), // طيران
    Image.asset('assets/homeHead/ic_flight.png', height: 40), // البواخر
    Image.asset('assets/homeHead/ic_train.png', height: 40), // القطارات
    Image.asset('assets/homeHead/ic_bus.png', height: 40), // الباصات
    Image.asset('assets/homeHead/ic_bus.png', height: 40), // الحافلات
    Image.asset('assets/homeHead/ic_cabs.png', height: 40), // سيارات الاجرة
    Image.asset('assets/homeHead/ic_hotels.png', height: 40),// الفنادق
    Image.asset('assets/homeHead/ic_hotels.png', height: 40),// الشقق
  ];

  final List<List<Map<String, dynamic>>> bookingsData = const [
    [
      {'title': 'رحلة طيران إلى دبي', 'desc': 'الساعة 10 صباحًا', 'price': 1500},
      {'title': 'حجز فندق في القاهرة', 'desc': '3 ليالٍ', 'price': 750},
      {'title': 'أوتوبيس إلى الأسكندرية', 'desc': '5 مساءً', 'price': 120},
    ],
    [
      {'title': 'طيران إلى نيالا', 'desc': '8 صباحًا', 'price': 950},
      {'title': 'طيران إلى كسلا', 'desc': '2 مساءً', 'price': 3200},
    ],
    [

    ],
    [
      {'title': ' قطار الخرطوم مدني ', 'desc': '11 صباحًا', 'price': 60},
    ],
    [
      {'title': 'بص عطبرة ', 'desc': 'يوم الإثنين', 'price': 9000},
      {'title': 'بص الدمازين ', 'desc': 'يوم الإثنين', 'price': 18000},
    ],
    [
      {'title': ' الخرطوم الصحافة ', 'desc': 'الجمعة القادمة', 'price': 350},
    ],
    [
      {'title': ' مشورا الي امدرمان  ', 'desc': ' غدا ', 'price': 3000},
    ],
    [
      {'title': 'فندق سلام روتانا', 'desc': 'ليلتان - مفردة', 'price': 9500},
      {'title': 'فندق النيل', 'desc': '4 ليالٍ - مزدوج', 'price': 2200},
    ],
    [
      {'title': ' شقة بحري المهندسين ', 'desc': ' 2 غرفة 3 حمام ', 'price': 200000},
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
              title: const Text('حجوزاتي'),
              bottom: TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold),
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
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        leading: icon,
                        title: Text(
                          'السعر: ${booking['price']} جنيه',
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking['title'],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              booking['desc'],
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 11),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.keyboard_double_arrow_left,
                          size: 30,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          switch (tabIndex) {
                            case 0: // جميع الحجوزات
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>  CabTicket()),
                              // );
                              break;
                            case 1: // الطيران
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  FlightTicket()),
                              );
                              break;
                            case 2: // البواخر
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>  TrainTicket()),
                              // );
                              break;
                            case 3: // القطار
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  TrainTicket()),
                            );
                              break;
                            case 4: // الباصات
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  BusTicket()),
                            );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>  HotelTicket()),
                              // );
                              break;
                            case 6: // سسارات الاجرة
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  CabTicket()),
                              );
                              break;
                            case 7: // سسارات الاجرة
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  HotelTicket()),
                              );
                              break;
                            case 8: // سسارات الاجرة
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  AppartmentTicket()),
                              );
                              break;
                            default:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("لا توجد صفحة مخصصة لهذا التبويب")),
                              );
                          }
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
