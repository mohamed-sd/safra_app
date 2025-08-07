import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // دعم العربية
      child: Scaffold(
        backgroundColor: Color(0xFF1CA4F5), // الخلفية الزرقاء
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Colors.white),
          centerTitle: true,
          title: Text(
            'حجزت تذكرة',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // السعر والشركة
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text('\$105.00',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'بص عطبرة',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '2X1(36) AC -Sleeper TATA',
                              style:
                              TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        Image.asset(
                          'assets/icons/bus.png', // ضع صورة الأوتوبيس هنا
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),

                  // صورة الوجهة
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage("assets/icons/bus.png"), // الصورة
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'White church,\nManhattan, USA',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Old City Market\nHouston, USA',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // بيانات التذكرة
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('وصول\nJun, 11:45 pm 24'),
                            Text('ناتج\nJun, 12:35 am 23'),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('مقعد\nB3'),
                            Text('مجموع المقعد\n01'),
                            Text('صف دراسي\nUpper Seat'),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('جنس\nMale'),
                            Text('سن\n25'),
                            Text('اسم الراكب\nahmed'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // باركود
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: '01 18901072 00015 0 (17) 190831 (10) LM123',
                      width: double.infinity,
                      height: 80,
                      drawText: false,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'تذكرة الفجر',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}