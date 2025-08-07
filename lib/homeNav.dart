import 'dart:async';
import 'package:flutter/material.dart';
import 'package:safra_app/appColors.dart';
import 'package:safra_app/search/apartment_search.dart';
import 'package:safra_app/search/bus_search.dart';
import 'package:safra_app/search/cab_search.dart';
import 'package:safra_app/search/flight_search.dart';
import 'package:safra_app/search/hafla_search.dart';
import 'package:safra_app/search/hotel_search.dart';
import 'package:safra_app/search/ship_search.dart';
import 'package:safra_app/search/train_search.dart';

class HomeNav extends StatefulWidget {
  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<HomeNav> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> imagePaths = [
    "assets/banner_bg.png",
    "assets/banner_bg.png",
    "assets/banner_bg.png",
  ];

  @override
  void initState() {
    super.initState();
    // لتغيير الصور تلقائيًا كل 5 ثواني
    Future.delayed(Duration.zero, () {
      Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (_pageController.hasClients) {
          int nextPage = (_currentPage + 1) % imagePaths.length;
          _pageController.animateToPage(
            nextPage,
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
          setState(() {
            _currentPage = nextPage;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  height: 365,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: imagePaths.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      ),
                      Container(
                        color: Color(0x7B131313), // التعتيم
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'سفرة ناخذك الي حيث تنتمي ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: Color(0xFF29FFF8)),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        '... اكتشف السودان والعالم مع افضل عروض السفر والاقامة ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(color: Color(0xFF29FFF8)),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FlightSearch()),
                                            );
                                          },
                                          child: headerCard(
                                              'طيران',
                                              Image.asset(
                                                  'assets/homeHead/ic_flight.png',
                                                  height: 30))),
                                    ),
                                    Expanded(
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShipSearch()),
                                              );
                                            },
                                            child: headerCard(
                                                'بواخر',
                                                Image.asset(
                                                    'assets/homeHead/ic_more.png',
                                                    height: 30)))),
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TrainSearch()),
                                            );
                                          },
                                          child: headerCard(
                                              'القطارات',
                                              Image.asset(
                                                  'assets/homeHead/ic_train.png',
                                                  height: 30))),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BusSearch()),
                                            );
                                          },
                                          child: headerCard(
                                              'الباصات ',
                                              Image.asset(
                                                  'assets/homeHead/ic_bus.png',
                                                  height: 30))),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HaflaSearch()),
                                            );
                                          },
                                          child: headerCard(
                                              'حافلات',
                                              Image.asset(
                                                  'assets/homeHead/ic_bus.png',
                                                  height: 30))),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CabSearch()),
                                            );
                                          },
                                          child: headerCard(
                                              'سيارات اجرة',
                                              Image.asset(
                                                  'assets/homeHead/ic_cabs.png',
                                                  height: 30))),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HotelSearch()),
                                            );
                                          },
                                          child: headerCard(
                                              'الفنادق',
                                              Image.asset(
                                                  'assets/homeHead/ic_hotels.png',
                                                  height: 30))),
                                    ),
                                    Expanded(
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ApartmentSearch()),
                                              );
                                            },
                                            child: headerCard(
                                                'شقة ',
                                                Image.asset(
                                                    'assets/homeHead/ic_homestay.png',
                                                    height: 30)))),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(color: Appcolors.Appbackground),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // MainContainer
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    Text(
                                      'الفنادق',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    // Perf
                                    Text(
                                      'استكشف افضل الفنادق لدينا',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 160,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // MainContainer
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    Text(
                                      'الفنادق',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    // Perf
                                    Text(
                                      'استكشف افضل الفنادق لدينا',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 160,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // MainContainer
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    Text(
                                      'الفنادق',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    // Perf
                                    Text(
                                      'استكشف افضل الفنادق لدينا',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 160,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // MainContainer
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    Text(
                                      'الفنادق',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    // Perf
                                    Text(
                                      'استكشف افضل الفنادق لدينا',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 160,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                    homeCard(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          )),
    );
  }

  Container homeCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: 200,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: Image.asset(
                'assets/hotels/hotel1.jpg',
                height: 100,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '150.SDG',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w800,
                      fontSize: 13),
                ),
                Text('فندق روتانا سلام',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w800,
                        fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container headerCard(String title, Image image) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0x54000000), borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0x5A595858), borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0x628F8E8E),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              image,
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
