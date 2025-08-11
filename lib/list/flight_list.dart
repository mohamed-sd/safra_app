import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:safra_app/appColors.dart';
import 'package:safra_app/detailes/flight_details.dart';
import 'package:safra_app/widgets/custom_back_button.dart';

class FlightList extends StatelessWidget {
  final String fromCity = "الخرطوم";
  final String toCity = "نيالا";
  final String departureTime = "08:30 AM";
  final String passengers = "2 مسافرين";
  final String travelClass = "الدرجة السياحية";

  final List<Map<String, dynamic>> dates = List.generate(10, (index) {
    DateTime date = DateTime.now().add(Duration(days: index));
    return {
      "label": "${date.day} ${_monthAbbreviation(date.month)}",
      "price": (150 + index * 5).toString() + "\$"
    };
  });

  static String _monthAbbreviation(int month) {
    const months = [
      "JAN", "FEB", "MAR", "APR", "MAY", "JUN",
      "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: dates.length,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Appcolors.Appbackground,
          appBar: AppBar(
            leading: Row(
              children: [
                SizedBox(width: 16,),
                CustomBackButton(),
              ],
            ),
            leadingWidth: 60,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "من $fromCity الي $toCity",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "$departureTime - $passengers - $travelClass",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
            flexibleSpace: Stack(
              children: [
                Image.asset(
                  "assets/search/flight.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Container(
                color: Colors.white,
                child: TabBar(
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 12
                  ),
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  indicatorPadding: EdgeInsets.all(5),
                  tabs: dates.map((d) {
                    return FadeInUp(
                      duration: Duration(milliseconds: 300),
                      child: Container(
                        width: 70,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(d['label'], style: TextStyle(fontSize: 12)),
                            SizedBox(height: 4),
                            Text(
                              d['price'],
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: dates.map((d) {
              return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return FadeInUp(
                    duration: Duration(milliseconds: 300 + index * 100),
                    child: _buildTicketCard(
                      airline: "Sudan Airways",
                      seat: "A$index",
                      price: d['price']!,
                      departureTime: "08:30 AM",
                      departureCity: fromCity,
                      arrivalTime: "10:15 AM",
                      arrivalCity: toCity,
                      stops: index % 2 == 0 ? "بدون توقف" : "توقف واحد",
                      duration: "1h 45m",
                      cxt: context,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildTicketCard({
    required String airline,
    required String seat,
    required String price,
    required String departureTime,
    required String departureCity,
    required String arrivalTime,
    required String arrivalCity,
    required String stops,
    required String duration,
    BuildContext? cxt ,
  }) {
    return InkWell(
      onTap: (){
        Navigator.push(
          cxt!,
          MaterialPageRoute(builder: (context) => FlightDetails()),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [

            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                gradient: LinearGradient(
                  colors: [ Colors.blue , Colors.white,],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.flight_takeoff, color: Colors.black),
                      SizedBox(width: 8),
                      Text(airline,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black)),
                    ],
                  ),
                  Text(price,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey.shade300,
                    child: Icon(Icons.flight, color: Colors.blue),
                  ),
                  SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(departureTime,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(departureCity, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(stops, style: TextStyle(fontSize: 10)),
                      Container(
                        width: 60,
                        height: 2,
                        color: Colors.blue,
                        margin: EdgeInsets.symmetric(vertical: 4),
                      ),
                      Text(duration, style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(arrivalTime,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(arrivalCity, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
