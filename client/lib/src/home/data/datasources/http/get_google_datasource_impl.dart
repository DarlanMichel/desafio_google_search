import 'dart:convert';
import 'package:client/src/home/data/datasources/get_google_datasource.dart';
import 'package:client/src/home/data/dtos/google_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

class GetGoogleDatasource implements IGetGoogleDatasource {
  @override
  Future<Either<Exception, List<GoogleDto>>> call({String? search}) async {
    try {
      await dot_env.dotenv.load(fileName: ".env");

      final response = await http.get(Uri.parse(
          'http://${(dot_env.dotenv.env['IP_CONFIG'] ?? '').isEmpty ? 'localhost' : dot_env.dotenv.env['IP_CONFIG']}:8080/${search ?? ''}'));
      final body = jsonDecode(response.body);

      return Right(
        (body as List).map((e) => GoogleDto.fromJson(e)).toList(),
      );
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
