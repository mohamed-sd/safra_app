import 'dart:async';
import 'package:flutter/material.dart';
import 'package:safra_app/appColors.dart';
import 'package:safra_app/list/flight_list.dart';

import '../list/shipList.dart';
import '../widgets/custom_action_button.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_date_picker.dart';
import '../widgets/custom_drop_down.dart';

class ShipSearch extends StatefulWidget {
  @override
  _ShipSearchState createState() => _ShipSearchState();
}

class _ShipSearchState extends State<ShipSearch> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String? fromCity;
  String? toCity;
  DateTime? departureDate;
  DateTime? returnDate;
  int passengers = 1;
  int children = 0;
  int luggage = 0;
  String travelClass = 'اقتصادية';
  late TabController _tabController;

  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> imagePaths = [
    "assets/search/flight.png",
    "assets/search/flight.png",
    "assets/search/flight.png",
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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
          backgroundColor: Appcolors.background,
          body: Column(
            children: [
              Container(
                height: 250,
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
                      padding: EdgeInsets.only(right: 16, left: 16 , top: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomBackButton(),
                          Text(
                            'البحث عن الرحلات البحرية ',
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
                                hintText: 'ميناء بورسودان',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'من',
                                prefixIcon: Icon(
                                  Icons.flight_takeoff,
                                  color: Colors.blue,
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
                                hintText: ' جدة ',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'الي',
                                prefixIcon: Icon(
                                  Icons.flight_land,
                                  color: Colors.blue,
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

              // ===== Tabs =====
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: const Offset(0, 3), // اتجاه الظل للأسفل قليلًا
                      ),
                    ]
                ),
                child: TabBar(
                  physics: NeverScrollableScrollPhysics(),
                  labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black87,
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'ذهاب وإياب'),
                    Tab(text: 'ذهاب فقط'),
                    Tab(text: 'مدينة متعددة'),
                  ],
                ),
              ),

              // ===== TabBarView =====
              Expanded(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  child: TabBarView(
                    key: ValueKey<int>(_tabController.index),
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(), // منع السحب
                    children: [
                      _buildRoundTripForm(),
                      _buildOneWayForm(),
                      _buildMultiCityForm(),
                    ],
                  ),
                ),
              ),

              // ===== زر البحث =====
              SizedBox(
                width: double.infinity,
                child: CustomActionButton(
                  text: " البحث عن باخرة ",
                  icon: Icons.flight,
                  backgroundColor: Appcolors.primary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShipList()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== Widgets مساعدة =====

  Widget _buildTextField(String label, String hint, IconData icon, Function(String) onChanged) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            prefixIcon: Icon(icon, color: Appcolors.primary),
            border: InputBorder.none,
          ),
          onChanged: onChanged,
          validator: (value) => value == null || value.isEmpty ? 'أدخل $label' : null,
        ),
      ),
    );
  }

  Widget _buildRoundTripForm() {
    return _buildFormContainer([
      CustomDatePicker(
        label: "حدد تاريخ المغادرة",
        initialDate: DateTime.now(),
        onDateSelected: (date) {
          print("تم اختيار التاريخ: $date");
        },
      ),
      // _buildDatePicker('تاريخ المغادرة', true),
      CustomDatePicker(
        label: "حدد تاريخ العودة",
        initialDate: DateTime.now(),
        onDateSelected: (date) {
          print("تم اختيار التاريخ: $date");
        },
      ),
      _buildPassengerFields(),
    ]);
  }

  Widget _buildOneWayForm() {
    return _buildFormContainer([
      _buildDatePicker('تاريخ المغادرة', true),
      _buildPassengerFields(),
    ]);
  }

  Widget _buildMultiCityForm() {
    return _buildFormContainer([
      _buildCityRow('الرحلة الأولى'),
      CustomDatePicker(
        label: "حدد تاريخ المغادرة",
        initialDate: DateTime.now(),
        onDateSelected: (date) {
          print("تم اختيار التاريخ: $date");
        },
      ),
      Divider(),
      _buildCityRow('الرحلة الثانية'),
      CustomDatePicker(
        label: "حدد تاريخ الرجوع",
        initialDate: DateTime.now(),
        onDateSelected: (date) {
          print("تم اختيار التاريخ: $date");
        },
      ),
      _buildPassengerFields(),
    ]);
  }

  Widget _buildFormContainer(List<Widget> children) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(0),
      child:
      Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: children
              .map((w) => Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: w))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCityRow(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(child: _buildTextField('من', '', Icons.flight_takeoff, (_) {})),
            SizedBox(width: 10),
            Expanded(child: _buildTextField('إلى', '', Icons.flight_land, (_) {})),
          ],
        ),
      ],
    );
  }

  Widget _buildDatePicker(String label, bool isDeparture) {
    DateTime? selectedDate = isDeparture ? departureDate : returnDate;
    return ListTile(
      tileColor: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: Icon(Icons.calendar_today, color: Appcolors.primary),
      title: Text(
        selectedDate == null
            ? label
            : '$label: ${selectedDate.toLocal()}'.split(' ')[0],
      ),
      onTap: () => _selectDate(context, isDeparture),
    );
  }

  Widget _buildPassengerFields() {
    return  Column(
      children: [

        CustomDropdown<int>(
          title: "عدد الأطفال",
          hint: "اختر عدد الأطفال",
          icon: Icons.child_care,
          items: List.generate(6, (index) => index), // من 0 إلى 5
          itemLabel: (value) => "$value",
          onChanged: (value) {
            print("عدد الأطفال: $value");
          },
        ),
        // القائمة الثانية: عدد البالغين
        CustomDropdown<int>(
          title: "عدد البالغين",
          hint: "اختر عدد البالغين",
          icon: Icons.person,
          items: List.generate(10, (index) => index + 1), // من 1 إلى 10
          itemLabel: (value) => "$value",
          onChanged: (value) {
            print("عدد البالغين: $value");
          },
        ),
        CustomDropdown<int>(
          title: "عدد الأمتعة",
          hint: "اختر عدد الأمتعة",
          icon: Icons.luggage,
          items: List.generate(6, (index) => index), // من 0 إلى 5
          itemLabel: (value) => "$value",
          onChanged: (value) {
            print("عدد الأمتعة: $value");
          },
        ),
        CustomDropdown<String>(
          title: "الدرجة",
          hint: "اختر الدرجة",
          icon: Icons.airline_seat_recline_normal,
          items: ["اقتصادية", "درجة رجال الأعمال", "الأولى"],
          itemLabel: (value) => value,
          onChanged: (value) {
            print("الدرجة: $value");
          },
        ),


      ],
    );
  }

  Widget _buildCounter(String label, int value, Function(int) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: DropdownButtonFormField<int>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
