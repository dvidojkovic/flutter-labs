import 'package:flutter/material.dart';

import '../models/models.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/meals", arguments: category.strCategory);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red.shade300, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(child: Image.network(category.strCategoryThumb)),
              Divider(),
              Text(category.strCategory, style: TextStyle(fontSize: 20)),
              Text(
                category.strCategoryDescription.length > 40
                  ? "${category.strCategoryDescription.substring(0, 40)}..."
                  : category.strCategoryDescription,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
                maxLines: 2
              )
            ],
          ),
        ),
      ),
    );
  }
}
