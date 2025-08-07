import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HotelScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);

  Widget buildCard() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/search/hotel.png', // استبدل الرابط بصورتك
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Image.asset(
                      'assets/search/hotel.png', // استبدل الرابط بصورتك
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '★ 4.7',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.white],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '\$100.00',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                ),
                SizedBox(height: 4),
                Text(
                  'فردين',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              'فندق برج الفاتح',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
        child: Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // الصورة الرئيسية
            Stack(
              children: [
                Image.asset(
                  'assets/search/hotel.png', // استبدل الرابط بصورتك
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        ' فندق برج الفاتح',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'تحقق في 23 إبريل • الدفع 27 إبريل • 2 ضيوف',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // القائمة
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => buildCard(),
              ),
            ),
          ],
        ),
      ),
      // شريط السفلي
      bottomNavigationBar: BottomAppBar(
        elevation: 12,
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blueAccent],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.map, color: Colors.white),
                  label: const Text(
                    'عرض الخريطة',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const VerticalDivider(color: Colors.white),
              Expanded(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                  label: const Text(
                    'ترشيحات',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}
