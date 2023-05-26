import 'package:backend/src/modules/google_search/google_search_resource.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
    Route.resource(GoogleSearchResource())
  ];
}
