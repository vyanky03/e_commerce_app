import 'package:e_commerce_app/constants.dart';
import 'package:http/http.dart' as http;

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse(remoteUrl),
    );
    return response;
  }
}
