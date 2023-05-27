import 'package:client/src/home/domain/entities/google_entity.dart';
import 'package:client/src/home/domain/repositories/get_google_repository.dart';
import 'package:client/src/home/domain/usecases/get_google_usecase.dart';
import 'package:dartz/dartz.dart';

class GetGoogleUsecase implements IGetGoogleUsecase {
  final IGetGoogleRepository _getGoogleRepository;
  GetGoogleUsecase(this._getGoogleRepository);

  @override
  Future<Either<Exception, List<GoogleEntity>>> call({String? search}) async {
    return await _getGoogleRepository(search: search);
  }
}
