import 'dart:async';
import 'package:flutter/material.dart';
import 'package:safra_app/appColors.dart';

class HotelSearch extends StatefulWidget {
  @override
  _HotelSearchState createState() => _HotelSearchState();
}

class _HotelSearchState extends State<HotelSearch> {
  final _formKey = GlobalKey<FormState>();
  String? destination;
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int adults = 1;
  int children = 0;
  int luggage = 0;
  int rooms = 1;

  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> imagePaths = [
    "assets/search/hotel.png",
    "assets/search/hotel.png",
    "assets/search/hotel.png",
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (_pageController.hasClients) {
          int nextPage = (_currentPage + 1) % imagePaths.length;
          _pageController.animateToPage(
            nextPage,
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
          setState(() {
            _currentPage = nextPage;
          });
        }
      });
    });
  }

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          checkInDate = picked;
        } else {
          checkOutDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: imagePaths.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imagePaths[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),
                    Container(
                      color: Color(0x7B131313),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back, color: Colors.white),
                          ),
                          Text(
                            'البحث عن فندق',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Divider(color: Color(0xFF29FFF8)),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'الوجهة',
                              hintStyle: TextStyle(color: Colors.white),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'إلى أين تذهب؟',
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                            onChanged: (value) => destination = value,
                            validator: (value) =>
                            value == null || value.isEmpty ? 'أدخل الوجهة' : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Appcolors.Appbackground),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildDatePicker('تاريخ الوصول', true),
                            _buildDatePicker('تاريخ المغادرة', false),
                            _buildDropdown('عدد البالغين', adults, (val) {
                              setState(() => adults = val);
                            }),
                            _buildDropdown('عدد الأطفال', children, (val) {
                              setState(() => children = val);
                            }),
                            _buildDropdown('عدد الأمتعة', luggage, (val) {
                              setState(() => luggage = val);
                            }),
                            _buildDropdown('عدد الغرف', rooms, (val) {
                              setState(() => rooms = val);
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('جارٍ تنفيذ الحجز...')),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(color: Appcolors.primary),
                    child: Center(
                      child: Text(
                        'احجز الآن',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(String label, bool isCheckIn) {
    DateTime? selectedDate = isCheckIn ? checkInDate : checkOutDate;
    return ListTile(
      leading: Icon(Icons.calendar_today),
      title: Text(
        selectedDate == null
            ? label
            : '$label: ${selectedDate.toLocal()}'.split(' ')[0],
      ),
      onTap: () => _selectDate(context, isCheckIn),
    );
  }

  Widget _buildDropdown(String label, int value, Function(int) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<int>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: List.generate(6, (index) => index)
            .map((number) => DropdownMenuItem(
          value: number,
          child: Text(number.toString()),
        ))
            .toList(),
        onChanged: (val) {
          if (val != null) onChanged(val);
        },
      ),
    );
  }
}