import 'package:flutter/material.dart';
import 'package:safra_app/widgets/custom_back_button.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double price = 500;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لجعل النص والاتجاه من اليمين لليسار
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
              padding: EdgeInsets.all(10),
              child: CustomBackButton()),
          title: const Text(
            "فرز ومرشحات",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("ترتيب حسب", style: TextStyle(color: Colors.black)),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildButton("وقت الوصول"),
                  buildButton("وقت المغادرة"),
                  buildButton("السعر"),
                ],
              ),
              const SizedBox(height: 20),
              const Text("نطاق السعر", style: TextStyle(color: Colors.black)),
              Slider(
                value: price,
                min: 100,
                max: 1000,
                activeColor: Colors.blue,
                inactiveColor: Colors.blue.withOpacity(0.3),
                onChanged: (value) {
                  setState(() {
                    price = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${price.toInt()} ج.م", style: const TextStyle(color: Colors.black)),
                  const Text("100 ج.م", style: TextStyle(color: Colors.black)),
                ],
              ),
              const SizedBox(height: 20),
              const Text("وقت المغادرة", style: TextStyle(color: Colors.black)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                children: [
                  buildTimeChip("منتصف الليل", "00:00 - 04:59"),
                  buildTimeChip("الصباح", "05:00 - 11:59"),
                  buildTimeChip("الظهيرة", "12:00 - 17:59"),
                  buildTimeChip("المساء", "18:00 - 23:59"),
                ],
              ),
              const SizedBox(height: 20),
              const Text("وقت الوصول", style: TextStyle(color: Colors.black)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                children: [
                  buildTimeChip("منتصف الليل", "00:00 - 04:59"),
                  buildTimeChip("الصباح", "05:00 - 11:59"),
                  buildTimeChip("الظهيرة", "12:00 - 17:59"),
                  buildTimeChip("المساء", "18:00 - 23:59"),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "تطبيق الآن",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String text) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.withOpacity(0.1),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          onPressed: () {},
          child: Text(text),
        ),
      ),
    );
  }

  Widget buildTimeChip(String title, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.black)),
          Text(time, style: const TextStyle(color: Colors.black, fontSize: 12)),
        ],
      ),
    );
  }
}
