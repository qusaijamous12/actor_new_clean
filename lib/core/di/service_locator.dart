import 'package:get_it/get_it.dart';

import '../../features/actors/cubit/actor_cubit.dart';
import '../../features/actors/data/actor_repo.dart';
import '../network/api_service.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;


void configureDependencies(){

  getIt.registerLazySingleton<ApiService>(()=>DioClient());
  getIt.registerLazySingleton<ActorRepo>(() => ActorRepo(getIt<ApiService>() as DioClient));
  getIt.registerFactory<ActorCubit>(()=>ActorCubit(getIt<ActorRepo>()));

}
