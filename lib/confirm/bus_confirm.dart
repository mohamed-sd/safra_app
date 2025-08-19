import 'package:flutter/material.dart';
import 'package:safra_app/appColors.dart';
import 'package:safra_app/pay/payment.dart';
import 'package:safra_app/tickets/bus_ticket.dart';
import 'package:safra_app/tickets/train_ticket.dart';
import '../widgets/custom_back_button.dart';

class BusConfirm extends StatefulWidget {
  @override
  State<BusConfirm> createState() => _FlightConfirmState();
}

class _FlightConfirmState extends State<BusConfirm>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _slideAnimation =
        Tween<Offset>(begin: Offset(0, 0.1), end: Offset.zero).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildInfoItem(String title, String value, {IconData? icon, Color? iconColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        Row(
          children: [
            if (icon != null) Icon(icon, color: iconColor ?? Colors.blue, size: 20),
            if (icon != null) SizedBox(width: 5),
            Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Appcolors.background,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    // العنوان
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBackButton(),
                        Text("تأكيد الحجز",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 24),
                      ],
                    ),
                    SizedBox(height: 20),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/search/bus.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ' ابو عامر ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                ' باص تاتا مكيف ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    // المدن
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade50, Colors.blue.shade100],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3))
                        ],
                      ),
                      child: Column(
                        children: [
                          buildInfoItem(
                            "المغادرة من",
                            "KRT - الخرطوم، السودان",
                            icon: Icons.flight_takeoff,
                          ),
                          SizedBox(height: 10),
                          buildInfoItem(
                            "الوصول إلى",
                            "ATB - عطبرة، السودان",
                            icon: Icons.flight_land,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // التواريخ
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3))
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildInfoItem("مغادرة", "20 أغسطس، 6:30 ص"),
                          buildInfoItem("وصول", "20 أغسطس، 8:15 ص"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // تفاصيل المقعد
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3))
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // buildInfoItem("الدرجة", "إقتصادية"),
                          buildInfoItem("عدد المقاعد", "50"),
                          buildInfoItem("رقم المقعد", "23"),
                        ],
                      ),
                    ),

                    Spacer(),

                    // الدفع
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("معلومات الدفع",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("رسوم الأجرة"),
                              Text("50.000 SDG"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("رسوم الرحلة"),
                              Text("10.000 SDG"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("رسوم الإلغاء"),
                              Text("05.000 SDG"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    // زر الدفع
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>Payment(flag: 'bus'))
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.indigo],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.4),
                                blurRadius: 8,
                                offset: Offset(0, 4))
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "مواصلة الدفع 60.000 SDG",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
