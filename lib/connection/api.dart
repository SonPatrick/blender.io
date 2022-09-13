import 'package:blender/connection/api_impl.dart';
import 'package:http/http.dart' as http;

class Api extends ApiImpl {
  @override
  Future<dynamic> getData() async {
    var response = await http.get(Uri.parse("url"));
    return response.body;
  }
}
