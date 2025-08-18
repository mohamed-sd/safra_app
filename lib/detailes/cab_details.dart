import 'package:flutter/material.dart';
import 'package:safra_app/confirm/cab_confirm.dart';
import 'package:safra_app/tickets/cab_ticket.dart';
import '../appColors.dart';
import '../confirm/hafla_confirm.dart';
import '../tickets/hafla_ticket.dart';
import '../widgets/custom_back_button.dart';

class CabDetails extends StatelessWidget {
  final int totalSeats = 50;
  final List<int> availableSeats = [5, 17, 23]; // المقاعد المتاحة

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Appcolors.background,
        body: Column(
          children: [
            // صورة الباص + النصوص
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/search/cab.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(height: 160, color: Appcolors.trans),
                Positioned(right: 10, top: 40, child: CustomBackButton()),
                Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Text("الخرطوم الي مدني",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        Text( " 23-June - ممتلئة - 2 شنط ",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 10),

            // مخطط المقاعد
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Row(
                              children: [
                                Text('4,7',style: TextStyle(color: Colors.white,fontSize:12
                                    ,fontWeight: FontWeight.bold),),
                                SizedBox(width: 5,),
                                Icon(Icons.star , size: 15,color: Colors.white),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset('assets/search/cab.png' , width: 60,),
                                  Text(' اكسنت دبدوب ' , style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text(' سيارة صالون ', style: TextStyle(
                                    fontSize: 13,
                                  )),
                                ],),
                              SizedBox(width: 10,),

                            ],
                          ),

                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.wheelchair_pickup, size: 15,),
                              SizedBox(width: 5,),
                              Text('4'),
                              SizedBox(width: 5,),
                              Text('seater'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.wifi, size: 15,),
                              SizedBox(width: 5,),
                              Text('WIFI'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.shopping_bag, size: 15,),
                              SizedBox(width: 5,),
                              Text('2'),
                              SizedBox(width: 5,),
                              Text('Bags'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.ac_unit, size: 15,),
                              SizedBox(width: 5,),
                              Text('AC'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('معلومات' , style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 16
                          ),),
                          Text('رحلة كاملة الي مدني ذهاب واياب من والي في التوقيت المحدد السيارة تسع 4 اشخاص فقط واحد مع السائق في الامام وثلاثة في الخلف مع وجود مساحة في شنطة السيارة من اجل 4 شنط فقط تبدا الرحلة وتنتهي في المواعيد المحددة ',
                          textAlign: TextAlign.end,)
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('شركة ترحال', style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 16
                          ),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('عرض جميع السيارات',style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 13
                              ),),
                              Row(
                                children: [
                                  Text('ترحال  ',style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 18
                                  ),),
                                  SizedBox(width: 10,),
                                  Image.asset('assets/search/cab.png' , width: 40,),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    // Text("مخطط المقاعد", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    // SizedBox(height: 10),



                    //_busSeatLayout(context),
                  ],
                ),
              ),
            ),
          ],
        ),
        // زر احجز الآن
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CabConfirm()));
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                colors: [Colors.blue.shade700, Colors.blueAccent],
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("احجز الآن",
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Text("30.000 SDG",
                    style: TextStyle(color: Colors.white, fontSize: 18 , fontWeight: FontWeight.w700)),
                SizedBox(width: 5),
                Text("لـ 4 أشخاص", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ),
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

  Widget _busSeatLayout(BuildContext context) {
    List<int?> seatNumbers = [];
    int seatCounter = 0;

    // الصفوف العادية قبل آخر كنبة
    for (int row = 0; row < 12; row++) {
      seatNumbers.add(seatCounter++); // يمين
      seatNumbers.add(seatCounter++); // يمين
      seatNumbers.add(null); // الممر
      seatNumbers.add(seatCounter++); // شمال
      seatNumbers.add(seatCounter++); // شمال
    }

    // آخر كنبة (4 مقاعد بدون ممر)
    seatNumbers.add(seatCounter++);
    seatNumbers.add(seatCounter++);
    seatNumbers.add(seatCounter++);
    seatNumbers.add(seatCounter++);
    seatNumbers.add(seatCounter++);

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26, width: 2),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          // مقدمة الباص
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            alignment: Alignment.center,
            child: Text("مقدمة الباص", style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          SizedBox(height: 10),

          // شبكة المقاعد
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: seatNumbers.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final seatNum = seatNumbers[index];

              if (seatNum == null) {
                // الممر
                return SizedBox.shrink();
              }

              // كرسي السائق (أول كرسي يمين أعلى)
              if (seatNum == 0 || seatNum == 1) {
                return _buildSeat(seatNum, Colors.green);
              }

              // المقاعد الأخرى
              Color seatColor = availableSeats.contains(seatNum)
                  ? Colors.blue
                  : Colors.red;

              return _buildSeat(seatNum, seatColor);
            },
          ),

          // مؤخرة الباص
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeat(int seatNum, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Text(
        "$seatNum",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
