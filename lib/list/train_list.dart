import 'package:flutter/material.dart';
import 'package:safra_app/appColors.dart';
import '../detailes/train_detailes.dart';
import '../widgets/custom_back_button.dart';

class TrainList extends StatefulWidget {
  const TrainList({super.key});

  @override
  _TrainTicketResultsState createState() => _TrainTicketResultsState();
}

class _TrainTicketResultsState extends State<TrainList> {
  int selectedDay = 0;
  List<DateTime> days =
  List.generate(10, (index) => DateTime.now().add(Duration(days: index)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      body: SingleChildScrollView(
        child: Column( // أزلنا Expanded
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/search/train.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: CustomBackButton(),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("الخرطوم → مدني",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text("عدد المسافرين: 2 | الدرجة: أولى",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: List.generate(
                  10,
                      (index) => trainCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell trainCard() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TrainDetailes()));
      },
      child: Column(
        children: [
          Card(
            color: Colors.white,
            margin: EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 3),
            elevation: 6,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.white,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('الناقل الاخضر',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(width: 5),
                          Text(' الخرطوم  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black)),
                        ],
                      ),
                      Text('عرض الطريق',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/search/train.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('23 Jun, 12:35 am',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                          Text('الخرطوم', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('الزمن', style: TextStyle(fontSize: 10)),
                          Container(
                            width: 60,
                            height: 2,
                            color: Colors.blue,
                            margin: EdgeInsets.symmetric(vertical: 4),
                          ),
                          Text('2 h 12 m', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('23 Jun, 12:35 am',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                          Text('مدني', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 38,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ticketTypeCard('درجة اولي', '\$30.00', '120'),
                ticketTypeCard('درجة الثانية', '\$20.00', '78'),
                ticketTypeCard('عادي', '\$18.00', '100'),
              ],
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Card ticketTypeCard(String title, String price, String seats) {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.all(3),
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            Text(' ($price) -',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            Text(seats,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                    color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
