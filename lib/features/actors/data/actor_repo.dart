import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/app_endpoints.dart';
import '../../../core/network/dio_client.dart';
import 'actor_model.dart';

class ActorRepo {
  final DioClient _dioClient;

  ActorRepo(this._dioClient);

  Future<Either<Failure, List<ActorModel>>> getActors() async {
    try {
      final response = await _dioClient.get(path: AppEndpoints.getCharacter);
      
      final List results = response.data['results'] ?? [];
      final List<ActorModel> actors = results.map((e) => ActorModel.fromJson(e)).toList();
      
      return Right(actors);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }
}
