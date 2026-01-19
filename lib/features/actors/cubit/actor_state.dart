import '../data/actor_model.dart';

abstract class ActorState{}

class InitialActorState extends ActorState{}

class LoadingGetActors extends ActorState{}

class SuccessGetActors extends ActorState{
  final List<ActorModel> actors;

  SuccessGetActors(this.actors);
}

class FailureGetActors extends ActorState{
  final String message;
  final int statusCode;

  FailureGetActors(this.message,this.statusCode);
}