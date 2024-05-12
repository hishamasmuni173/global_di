import 'dart:convert';
import 'package:http/http.dart' as http;

class RestService {
  static final RestService _instance = RestService._constructor();
  factory RestService() {
    return _instance;
  }

  RestService._constructor();

  // Change the baseUrl based on your laptop's IP address.
// static const String baseUrl = 'http://192.168.34.55:3000';
//  static const String baseUrl = 'http://10.160.196.36:3000';
//  static const String baseUrl = 'http://localhost:3000';
  static const String baseUrl = 'http://https://my-json-server.typicode.com/jumail-utm/architecture_dependency';


  Future get(String endpoint) async {
    final response = await http.get('$baseUrl/$endpoint' as Uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post('$baseUrl/$endpoint' as Uri,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch('$baseUrl/$endpoint' as Uri,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future delete(String endpoint) async {
    final response = await http.delete('$baseUrl/$endpoint' as Uri);

    if (response.statusCode == 200) {
      return;
    }
    throw response;
  }
}
