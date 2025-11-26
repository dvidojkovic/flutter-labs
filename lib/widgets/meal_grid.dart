import 'package:flutter/material.dart';
import 'package:flutter_application_labs1/models/models.dart';
import 'package:flutter_application_labs1/screens/meal_grid_content.dart';

import '../services/api_service.dart';

class MealGrid extends StatefulWidget {
  final String category;
  const MealGrid({super.key, required this.category});

  @override
  State<MealGrid> createState() => _MealGridState();
}

class _MealGridState extends State<MealGrid> {
  final ApiService _apiService = ApiService();

  List<Meal> _allMeals = [];
  List<Meal> _filteredMeals = [];

  bool _isLoading = true;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  void _loadMeals() async {
    final meals = await _apiService.loadMealsByCategory(widget.category);
    setState(() {
      _allMeals = meals;
      _filteredMeals = meals;
      _isLoading = false;
    });
  }

  void _filter(String query) {
    setState(() {
      _searchQuery = query;
      _filteredMeals = _allMeals
          .where((m) => m.strMeal.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search meal...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
              _filter(value);
            },
          ),
        ),

        Expanded(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : _filteredMeals.isEmpty && _searchQuery.isNotEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search_off, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text(
                        'No Meal found',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(height: 8)
                    ],
                  ),
                )
                : MealGridContent(meals: _filteredMeals),
        ),
      ],
    );
  }
}