import 'package:client/src/home/data/dtos/google_dto.dart';
import 'package:dartz/dartz.dart';

abstract class IGetGoogleDatasource {
  Future<Either<Exception, List<GoogleDto>>> call({String? search});
}
