import 'package:backend/src/app_module.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Handler> startShelfModular() async {
  return Modular(module: AppModule(), middlewares: [
    logRequests(),
    jsonResponse(),
  ]);
}

Middleware jsonResponse() {
  return (handle) {
    return (request) async {
      var response = await handle(request);

      response = response.change(headers: {
        'content-type': 'application/json',
      });

      return response;
    };
  };
}
