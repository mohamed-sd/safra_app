import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../appColors.dart';
import '../home.dart';

class HotelTicket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // دعم العربية
      child: Scaffold(
        backgroundColor: Color(0xFF1CA4F5), // الخلفية الزرقاء
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
              },
              child: Icon(Icons.arrow_back, color: Colors.white)),
          centerTitle: true,
          title: Text(
            'حجزت غرفة الفندق',
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // السعر والشركة
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' فندق سلام روتانا ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' الخرطوم - السوق العربي  ',
                              style:
                              TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text('\$173.00',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ],
                    ),
                  ),

                  // صور الفندق
                  Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset('assets/search/hotel.png',width: 120,),
                        Image.asset('assets/search/hotel.png',width: 120,),
                        Image.asset('assets/search/hotel.png',width: 120,),
                        Image.asset('assets/search/hotel.png',width: 120,),
                        Image.asset('assets/search/hotel.png',width: 120,),
                        Image.asset('assets/search/hotel.png',width: 120,),
                      ],
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
                            Text(
                              'الحجز\nJun, 12:35 am 23',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'الدفع\nJun, 11:45 pm 24',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'رقم الغرفة \n B12',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            // Expanded(
                            //   flex: 2,
                            //   child: Text(
                            //     ' البوابة \n C11',
                            //     style: TextStyle(fontWeight: FontWeight.bold),
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                ' مجموع الضيوف \n 05',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.end,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'حجزت من قبل  \n Mohamed Ahmed ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                ' سن \n 25',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                ' جنس \n Male',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.end,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xFF1CA4F5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            )),
                      ),
                      Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          )),
                      Container(
                        width: 15,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xFF1CA4F5),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            )),
                      ),
                    ],
                  ),

                  Text('خريطة'),

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
              ' احصل علي اتجاه ',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
