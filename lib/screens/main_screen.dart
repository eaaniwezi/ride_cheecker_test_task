import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ride_checker_test_task/states/ride_bloc.dart';
import 'package:ride_checker_test_task/widgets/query_widget.dart';
import 'package:ride_checker_test_task/widgets/ride_card_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String? selectedCity1;
  String? selectedCity2;
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: QueryWidget(
        onCity1Selected: (city) {
          setState(() {
            selectedCity1 = city;
          });
        },
        onCity2Selected: (city) {
          setState(() {
            selectedCity2 = city;
          });
        },
        onDateSelected: (date) {
          setState(() {
            selectedDate = date;
          });
        },
      ),
      body: Column(
        children: [
          _textWidget("ПОИСК ТРАНСПОРТА", true),
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              header: CustomHeader(
                builder: (context, staus) {
                  return SpinKitFadingCircle(
                      color: Theme.of(context).iconTheme.color, size: 40);
                },
                // height: 2,
              ),
              onRefresh: () => _onRefresh(context),
              onLoading: _onLoading,
              child: SingleChildScrollView(
                child: BlocConsumer<RideBloc, RideState>(
                  listener: (context, state) {
                    print(state);
                  },
                  builder: (context, state) {
                    if (state is FetchingRides) {
                      return SpinKitFadingCircle(
                          color: Theme.of(context).iconTheme.color, size: 40);
                    }
                    if (state is ErrorFetchingRides) {
                      return _textWidget("ошибка!!!", false);
                    }

                    if (state is SuccessFetchingRides) {
                      return state.foundRides.isEmpty
                          ? _textWidget("ТРАНСПОРТ НЕ НАЙДЕН", false)
                          : Column(
                              children: state.foundRides
                                  .asMap()
                                  .entries
                                  .map((rideModel) {
                                return RideCardWidget(
                                    rideModel: rideModel.value);
                              }).toList(),
                            );
                    }
                    return Text("");
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _textWidget(String text, bool isHeader) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            top: isHeader ? 20 : MediaQuery.of(context).size.height * 0.3),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _onRefresh(BuildContext context) async {
    if (selectedCity1 == null ||
        selectedCity2 == null ||
        selectedDate == null) {  _refreshController.refreshCompleted();
      Fluttertoast.showToast(
        msg: 'Все поля должны быть заполнены',
        gravity: ToastGravity.TOP,
        textColor: Colors.red,
      );
    } else {
      setState(() {});

      BlocProvider.of<RideBloc>(context).add(GetRidesEvent(
          fromWhere: selectedCity1.toString(),
          toWhere: selectedCity2.toString(),
          date: selectedDate.toString()));
      _refreshController.refreshCompleted();
    }
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
