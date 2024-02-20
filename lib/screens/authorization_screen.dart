import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_checker_test_task/screens/main_screen.dart';
import 'package:ride_checker_test_task/states/ride_bloc.dart';
import 'package:ride_checker_test_task/widgets/button_widget.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(
              title: "Get Started",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => MainScreen())));
              }),
          ButtonWidget(
              title: "Privacy",
              onTap: () {
                BlocProvider.of<RideBloc>(context).rideRepository.openURL();
              }),
        ],
      ),
    );
  }
}
