import 'package:client/src/home/domain/entities/google_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IGetGoogleRepository {
  Future<Either<Exception, List<GoogleEntity>>> call({String? search});
}
