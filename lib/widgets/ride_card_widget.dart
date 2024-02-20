import 'package:flutter/material.dart';

import 'package:ride_checker_test_task/model/ride_model.dart';

class RideCardWidget extends StatelessWidget {
  final RideModel rideModel;
  const RideCardWidget({
    Key? key,
    required this.rideModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center, children: [
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,children: [Text("откуда:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),), Text(rideModel.departure!.name.toString(),style: TextStyle(color: Colors.red),)],),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,children: [Text("куда:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),), Text(rideModel.destination!.name.toString(), style: TextStyle(color: Colors.blue),)],),
                                  Divider(),
                                  ],),
                                );
  }
}
