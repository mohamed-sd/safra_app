import 'package:flutter/material.dart';
import '../appColors.dart';
import '../confirm/hafla_confirm.dart';
import '../tickets/hafla_ticket.dart';
import '../widgets/custom_back_button.dart';

class HaflaDetails extends StatelessWidget {
  final int totalSeats = 50;
  final List<int> availableSeats = [5, 17, 23]; // المقاعد المتاحة

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
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
                      image: AssetImage("assets/search/bus.png"),
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
                        Text("الخرطوم الي امدرمان",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("23-June - باص والي  ",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // شريط المزايا
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
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

            // مخطط المقاعد
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(children: [
                                Container(width: 10, height: 10, color: Colors.green,),
                                SizedBox(width: 5,),
                                Text('السائق والمساعد')
                              ],),
                              Row(children: [
                                Container(width: 10, height: 10, color: Colors.red,),
                                SizedBox(width: 5,),
                                Text('محجوز')
                              ],),
                              Row(children: [
                                Container(width: 10, height: 10, color: Colors.blue,),
                                SizedBox(width: 5,),
                                Text('متاح')
                              ],),

                            ],
                          ),

                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(' باص والي ' , style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text(' 50 راكب ', style: TextStyle(
                                    fontSize: 13,
                                  )),
                                ],),
                              SizedBox(width: 10,),
                              Image.asset('assets/search/bus.png' , width: 40,),


                            ],
                          ),

                        ],
                      ),
                    ),

                    Text("مخطط المقاعد", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 10),



                    _busSeatLayout(context),
                  ],
                ),
              ),
            ),

            // زر الحجز
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HaflaConfirm()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.blue.shade800, Colors.blue]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("BOOK SEAT", style: TextStyle(color: Colors.white, fontSize: 16)),
                    Row(
                      children: [
                        Text("23 المقعد ", style: TextStyle(color: Colors.white, fontSize: 14)),
                        Text(" 3.000 SDG", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
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
