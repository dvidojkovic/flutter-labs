import 'package:flutter/material.dart';
import 'package:flutter_application_labs1/models/models.dart';
import 'package:flutter_application_labs1/services/api_service.dart';

class MealDetailPage extends StatefulWidget {
  const MealDetailPage({super.key});

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  late final String mealId;
  Meal? _meal;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mealId = ModalRoute.of(context)!.settings.arguments as String;
    _loadMealDetail();
  }

  void _loadMealDetail() async {
    final meal = await ApiService().lookupMealById(mealId);
    setState(() {
      _meal = meal;
      _isLoading = false;
    });
  }

  Widget _buildIngredients() {
    if (_meal == null) return const SizedBox.shrink();

    List<Widget> list = [];
    for (int i = 0; i < _meal!.ingredients.length; i++) {
      final ingredient = _meal!.ingredients[i];
      final measure = _meal!.measures[i];
      if (ingredient != null && ingredient.isNotEmpty) {
        list.add(
          Text("• ${ingredient.trim()} - ${measure?.trim() ?? ''}"),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(title: Text(_meal!.strMeal)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.network(_meal!.strMealThumb, width: 200, height: 200),
            ),
            const SizedBox(height: 2),

            Text(
              _meal!.strMeal,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            if (_meal!.strInstructions != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Instructions:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 4),
                  Text(_meal!.strInstructions!),
                  const SizedBox(height: 12),
                ],
              ),

            const Text("Ingredients:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            _buildIngredients(),
            const SizedBox(height: 12),

            if (_meal!.strYoutube != null && _meal!.strYoutube!.isNotEmpty)
              const Text("Youtube Link:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(_meal!.strYoutube!),
          ],
        ),
      ),
    );
  }
}