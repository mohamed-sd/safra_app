import 'package:flutter/material.dart';
import 'package:safra_app/tickets/appartment_ticket.dart';
import 'package:safra_app/tickets/bus_ticket.dart';
import 'package:safra_app/tickets/cab_ticket.dart';
import 'package:safra_app/tickets/flight_ticket.dart';
import 'package:safra_app/tickets/hafla_ticket.dart';
import 'package:safra_app/tickets/hotel_ticket.dart';
import 'package:safra_app/tickets/ship_ticket.dart';
import 'package:safra_app/tickets/train_ticket.dart';

import '../appColors.dart';

class Payment extends StatelessWidget {
  final String flag;

  const Payment({
    super.key,
    required this.flag,
  });
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments as Map<String, String>;
    return MaterialPageRoute(
      builder: (_) => Payment(
        flag: args['flag'] ?? '',
      ),
      settings: settings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      appBar: AppBar(
        title: Text('الدفع'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العنوان
            Text(
              'اختر طريقة الدفع',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // خيارات الدفع (مثال)
            Container(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PaymentCard(),
                  PaymentCard(),
                  PaymentCard(),
                  PaymentCard(),
                ],
              ),
            ),

            SizedBox(height: 24),

            // نموذج (مثال)
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Appcolors.primary, // لون الإطار عند التركيز
                  width: 2.0,
                )),
                labelText: 'الاسم على البطاقة',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Appcolors.primary, // لون الإطار عند التركيز
                  width: 2.0,
                )),
                labelText: 'رقم البطاقة',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Appcolors.primary, // لون الإطار عند التركيز
                        width: 2.0,
                      )),
                      labelText: 'MM/YY',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Appcolors.primary, // لون الإطار عند التركيز
                        width: 2.0,
                      )),
                      labelText: 'CVV',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 80), // حتى لا يختفي خلف الزر
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 70,
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.indigo],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.4),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              if (flag == "flight") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FlightTicket()));
              } else if (flag == "ship"){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShipTicket()));
              }
              else if (flag == "train"){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrainTicket()));
              }else if (flag == "bus"){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BusTicket()));
              }else if (flag == "hafla"){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HaflaTicket()));
              }else if (flag == "cab"){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CabTicket()));
              }else if (flag == "hotel"){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelTicket()));
              }else if (flag == "appart"){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AppartmentTicket()));
              }
            },
            child: Center(
              child: Text(
                'دفع 160\$',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PaymentCard() {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(20),
      width: 190,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Image.asset(
            'assets/card.png',
            height: 60,
          ),
          Text(
            'بطاقة إئتمان',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          )
        ],
      ),
    );
  }
}
