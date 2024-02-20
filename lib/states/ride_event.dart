part of 'ride_bloc.dart';

abstract class RideEvent extends Equatable {
  const RideEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends RideEvent {}

class GetRidesEvent extends RideEvent {
  final String fromWhere;
  final String toWhere;
  final String date;
  const GetRidesEvent({
    required this.fromWhere,
    required this.toWhere,
    required this.date,
  });
}
