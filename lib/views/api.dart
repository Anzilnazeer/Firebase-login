import 'dart:convert';

import 'package:login_page/model/productmodel.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>> fetchProductss() async {
  try {
    const url = 'https://fakestoreapi.com/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return List<ProductModel>.from(json.map((x) => ProductModel.fromJson(x)));
    } else {
      return throw Exception('');
    }
  } catch (e) {
    throw Exception('Failed to connect server');
  }
}
