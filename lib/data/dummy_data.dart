import 'package:flutter/material.dart';
import '../models/food_item.dart';

const kCategories = ['All', 'Pizza', 'Burger', 'Sushi', 'Dessert', 'Drinks'];

final kFoodItems = <FoodItem>[
  FoodItem(
    id: 'p1',
    name: 'Margherita Pizza',
    category: 'Pizza',
    price: 8.99,
    rating: 4.6,
    icon: Icons.local_pizza,
    color: const Color(0xFFFF6B35),
    description:
        'Classic pizza topped with fresh mozzarella, basil, and a rich tomato sauce on a thin, wood-fired crust.',
  ),
  FoodItem(
    id: 'p2',
    name: 'Pepperoni Pizza',
    category: 'Pizza',
    price: 10.49,
    rating: 4.7,
    icon: Icons.local_pizza,
    color: const Color(0xFFE85D35),
    description:
        'Loaded with spicy pepperoni slices and extra mozzarella cheese, baked until golden and crisp.',
  ),
  FoodItem(
    id: 'p3',
    name: 'Veggie Supreme',
    category: 'Pizza',
    price: 9.49,
    rating: 4.4,
    icon: Icons.local_pizza,
    color: const Color(0xFFFF8A5B),
    description:
        'A garden of bell peppers, olives, onions, and mushrooms over a herby tomato base.',
  ),
  FoodItem(
    id: 'b1',
    name: 'Classic Cheeseburger',
    category: 'Burger',
    price: 7.49,
    rating: 4.5,
    icon: Icons.lunch_dining,
    color: const Color(0xFF8D5A44),
    description:
        'A juicy beef patty with melted cheddar, lettuce, tomato, and our signature sauce in a toasted bun.',
  ),
  FoodItem(
    id: 'b2',
    name: 'Double Beef Burger',
    category: 'Burger',
    price: 9.99,
    rating: 4.8,
    icon: Icons.lunch_dining,
    color: const Color(0xFF6F4A38),
    description:
        'Two hearty beef patties stacked with double cheese, pickles, and caramelized onions.',
  ),
  FoodItem(
    id: 'b3',
    name: 'Grilled Chicken Burger',
    category: 'Burger',
    price: 8.29,
    rating: 4.3,
    icon: Icons.lunch_dining,
    color: const Color(0xFFA9714F),
    description:
        'A tender grilled chicken breast with lettuce and honey-mustard sauce on a brioche bun.',
  ),
  FoodItem(
    id: 's1',
    name: 'Salmon Nigiri Set',
    category: 'Sushi',
    price: 12.99,
    rating: 4.9,
    icon: Icons.set_meal,
    color: const Color(0xFF2EC4B6),
    description:
        'Eight pieces of fresh salmon nigiri, hand-pressed over seasoned sushi rice.',
  ),
  FoodItem(
    id: 's2',
    name: 'Dragon Roll',
    category: 'Sushi',
    price: 13.49,
    rating: 4.7,
    icon: Icons.set_meal,
    color: const Color(0xFF23A79A),
    description:
        'Tempura shrimp and cucumber rolled inside, topped with avocado and eel sauce.',
  ),
  FoodItem(
    id: 'd1',
    name: 'Chocolate Lava Cake',
    category: 'Dessert',
    price: 5.99,
    rating: 4.8,
    icon: Icons.cake,
    color: const Color(0xFF7C4DFF),
    description:
        'A warm chocolate cake with a molten center, served with a scoop of vanilla ice cream.',
  ),
  FoodItem(
    id: 'd2',
    name: 'New York Cheesecake',
    category: 'Dessert',
    price: 6.49,
    rating: 4.6,
    icon: Icons.cake,
    color: const Color(0xFF9575FF),
    description:
        'Rich and creamy cheesecake on a buttery graham cracker crust, topped with berry compote.',
  ),
  FoodItem(
    id: 'dr1',
    name: 'Iced Mango Smoothie',
    category: 'Drinks',
    price: 4.49,
    rating: 4.5,
    icon: Icons.local_drink,
    color: const Color(0xFFFFC145),
    description:
        'A refreshing blend of ripe mango, yogurt, and a hint of lime, served over ice.',
  ),
  FoodItem(
    id: 'dr2',
    name: 'Cold Brew Coffee',
    category: 'Drinks',
    price: 3.99,
    rating: 4.4,
    icon: Icons.local_cafe,
    color: const Color(0xFF6B4226),
    description:
        'Slow-steeped for 18 hours for a smooth, low-acidity coffee served chilled.',
  ),
];
