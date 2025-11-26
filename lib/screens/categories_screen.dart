import 'package:flutter/material.dart';
import 'package:flutter_application_labs1/screens/category_grid.dart';
import 'package:flutter_application_labs1/services/api_service.dart';

import '../models/models.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key, required this.title});

  final String title;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late List<Category> _categories = [];
  List<Category> _filteredCategories = [];
  bool _isLoading = true;
  // bool _isSearching = false;
  String _searchQuery = '';
  final ApiService _apiService = ApiService();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCategoriesList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle),
            tooltip: "Random Meal",
            onPressed: () async {
              final randomMeal = await _apiService.fetchRandomMeal();

              if (randomMeal != null) {
                Navigator.pushNamed(context, '/details', arguments: randomMeal.idMeal);
              }
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Category by name...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                      _filterCategory(value);
                    },
                  ),
                ),
                Expanded(
                  child: _filteredCategories.isEmpty && _searchQuery.isNotEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.search_off, size: 64, color: Colors.grey),
                              const SizedBox(height: 16),
                              const Text(
                                'No Category found',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: CategoryGrid(categories: _filteredCategories),
                        ),
                ),
              ],
            ),
    );
  }

  void _loadCategoriesList() async {
    try {
      final categoriesList = await _apiService.loadCategoriesList();

      setState(() {
        _categories = categoriesList;
        _filteredCategories = categoriesList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _categories = [];
        _filteredCategories = [];
        _isLoading = false;
      });
    }
  }

  void _filterCategory(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredCategories = _categories;
      } else {
        _filteredCategories = _categories
          .where((x) => x.strCategory.toLowerCase().contains(query.toLowerCase()))
          .toList();
      }
    });
  }

  // Future<void> _searchCategoryByName(String name) async {
  //   if (name.isEmpty) return;

  //   setState(() {
  //     _isSearching = true;
  //   });

  //   final category = await _apiService.searchCategoryByName(name);

  //   setState(() {
  //     _isSearching = false;

  //     if (category != null) {
  //       _filteredCategories = [category];
  //     } else {
  //       _filteredCategories = [];
  //     }
  //   });
  // }
}