import 'package:backend/backend.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
  var server = await io.serve(
    await startShelfModular(),
    'localhost',
    8080,
  );

  print('Server online: http://${server.address.host}:${server.port}');
}
