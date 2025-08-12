import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final String title; // العنوان فوق الدروب داون
  final String hint; // النص الذي يظهر داخل الدروب داون
  final List<T> items;
  final T? initialValue;
  final ValueChanged<T> onChanged;
  final String Function(T) itemLabel;
  final IconData icon; // الأيقونة التي تعبر عن القائمة

  const CustomDropdown({
    Key? key,
    required this.title,
    required this.hint,
    required this.items,
    this.initialValue,
    required this.onChanged,
    required this.itemLabel,
    required this.icon, // تمرير الأيقونة
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        //   child: Text(
        //     widget.title,
        //     style: const TextStyle(
        //       fontSize: 15,
        //       fontWeight: FontWeight.w400,
        //       color: Colors.black87,
        //     ),
        //   ),
        // ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 1,
              )
            ],
          ),
          child: Row(
            children: [
              Icon(widget.icon, color: Colors.blueAccent, size: 24), // أيقونة ثابتة
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    isExpanded: true,
                    value: selectedValue,
                    hint: Text(
                      widget.hint,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    icon: const Icon(Icons.arrow_drop_down_rounded, size: 28),
                    items: widget.items.map((T value) {
                      return DropdownMenuItem<T>(
                        value: value,
                        child: Text(
                          widget.itemLabel(value),
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                      if (value != null) widget.onChanged(value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
