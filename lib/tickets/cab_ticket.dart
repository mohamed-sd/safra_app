import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../appColors.dart';

class CabTicket extends StatelessWidget {
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
            ' تم حجز سيارة ',
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
                          'assets/search/cab.png', // ضع صورة الأوتوبيس هنا
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' ليمون لايجار السيارات ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' الخرطوم - السوق العربي ',
                              style:
                              TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text('\$105.00',
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
                        image: AssetImage("assets/search/cab.png"), // الصورة
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
                            Icon(Icons.flight, size: 25, color: Colors.white),
                            Text(
                              ' السودان - امدرمان \nSudan-OMD',
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
                              ' تاريخ المشوار \nJun 23',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'معاد المشوار \n 11:45 pm ',
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
                                'سعة السيارة \n 4 مسافر',
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
                                ' الامتعة  \n 2 شنطة',
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

                  // باركود

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('تويوتا - صفراء' , style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            ),),
                            Text(' رقم اللوحة - 1 2 3 ح خ ' , style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13
                            )),
                          ],
                        ),
                        Image.asset('assets/search/cab.png' , width: 75,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              ' استدعاء سائق الكابينة ',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
