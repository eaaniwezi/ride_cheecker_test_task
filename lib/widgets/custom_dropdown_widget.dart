import 'package:flutter/material.dart';

class DropDownManager {
  late List<String> cities;
  String? selectedCity1;
  String? selectedCity2;

  DropDownManager({required this.cities});

  List<String> getCitiesForDropDown1() {
    if (selectedCity2 != null && cities.contains(selectedCity2!)) {
      return List<String>.from(cities)..remove(selectedCity2);
    }
    return cities;
  }

  List<String> getCitiesForDropDown2() {
    if (selectedCity1 != null && cities.contains(selectedCity1!)) {
      return List<String>.from(cities)..remove(selectedCity1);
    }
    return cities;
  }
}

class CustomDropDownWidget extends StatelessWidget {
  final String labelText;
  final List<String> cities;
  final Function(String?) onChanged;
  final List<String> availableCities;

  const CustomDropDownWidget({
    Key? key,
    required this.labelText,
    required this.cities,
    required this.onChanged,
    required this.availableCities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        hint: Text(labelText),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 3,
              color: Colors.black,
            ),
          ),
        ),
        items: availableCities.map((city) {
          return DropdownMenuItem<String>(
            value: city,
            child: Text(
              city,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}