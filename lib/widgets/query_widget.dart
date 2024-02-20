import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ride_checker_test_task/states/ride_bloc.dart';
import 'package:ride_checker_test_task/widgets/button_widget.dart';
import 'package:ride_checker_test_task/widgets/custom_dropdown_widget.dart';

class QueryWidget extends StatefulWidget {
  final Function(String?) onCity1Selected;
  final Function(String?) onCity2Selected;
  final Function(String?) onDateSelected;

  const QueryWidget({
    Key? key,
    required this.onCity1Selected,
    required this.onCity2Selected,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<QueryWidget> createState() => _QueryWidgetState();
}
class _QueryWidgetState extends State<QueryWidget> {
  late DropDownManager dropDownManager;
  String? selectedCity1;
  String? selectedCity2;
  String? selectedDate;

  @override
  void initState() {
    super.initState();
    dropDownManager = DropDownManager(
      cities: ["Казань", "Москва", "Уфа"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.21,
      color: Colors.grey[300],
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomDropDownWidget(
                    labelText: 'откуда',
                    cities: dropDownManager.cities,
                    availableCities: dropDownManager.getCitiesForDropDown1(),
                    onChanged: (selectedCity) {
                      setState(() {
                        selectedCity1 = selectedCity;
                      });
                    },
                  ),
                  IconButton(
                    onPressed: () async {
                      final eventDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 5),
                      );
                      if (eventDate == null) return;
                      setState(() {
                        selectedDate =
                            DateFormat('yyyy-MM-dd').format(eventDate);
                      });
                    },
                    icon: Icon(Icons.date_range_outlined),
                    color: Colors.blue,
                  ),
                  CustomDropDownWidget(
                    labelText: 'куда',
                    cities: dropDownManager.cities,
                    availableCities: dropDownManager.getCitiesForDropDown2(),
                    onChanged: (selectedCity) {
                      setState(() {
                        selectedCity2 = selectedCity;
                      });
                    },
                  ),
                ],
              ),
              //!
              ButtonWidget(
                title: "Поиск",
                onTap: () {
                  if (selectedCity1 == null ||
                      selectedCity2 == null ||
                      selectedDate == null) {
                    Fluttertoast.showToast(
                      msg: 'Все поля должны быть заполнены',
                      gravity: ToastGravity.TOP,
                      textColor: Colors.red,
                    );
                  } else {
                    BlocProvider.of<RideBloc>(context).add(GetRidesEvent(
                        fromWhere: selectedCity1.toString(),
                        toWhere: selectedCity2.toString(),
                        date: selectedDate.toString()));
                  }
                },
              )
            ],
          )),
    );
  }
}
