import 'package:client/src/home/data/datasources/http/get_google_datasource_impl.dart';
import 'package:client/src/home/data/repositories/get_google_repository_impl.dart';
import 'package:client/src/home/domain/entities/google_entity.dart';
import 'package:client/src/home/domain/usecases/get_google_usecase.dart';
import 'package:client/src/home/domain/usecases/get_google_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  IGetGoogleUsecase getGoogleUsecase = GetGoogleUsecase(
    GetGoogleRepository(
      GetGoogleDatasource(),
    ),
  );

  test('Espero que retorne uma lista de entities', () async {
    var result = await getGoogleUsecase(search: 'flutter');
    List<GoogleEntity> entity = [];
    result.fold((l) => null, (r) => entity = r);

    expect(entity, isNotEmpty);
  });

  test('Espero que retorne uma lista com 8 resultados', () async {
    var result = await getGoogleUsecase(search: 'flutter');
    List<GoogleEntity> entity = [];
    result.fold((l) => null, (r) => entity = r);

    expect(entity.length, 8);
  });

  test('Espero que o primeiro resultado da lista seja Flutter', () async {
    var result = await getGoogleUsecase(search: 'flutter');
    List<GoogleEntity> entity = [];
    result.fold((l) => null, (r) => entity = r);

    expect(entity.first.title, 'Flutter');
  });
}
