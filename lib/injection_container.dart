import 'package:get_it/get_it.dart';
import 'package:ride_checker_test_task/repository/dio_config.dart';
import 'package:ride_checker_test_task/repository/ride_repository.dart';
import 'package:ride_checker_test_task/states/ride_bloc.dart';

final sl = GetIt.I;

Future<void> init() async {
  sl.registerLazySingleton<RideBloc>(() => RideBloc(
      rideRepository: sl<RideRepository>(), initialState: sl<RideInitial>()));

  sl.registerLazySingleton<IApi>(() => Api());
  sl.registerLazySingleton<RideRepository>(
      () => RideRepository(client: sl<IApi>()));

  sl.registerLazySingleton<RideInitial>(() => RideInitial());
}
