import 'package:client/src/home/domain/entities/google_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GoogleEntity entity =
      GoogleEntity(title: 'Flutter', link: 'https://flutter.dev/');

  test('Espero que a entidade não seja nula ', () {
    expect(entity, isNotNull);
  });
}
