import 'dart:async';
import 'package:flutter/material.dart';
import 'package:safra_app/appColors.dart';
import 'package:safra_app/list/hafla_list.dart';

import '../widgets/custom_action_button.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_date_picker.dart';
import '../widgets/custom_drop_down.dart';

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
                      padding: EdgeInsets.only(right: 16, left: 16 , top: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomBackButton(),
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
                            CustomDatePicker(
                              label: "حدد التاريخ ",
                              initialDate: DateTime.now(),
                              onDateSelected: (date) {
                                print("تم اختيار التاريخ: $date");
                              },
                            ),
                            CustomDropdown<String>(
                              title: "الدرجة",
                              hint: " نوع الحافلة ",
                              icon: Icons.bus_alert_rounded,
                              items: ['هايس', 'كريز', '25 راكب' ,'50 راكب'],
                              itemLabel: (value) => value,
                              onChanged: (value) {
                                print("الدرجة: $value");
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomActionButton(
                    text: " البحث عن حافلة ",
                    icon: Icons.directions_bus_rounded,
                    backgroundColor: Appcolors.primary,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HaflaList()),
                      );
                    },
                  ),

              )
            ],
          ),
        ),
      ),
    );
  }

}
