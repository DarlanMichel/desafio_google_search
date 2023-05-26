import 'dart:async';
import 'dart:convert';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class GoogleSearchResource extends Resource {
  @override
  List<Route> get routes => [Route.get('/:search', search)];

  FutureOr<Response> search(ModularArguments arguments) async {
    final response = await http.Client().get(Uri.parse(
        'https://www.google.com/search?q=${arguments.params['search']}'));

    var document = parse(response.body);

    var results =
        document.getElementsByClassName('Gx5Zad fP1Qef xpd EtOod pkphOe');

    var list = [];

    for (var items in results) {
      var href = items.getElementsByClassName('egMi0 kCrYT')[0].innerHtml;

      var link = href.substring(
        href.indexOf(RegExp(r'https')),
        href.indexOf(RegExp(r'&amp;')),
      );

      var item = {
        "title": items.getElementsByClassName('BNeawe vvjwJb AP7Wnd')[0].text,
        "link": link,
      };

      list.add(item);
    }

    return Response.ok(jsonEncode(list));
  }
}
