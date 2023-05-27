import 'package:client/src/home/domain/entities/google_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IGetGoogleUsecase {
  Future<Either<Exception, List<GoogleEntity>>> call({String? search});
}
