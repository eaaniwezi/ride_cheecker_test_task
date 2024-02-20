part of 'ride_bloc.dart';

class RideState {}

class RideInitial extends RideState {}

class FetchingRides extends RideState {}

class SuccessFetchingRides extends RideState {
  final List<RideModel> foundRides;
  SuccessFetchingRides({
    required this.foundRides,
  });
}

class ErrorFetchingRides extends RideState {}
