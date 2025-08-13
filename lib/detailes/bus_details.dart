import 'package:flutter/material.dart';

import '../appColors.dart';
import '../widgets/custom_back_button.dart';

class BusDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // صورة القطار + النصوص
          Stack(
            children: [
              // صورة الخلفية
              Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/search/bus.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // طبقة التدرج
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Appcolors.trans,
                ),
              ),

              // زر الرجوع
              Positioned(
                right: 10,
                top: 40,
                child: CustomBackButton(),
              ),

              // العنوان
              Positioned(
                top: 70,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "الخرطوم الي عطبرة",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        " 23-June - ابو عامر - مكييف ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),

          // الشريط الأبيض للمزايا
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade200, blurRadius: 5),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _featureItem("kg bag 6"),
                _featureItem("Power"),
                _featureItem("AC"),
                _featureItem("WiFi"),
              ],
            ),
          ),

          SizedBox(height: 10),

          // خريطة المقاعد
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Upper Seats", style: TextStyle(fontWeight: FontWeight.bold)),
                  _seatGrid(),

                  SizedBox(height: 20),

                  Text("Lower Seats", style: TextStyle(fontWeight: FontWeight.bold)),
                  _seatGrid(),
                ],
              ),
            ),
          ),

          // زر الحجز
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.blue],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("BOOK B3 SEAT", style: TextStyle(color: Colors.white, fontSize: 16)),
                Row(
                  children: [
                    Text("1 المقعد ", style: TextStyle(color: Colors.white, fontSize: 14)),
                    Text(" 90.50 \$", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureItem(String text) {
    return Column(
      children: [
        Icon(Icons.check_circle_outline, color: Colors.grey, size: 20),
        SizedBox(height: 5),
        Text(text, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _seatGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          Color seatColor;
          if (index == 2) {
            seatColor = Colors.blue; // مختار
          } else if (index % 3 == 0) {
            seatColor = Colors.red; // محجوز
          } else {
            seatColor = Colors.grey.shade300; // فارغ
          }
          return Container(
            decoration: BoxDecoration(
              color: seatColor,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }
}
