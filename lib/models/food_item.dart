import 'package:flutter/material.dart';

class FoodItem {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final String description;
  final IconData icon;
  final Color color;

  const FoodItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.description,
    required this.icon,
    required this.color,
  });
}
