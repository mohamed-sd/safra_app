import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_back_button.dart';

class TrainList extends StatefulWidget {
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
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // هيدر الصفحة مع صورة وخلفية متدرجة
          Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/train_header.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.5), Colors.transparent],
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
                left: 20,
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

          // Tabs للتواريخ
          Container(
            height: 90,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (context, index) {
                bool isSelected = index == selectedDay;
                return GestureDetector(
                  onTap: () => setState(() => selectedDay = index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    padding: EdgeInsets.all(10),
                    width: 85,
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? LinearGradient(
                          colors: [Colors.blue, Colors.blueAccent])
                          : null,
                      color: isSelected ? null : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 3))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateFormat.E('ar').format(days[index]),
                            style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black)),
                        SizedBox(height: 4),
                        Text(DateFormat.Md('ar').format(days[index]),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black)),
                        SizedBox(height: 4),
                        Text("5000 SDG",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.green)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // بطاقة النتيجة بتصميم احترافي
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return FadeInUp(
                  duration: Duration(milliseconds: 400 + (index * 100)),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 4))
                      ],
                    ),
                    child: Column(
                      children: [
                        // الهيدر
                        Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15)),
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.blue.shade300],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.train,
                                      color: Colors.black87, size: 20),
                                  SizedBox(width: 8),
                                  Text("قطار النيل الأزرق",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Text("5000 SDG",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        // الجسم
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("06:30",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text("الخرطوم",
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.more_horiz, color: Colors.grey),
                                  Text("مباشر",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  Text("3 س",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("09:30",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text("مدني",
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
