import 'package:client/src/home/data/datasources/get_google_datasource.dart';
import 'package:client/src/home/domain/entities/google_entity.dart';
import 'package:client/src/home/domain/repositories/get_google_repository.dart';
import 'package:dartz/dartz.dart';

class GetGoogleRepository implements IGetGoogleRepository {
  final IGetGoogleDatasource _getGoogleDatasource;

  GetGoogleRepository(this._getGoogleDatasource);

  @override
  Future<Either<Exception, List<GoogleEntity>>> call({String? search}) async {
    return await _getGoogleDatasource(search: search);
  }
}
