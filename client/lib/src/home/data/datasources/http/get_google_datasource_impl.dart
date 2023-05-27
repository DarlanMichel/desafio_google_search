import 'dart:convert';

import 'package:client/src/home/data/datasources/get_google_datasource.dart';
import 'package:client/src/home/data/dtos/google_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class GetGoogleDatasource implements IGetGoogleDatasource {
  @override
  Future<Either<Exception, List<GoogleDto>>> call({String? search}) async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:8080/${search ?? ''}'));
      final body = jsonDecode(response.body);

      return Right(
        (body as List).map((e) => GoogleDto.fromJson(e)).toList(),
      );
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
