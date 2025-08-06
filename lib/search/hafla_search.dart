import 'dart:async';
import 'package:flutter/material.dart';
import 'package:safra_app/appColors.dart';

class HaflaSearch extends StatefulWidget {
  @override
  _FlightSearchState createState() => _FlightSearchState();
}

class _FlightSearchState extends State<HaflaSearch> {
  final _formKey = GlobalKey<FormState>();
  String? fromCity;
  String? toCity;
  DateTime? departureDate;
  DateTime? returnDate;
  int passengers = 1;
  int children = 0;
  int luggage = 0;
  String travelClass = '50 راكب';
  int rooms = 1;

  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> imagePaths = [
    "assets/search/bus.png",
    "assets/search/bus.png",
    "assets/search/bus.png",
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

  Future<void> _selectDate(BuildContext context, bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isDeparture) {
          departureDate = picked;
        } else {
          returnDate = picked;
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
                            'البحث عن الحافلات ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Divider(color: Color(0xFF29FFF8)),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'الخرطوم',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'صعود من',
                                prefixIcon: Icon(
                                  Icons.bus_alert_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (value) => fromCity = value,
                              validator: (value) =>
                              value == null || value.isEmpty
                                  ? 'أدخل مدينة الانطلاق'
                                  : null,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: ' امدرمان ',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'نزول الي',
                                prefixIcon: Icon(
                                  Icons.bus_alert_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (value) => toCity = value,
                              validator: (value) =>
                              value == null || value.isEmpty
                                  ? 'أدخل الوجهة'
                                  : null,
                            ),
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
                            _buildDatePicker('حدد التاريخ ', true),
                            SizedBox(height: 10,),
                            DropdownButtonFormField<String>(
                              value: travelClass,
                              decoration: InputDecoration(
                                labelText: 'نوع الحافلة',
                                prefixIcon: Icon(Icons.event_seat),
                                border: OutlineInputBorder(),
                              ),
                              items: ['هايس', 'كريز', '25 راكب' ,'50 راكب']
                                  .map((classType) => DropdownMenuItem(
                                value: classType,
                                child: Text(classType),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  travelClass = value!;
                                });
                              },
                            )
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
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(color: Appcolors.primary),
                      child: Center(
                          child: Text(
                            ' بحث ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundTripForm() {
    return Column(
      children: [
        _buildDatePicker('تاريخ المغادرة', true),
        _buildDatePicker('تاريخ العودة', false),
        _buildPassengerFields(),
      ],
    );
  }

  Widget _buildOneWayForm() {
    return Column(
      children: [
        _buildDatePicker('تاريخ المغادرة', true),
        _buildPassengerFields(),
      ],
    );
  }

  Widget _buildMultiCityForm() {
    return Column(
      children: [
        _buildCityRow('الرحلة الأولى'),
        _buildDatePicker('تاريخ المغادرة', true),
        Divider(),
        _buildCityRow('الرحلة الثانية'),
        _buildDatePicker('تاريخ الرجوع', false),
        _buildPassengerFields(),
      ],
    );
  }

  Widget _buildCityRow(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'من'),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'إلى'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDatePicker(String label, bool isDeparture) {
    DateTime? selectedDate = isDeparture ? departureDate : returnDate;
    return ListTile(
      leading: Icon(Icons.calendar_today),
      title: Text(
        selectedDate == null
            ? label
            : '$label: ${selectedDate.toLocal()}'.split(' ')[0],
      ),
      onTap: () => _selectDate(context, isDeparture),
    );
  }

  Widget _buildPassengerFields() {
    return Column(
      children: [
        _buildCounter('عدد البالغين', passengers, (val) {
          setState(() => passengers = val);
        }),
        _buildCounter('عدد الأطفال', children, (val) {
          setState(() => children = val);
        }),
        _buildCounter('عدد الأمتعة', luggage, (val) {
          setState(() => luggage = val);
        }),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: travelClass,
          decoration: InputDecoration(
            labelText: 'اختر المقطورة',
            prefixIcon: Icon(Icons.event_seat),
            border: OutlineInputBorder(),
          ),
          items: ['اقتصادية', 'رجال أعمال', 'الدرجة الأولى']
              .map((classType) => DropdownMenuItem(
            value: classType,
            child: Text(classType),
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              travelClass = value!;
            });
          },
        )
      ],
    );
  }

  Widget _buildCounter(String label, int value, Function(int) onChanged) {
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
