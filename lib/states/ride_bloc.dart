// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_checker_test_task/model/ride_model.dart';
import 'package:ride_checker_test_task/repository/ride_repository.dart';

part 'ride_event.dart';
part 'ride_state.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  final RideRepository rideRepository;

  RideBloc({
    required RideState initialState,
    required this.rideRepository,
  })  : assert(rideRepository != null),
        super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<RideState> mapEventToState(RideEvent event) async* {
    if (event is GetRidesEvent) {
      try {
        yield FetchingRides();
        late final List<RideModel> _foundRides;
        _foundRides = await rideRepository.getRides(
          fromWhere: event.fromWhere,
          toWhere: event.toWhere,
          date: event.date,
        );
        yield SuccessFetchingRides(foundRides: _foundRides);
      } catch (e) {
        print(e);
        yield ErrorFetchingRides();
      }
    }
  }
}
