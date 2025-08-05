import 'package:flutter/material.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 365,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/banner_bg.png"),
                    fit: BoxFit.cover, // لتغطية كامل الحاوية
                  ),
                ),
                child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Color(0x7B131313)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'سفرة ناخذك الي حيث تنتمي ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFF29FFF8),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '... اكتشف السودان والعالم مع افضل عروض السفر والاقامة ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Color(0xFF29FFF8)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  headerCard(
                                    'طيران',
                                    Image.asset(
                                      'assets/homeHead/ic_flight.png',
                                      height: 30,
                                    ),
                                  ),
                                  headerCard(
                                    'الفنادق',
                                    Image.asset(
                                      'assets/homeHead/ic_hotels.png',
                                      height: 30,
                                    ),
                                  ),
                                  headerCard(
                                    'القطارات',
                                    Image.asset(
                                      'assets/homeHead/ic_train.png',
                                      height: 30,
                                    ),
                                  ),
                                  headerCard(
                                    'العطلات',
                                    Image.asset(
                                      'assets/homeHead/ic_holiday.png',
                                      height: 30,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  headerCard(
                                    'اوتوبيس',
                                    Image.asset(
                                      'assets/homeHead/ic_bus.png',
                                      height: 30,
                                    ),
                                  ),
                                  headerCard(
                                    'سيارة الاجرة',
                                    Image.asset(
                                      'assets/homeHead/ic_cabs.png',
                                      height: 30,
                                    ),
                                  ),
                                  headerCard(
                                    'الإقامة',
                                    Image.asset(
                                      'assets/homeHead/ic_homestay.png',
                                      height: 30,
                                    ),
                                  ),
                                  headerCard(
                                    'اكثر',
                                    Image.asset(
                                      'assets/homeHead/ic_more.png',
                                      height: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Color(0x94E1E1E1)),
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
        )
        ),
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

  Expanded headerCard(String title, Image image) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Color(0x54000000), borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0x5A595858),
              borderRadius: BorderRadius.circular(16)),
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
      ),
    );
  }

}
