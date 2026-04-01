import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graduation_project/api/api_constant.dart';

import 'package:http/http.dart' as http;

import '../admin&tablet/admin/model/product_model.dart';
import '../data/model/CategoriesModel.dart';
import '../data/model/FavouraiteItemModel.dart';
import '../data/model/ProductUpdateModel.dart';
import '../data/model/WishlistModel.dart';
import 'end_point.dart';

class ApiManager {
  static List<FavouraitesItemDTO> favouriteItems = [];
  static List<WishlistItemDTO> wishlistItems = [];
  Dio dio = Dio();

  Future<CategoriesModel> getCategories({required endpoint}) async {
    try {
      var response = await dio.get(
        ApiConstant.baseUrl + endpoint,
        options: Options(validateStatus: (status) => true),
      );
      return CategoriesModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  //GetAllProdutcs?Priority=2
  Future<ProductModel> getEveryDayNeedsProducts() async {
    try {
      var response = await dio.get(
        ApiConstant.baseUrl + EndPoints.getAllProducts,
        queryParameters: {"Priority": "2"},
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  Future<ProductModel> getProductByCategoryId(Category category) async {
    try {
      var response = await dio.get(
        ApiConstant.baseUrl + EndPoints.getAllProducts,
        queryParameters: {"CategoryId": "${category.id}"},
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  Future<ProductModel> getAllProducts({required EndPoint}) async {
    try {
      var response = await dio.get(ApiConstant.baseUrl + EndPoint);
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
  static Future<Map<String, dynamic>> addToFavourites({
    required int favouritesId,
    required int userId,
    required int productId,
    required String pictureUrl,
    required double price,
    required String name,
  }) async {
    final url = Uri.parse('${ApiConstant.baseUrl}/AddToFavourites'); // endpoint الخاص بالـ POST

    final body = {
      "favouritesId": favouritesId,
      "userId": userId,
      "productId": productId,
      "pictureUrl": pictureUrl,
      "price": price,
      "name": name,
    };

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body); // يرجع الـ response كـ Map
    } else {
      throw Exception('Failed to add to favourites: ${response.statusCode}');
    }
  }
  Future<FavouraitesDTO?> getFavourites() async {
    try {
      var response = await dio.get(ApiConstant.baseUrl + "/ViewFavourites/1");


        return FavouraitesDTO.fromJson(response.data);


    } catch (e) {
      throw e;
    }
  }
  Future<bool> deleteFromFavourites({
    required int userId,
    required int favouritesId,
    required int productId,
  }) async {
    try {
      final response = await dio.delete(
        "${ApiConstant.baseUrl}/DeleteFromFavourites",
        data: {
          "userId": 1,
          "favouritesId": 1,
          "productId": productId,
        },
        options: Options(
          validateStatus: (status) => true,
        ),
      );

      print("Status Code: ${response.statusCode}");
      print("Response: ${response.data}");

      return response.statusCode == 200;
    } catch (e) {
      print("Exception: $e");
      return false;
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

  Future<bool> addOrUpdateWishlist(WishlistDTO wishlist) async {
    try {
      final response = await dio.put(
        "${ApiConstant.baseUrl}/AddOrUpdateWishlist/1", // /1 = userId
        data: wishlist.toJson(),
        options: Options(validateStatus: (status) => status! < 600),
      );

      if (response.statusCode == 200) {
        print("Updated wishlist: ${response.data}");
        return true;
      } else {
        print("Error ${response.statusCode}: ${response.data}");
        return false;
      }
    } catch (e) {
      print("Exception: $e");
      return false;
    }
  }

  Future<void> addItemToWishlist(WishlistItemDTO item) async {
    // 1- نجيب wishlist موجودة (GET)
    WishlistDTO? existingWishlist = await getWishlistById("1");

    if (existingWishlist == null || existingWishlist.items.isEmpty) {
      // 2- لو مفيش wishlist → نعمل Create
      var wishlist = WishlistDTO(items: [item]);
      await createWishlist(wishlist);
    } else {
      // 3- لو في wishlist موجودة → نضيف / نحدث
      existingWishlist.items.add(item);
      await addOrUpdateWishlist(existingWishlist);
    }
  }

  Future<bool> createWishlist(WishlistDTO wishlist) async {
    try {
      final response = await dio.post(
        "${ApiConstant.baseUrl}/CreateWishlist",
        data: wishlist.toJson(),
        options: Options(validateStatus: (status) => status! < 600),
      );

      if (response.statusCode == 200) {
        print("Created wishlist: ${response.data}");
        return true;
      } else {
        print("Error ${response.statusCode}: ${response.data}");
        return false;
      }
    } catch (e) {
      print("Exception: $e");
      return false;
    }
  }

  static Future<bool> UpdateProduct(ProductToUpdateDTO dto, int? id) async {
    final url = Uri.parse('http://10.0.2.2:5044/UpdateProduct/$id');

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

  Future<WishlistDTO?> getWishlistById(String wishlistId) async {
    try {
      var response = await dio.get(
        ApiConstant.baseUrl + EndPoints.getWishlistById,
      );
      return WishlistDTO.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }


  Future<bool> deleteFromWishlist({
    required int userId,
    required int productId,
  }) async {
    try {
      final response = await dio.delete(
        "${ApiConstant.baseUrl}/Wishlist/DeleteFromWishlist",
        queryParameters: {
          "userId": userId,
          "productId": productId,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      print("Exception: $e");
      return false;
    }
  }




}
