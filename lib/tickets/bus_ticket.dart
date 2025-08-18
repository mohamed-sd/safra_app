import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../appColors.dart';
import '../home.dart';

class BusTicket extends StatelessWidget {
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // السعر والشركة
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/search/bus.png', // ضع صورة الأوتوبيس هنا
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' ابو عامر للنقل البري ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' باص رقم 21 ',
                              style:
                              TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text('60.000 SDG',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ],
                    ),
                  ),

                  // صورة الوجهة
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/search/bus.png"), // الصورة
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Appcolors.trans,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' السودان - الخرطوم \nSudan-KTR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),

                            Text(
                              ' السودان - عطبرة \nSudan-ATB',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
                            Text(
                              'مغادرة\nJun, 12:35 am 23',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'وصول\nJun, 11:45 pm 24',
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
                                'الدرجة \n Economy',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                ' مجموع المقاعد \n 50',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                ' المقعد \n 23',
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
                                'اسم الراكب \n Mohamed Ahmed ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                ' من \n 25',
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
