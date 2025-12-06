import 'dart:convert';

import 'package:graduation_project/api/api_contant.dart';

import 'package:http/http.dart' as http;

import '../model/CategoriesModel.dart';
import '../model/ProductModel.dart';

class ApiManager {
  static Future<CategoriesModel?> getCategories() async {
    Uri url = Uri.http(ApiConstant.baseUrl, ApiConstant.endPointCategories);
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return CategoriesModel.fromJson(json);
    } catch (e) {
      throw (e);
    }
  }

  //GetAllProdutcs?Priority=2
  static Future<ProductModel?> getEveryDayNeeds() async {
    Uri url = Uri.http(ApiConstant.baseUrl, ApiConstant.endPointAllProduct, {
      "Priority": "2",
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ProductModel.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductModel?> getProductByCategoryId(Category category) async {
    Uri Url = Uri.http(ApiConstant.baseUrl, ApiConstant.endPointAllProduct, {
      "CategoryId": category.id.toString(),
    });
    try {
      var response = await http.get(Url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ProductModel.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductModel?> getAllProducts() async {
    Uri url = Uri.http(ApiConstant.baseUrl, ApiConstant.endPointAllProduct);
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ProductModel.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
