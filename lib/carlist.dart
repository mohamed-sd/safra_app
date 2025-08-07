import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'حجوزات السيارات',
      debugShowCheckedModeBanner: false,
      home: const CarListScreen(),
      theme: ThemeData(fontFamily: 'Cairo'), // تأكد من إضافة خط عربي إن رغبت
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
    );
  }
}

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضبط اللغة العربية
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/search/cab.png"), // غيّر الخلفية حسب الحاجة
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "الخرطوم إلى مدني",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "23 أغسطس  -  11:30 صباحًا  -  Hatchback",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const CarCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.lightBlueAccent],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "\$120.00\nخدمة تاكسي أوبرا",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  children: const [
                    Text("سيارة Hatchback", style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 8),
                    Image(
                      image: AssetImage("assets/search/cab.png"), // أضف صورة السيارة في assets
                      width: 90,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                FeatureIcon(icon: Icons.star, label: "4.7", bgColor: Colors.green),
                FeatureIcon(icon: Icons.ac_unit, label: "AC", bgColor: Colors.green),
                FeatureIcon(icon: Icons.work, label: "شنط 2", bgColor: Colors.green),
                FeatureIcon(icon: Icons.wifi, label: "WiFi", bgColor: Colors.green),
                FeatureIcon(icon: Icons.event_seat, label: "4 مقاعد", bgColor: Colors.green),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FeatureIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bgColor;

  const FeatureIcon({
    super.key,
    required this.icon,
    this.label = '',
    this.bgColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (label.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Icon(icon, size: 16, color: Colors.white),
                const SizedBox(width: 4),
                Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          )
        else
          Icon(icon, size: 20),
      ],
    );
  }
}
