import 'dart:io';
import 'package:backend/backend.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
  final file = File('.env');
  final envText = file.readAsStringSync();
  String ip = '';
  for (var line in envText.split('\n')) {
    final lineBreak = line.split('=');
    if (lineBreak[0].contains('IP_CONFIG')) {
      ip = lineBreak[1];
    }
  }

  var server = await io.serve(
    await startShelfModular(),
    ip.isEmpty ? 'localhost' : ip,
    8080,
  );

  print('Server online: http://${server.address.host}:${server.port}');
}
