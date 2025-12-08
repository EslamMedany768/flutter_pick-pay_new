  import 'dart:convert';

  import 'package:graduation_project/api/api_constant.dart';
  import 'package:graduation_project/model/ProductUpdateModel.dart';

  import 'package:http/http.dart' as http;

  import '../model/CategoriesModel.dart';
  import '../model/FavouraiteItemModel.dart';
  import '../model/ProductModel.dart';
import '../model/WishlistModel.dart';

  class ApiManager {
    static List<FavouraitesItemDTO> favouriteItems = [];
    static List<WishlistItemDTO> wishlistItems = [];


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
    static Future<ProductModel?> getEveryDayNeedsProducts() async {
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
        "CategoryId": "${category.id}",
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

    static Future<bool> createOrUpdateFavourites(FavouraitesDTO dto) async {

      final url = Uri.parse('http://10.0.2.2:5044/CreateOrUpdateFavouraites');

      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(dto.toJson()),
        );

        if (response.statusCode == 200) {
          print('Success: ${response.body}');
          return true;
        } else {
          print('Error: ${response.statusCode} - ${response.body}');
          return false;
        }
      } catch (e) {
        print('Exception: $e');
        return false;
      }
    }
    static Future<bool> createOrUpdateWishlist(WishlistDTO dto) async {

      final url = Uri.parse('http://10.0.2.2:5044/CreateOrUpdate');

      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(dto.toJson()),
        );

        if (response.statusCode == 200) {
          print('Success: ${response.body}');
          return true;
        } else {
          print('Error: ${response.statusCode} - ${response.body}');
          return false;
        }
      } catch (e) {
        print('Exception: $e');
        return false;
      }
    }
    static Future<bool> UpdateProduct(ProductToUpdateDTO dto, int? id) async {

      final url = Uri.parse('http://10.0.2.2:5044/UpdateProduct/$id'  );

      try {
        final response = await http.put(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(dto.toJson()),
        );

        if (response.statusCode == 200) {
          print('Success: ${response.body}');
          return true;
        } else {
          print('Error: ${response.statusCode} - ${response.body}');
          return false;
        }
      } catch (e) {
        print('Exception: $e');
        return false;
      }
    }
    static Future<FavouraitesDTO?> getFavouritesById(String favId) async {
      final url = Uri.parse("http://10.0.2.2:5044/GetFavouraitesById/$favId");

      try {
        var response = await http.get(url);

        if (response.statusCode != 200) {
          throw Exception("Server error: ${response.statusCode}");
        }

        var json = jsonDecode(response.body);
        return FavouraitesDTO.fromJson(json);
      } catch (e) {
        throw e;
      }
    }
    static Future<WishlistDTO?> getWishlistById(String wishlistId) async {
      final url = Uri.parse("http://10.0.2.2:5044/GetById/$wishlistId");

      try {
        var response = await http.get(url);

        if (response.statusCode != 200) {
          throw Exception("Server error: ${response.statusCode}");
        }

        var json = jsonDecode(response.body);
        return WishlistDTO.fromJson(json);
      } catch (e) {
        throw e;
      }
    }


  }
