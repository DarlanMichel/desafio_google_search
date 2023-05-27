import 'package:client/src/home/data/datasources/get_google_datasource.dart';
import 'package:client/src/home/data/datasources/http/get_google_datasource_impl.dart';
import 'package:client/src/home/data/repositories/get_google_repository_impl.dart';
import 'package:client/src/home/domain/repositories/get_google_repository.dart';
import 'package:client/src/home/domain/usecases/get_google_usecase.dart';
import 'package:client/src/home/domain/usecases/get_google_usecase_impl.dart';
import 'package:client/src/home/presentation/bloc/google_bloc.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<IGetGoogleDatasource>(
      () => GetGoogleDatasource(),
    );

    getIt.registerLazySingleton<IGetGoogleRepository>(
      () => GetGoogleRepository(getIt()),
    );

    getIt.registerLazySingleton<IGetGoogleUsecase>(
      () => GetGoogleUsecase(getIt()),
    );

    getIt.registerFactory<GoogleBloc>(
      () => GoogleBloc(getGoogleUsecase: getIt()),
    );
  }
}
