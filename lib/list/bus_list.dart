import 'package:flutter/material.dart';
import 'package:safra_app/detailes/bus_details.dart';
import 'package:safra_app/filter_screen.dart';
import 'package:safra_app/widgets/custom_back_button.dart';
import '../appColors.dart';

class BusList extends StatelessWidget {
  const BusList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> busData = List.generate(
      8,
      (index) => {
        "price": "50,000 SDG",
        "from": "عطبرة",
        "to": "الخرطوم",
        "timeFrom": "am 05:35",
        "timeTo": "am 12:35",
        "duration": "3 ساعات و 32 دقيقة",
        "seats": "المقاعد المتاحة 24",
        "type": "تاتا سفرى مكيف 50 راكب",
        "company": " ابو عامر ",
        "image": "assets/search/bus.png"
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
                      image: AssetImage("assets/search/bus.png"),
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
                          "الخرطوم الي عطبرة",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          " 23-June - ابو عامر - مكييف ",
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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BusDetails()));
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
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
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Appcolors.background,
                                  Colors.white,
                                  Colors.blue
                                ], // الأبيض → الأزرق
                                begin: Alignment.bottomRight, // بداية التدرج من فوق
                                end: Alignment.bottomLeft, // نهاية التدرج تحت
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  bus["company"]!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    bus["type"]!,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade400,
                                        Colors.blue.shade200,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    bus["price"]!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),

                          // الصف الثاني: وقت المغادرة والوصول + المدة + المقاعد + صورة
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bus["timeTo"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      bus["to"]!,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      bus["seats"]!,
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 12),
                                    ),
                                    Text(
                                      bus["duration"]!,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      bus["timeFrom"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      bus["from"]!,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                Image.asset(
                                  bus["image"]!,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // الزر السفلي
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (contex)=>FilterScreen()));
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
