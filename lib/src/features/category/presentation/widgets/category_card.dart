import 'package:express_shop/src/core/extentions.dart';
import 'package:express_shop/src/features/category/domain/category.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final AppCategory category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).goNamed(
          "category",
          pathParameters: {'category': category.name},
        );
      },
      child: Container(
        height: context.height * 0.2,
        width: context.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.brown),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              category.cover,
              fit: BoxFit.cover,
            ),
            Center(
              child: Text(
                category.name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
