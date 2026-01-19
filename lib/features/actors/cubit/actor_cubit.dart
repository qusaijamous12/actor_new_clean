import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../data/actor_repo.dart';
import 'actor_state.dart';

class ActorCubit extends Cubit<ActorState>{
  final ActorRepo _actorRepo;
  ActorCubit(this._actorRepo):super(InitialActorState());

  final refreshController=RefreshController();


  Future<void> getActors()async{
    emit(LoadingGetActors());

    final result=await _actorRepo.getActors();

    result.fold((failure){
      emit(FailureGetActors(failure.message, failure.statusCode));
    }, (actors){
      emit(SuccessGetActors(actors));
    });
  }

}