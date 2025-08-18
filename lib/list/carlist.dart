import 'package:flutter/material.dart';
import 'package:safra_app/detailes/bus_details.dart';
import 'package:safra_app/filter_screen.dart';
import 'package:safra_app/widgets/custom_back_button.dart';
import '../appColors.dart';
import '../detailes/cab_details.dart';

class Carlist extends StatelessWidget {
  const Carlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> busData = List.generate(
      8,
      (index) => {
        "price": "30,000 SDG",
        "from": "عطبرة",
        "to": "الخرطوم",
        "timeFrom": "am 05:35",
        "timeTo": "am 12:35",
        "duration": "3 ساعات و 32 دقيقة",
        "seats": "المقاعد المتاحة 24",
        "type": " سيارة دبدوب ",
        "company": " اكسنت دبدوب ",
        "image": "assets/search/cab.png"
      },
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Appcolors.background,
        body: Column(
          children: [
            // الهيدر مع التدرج
            Stack(
              children: [
                // صورة الخلفية
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

                // طبقة التدرج
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Appcolors.trans,
                  ),
                ),

                // زر الرجوع
                Positioned(
                  right: 10,
                  top: 40,
                  child: CustomBackButton(),
                ),

                // العنوان
                Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "الخرطوم الي مدني",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " 23-June - ممتلئة - 2 شنط ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // قائمة الباصات
            Expanded(
              child: ListView.builder(
                itemCount: busData.length,
                itemBuilder: (context, index) {
                  final bus = busData[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CabDetails()));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                          colors: [
                            Appcolors.background,
                            Colors.white,
                            Colors.blue
                          ], // الأبيض → الأزرق
                          begin: Alignment.bottomRight, // بداية التدرج من فوق
                          end: Alignment.bottomLeft, // نهاية التدرج تحت
                        ),
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
                        children: [
                          // الصف الأول: السعر + نوع الحافلة + الشركة
                          Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        bus["image"]!,
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            bus["company"]!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            bus["type"]!,
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        bus["price"]!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Terhal Taxi Service',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.all(5),
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
                                )
                              ],
                            ),
                          ),
                          // الصف الثاني: وقت المغادرة والوصول + المدة + المقاعد + صورة

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // الزر السفلي
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => FilterScreen()));
              },
              child: Container(
                height: 70,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    " فرز ومرشحات ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
