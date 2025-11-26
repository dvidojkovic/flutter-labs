import 'dart:convert';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Category>> loadCategoriesList() async {
    final detailResponse = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php')
    );

    if (detailResponse.statusCode == 200) {
      final detailData = json.decode(detailResponse.body);
      final List<dynamic> catData = detailData['categories'];

      return catData.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  Future<Category?> searchCategoryByName(String name) async {
    try {
      final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=${name.toLowerCase()}')
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Category.fromJson(data);
      }
      return null;
    }
    catch(e) {
      return null;
    }
  }

  Future<List<Meal>> loadMealsByCategory(String category) async {
    final detailResponse = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category')
    );

    if (detailResponse.statusCode == 200) {
      final detailData = json.decode(detailResponse.body);
      final List<dynamic> catData = detailData['meals'];

      return catData.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch meals');
    }
  }

  Future<Meal?> searchMealByName(String name) async {
    try {
      final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=${name.toLowerCase()}')
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Meal.fromJson(data);
      }
      return null;
    }
    catch(e) {
      return null;
    }
  }

  Future<Meal?> lookupMealById(String idMeal) async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$idMeal')
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> meals = data['meals'];
      return meals.map((json) => Meal.fromJson(json)).first;
    } else {
      throw Exception('Failed to fetch meal');
    }
  }

  Future<Meal?> fetchRandomMeal() async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php')
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> meals = data['meals'];
      return meals.map((json) => Meal.fromJson(json)).first;
    } else {
      throw Exception('Failed to fetch meal');
    }
  }
}