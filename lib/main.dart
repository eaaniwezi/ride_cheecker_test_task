// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_checker_test_task/states/ride_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ride_checker_test_task/screens/authorization_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.init();

  runApp(MultiProvider(
    providers: [
      BlocProvider(create: (_) => di.sl<RideBloc>()),
    ],
    child: MyApp(),
  ));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ride Checker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: SplashScreen()
        home: AuthorizationScreen());
  }
}
