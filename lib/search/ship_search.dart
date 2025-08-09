import 'dart:async';
import 'package:flutter/material.dart';
import 'package:safra_app/appColors.dart';

import '../widgets/custom_action_button.dart';
import '../widgets/custom_back_button.dart';

class ShipSearch extends StatefulWidget {
  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<ShipSearch> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> imagePaths = [
    "assets/search/flight.png",
    "assets/search/flight.png",
    "assets/search/flight.png",
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
                  height: 300,
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
                        padding: EdgeInsets.only(right: 16, left: 16 , top: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomBackButton(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'البحث عن الحلات البحرية ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // SizedBox(height: 5),
                                // Row(
                                //   children: [
                                //     Icon(Icons.location_on, color: Color(0xFF29FFF8)),
                                //     SizedBox(width: 8),
                                //     Expanded(
                                //       child: Text(
                                //         '... اكتشف السودان والعالم مع افضل عروض السفر والاقامة ',
                                //         style: TextStyle(
                                //           color: Colors.white,
                                //           fontSize: 13,
                                //           fontWeight: FontWeight.w600,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                Divider(color: Color(0xFF29FFF8)),
                              ],
                            ),
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
                    ),
                  ),
                )),
                SizedBox(
                  width: double.infinity,
                  child: CustomActionButton(
                    text: " البحث عن رحلة ",
                    icon: Icons.directions_boat,
                    backgroundColor: Appcolors.primary,
                    onPressed: () {
                      print("تم الضغط على الزر");
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
