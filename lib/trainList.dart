import 'package:flutter/material.dart';

class TripsListScreen extends StatelessWidget {
  final List<Trip> trips = List.generate(5, (index) => Trip());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // يدعم العربية
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'بورسودان إلى عطبرة',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                '23 ناتج | 1 المسافر',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/search/train.png'), // خلفية رأسية
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: trips.length,
          itemBuilder: (context, index) {
            return TripCard();
          },
        ),
      ),
    );
  }
}

class Trip {
  // البيانات ثابتة مؤقتًا
}

class TripCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          // العرض العلوي
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[300]!, Colors.white],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.centerRight,
            child: Text(
              'عرض الطريق',
              style: TextStyle(color: Colors.white),
            ),
          ),

          // التفاصيل
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                // بيانات الوقت والاتجاه
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jun, 12:35 am 23'),
                      SizedBox(height: 4),
                      Text('بورسودان'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 8, color: Colors.blue),
                        Container(width: 40, height: 1, color: Colors.blue),
                        Icon(Icons.circle, size: 8, color: Colors.blue),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text('Stop 1\nhr 32 mins 12',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Jun, 12:35 am 23'),
                      SizedBox(height: 4),
                      Text('عطبرة'),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/search/train.png',
                    width: 40,
                    height: 40,
                  ),
                )
              ],
            ),
          ),

          Divider(),

          // الأسعار
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PriceOption(label: 'الدرجة الأولى', price: '\$35.00', seats: '50'),
                PriceOption(label: 'الدرجة الثانية', price: '\$23.00', seats: '78'),
                PriceOption(label: 'الدرجة الثالثة', price: '\$18.00', seats: '120'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PriceOption extends StatelessWidget {
  final String label;
  final String price;
  final String seats;

  const PriceOption({
    required this.label,
    required this.price,
    required this.seats,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.grey[600])),
        SizedBox(height: 4),
        Text('$price - $seats',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}
