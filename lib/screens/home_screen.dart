import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/food_item.dart';
import '../utils/page_transitions.dart';
import '../widgets/category_chip.dart';
import '../widgets/food_card.dart';
import 'food_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _category = 'All';
  String _query = '';

  List<FoodItem> get _filtered {
    return kFoodItems.where((f) {
      final matchesCategory = _category == 'All' || f.category == _category;
      final matchesQuery =
          f.name.toLowerCase().contains(_query.trim().toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery drives spacing so the header breathes more on wide/tablet
    // screens instead of staying cramped at a fixed padding.
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width > 600 ? 32.0 : 20.0;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(horizontalPadding),
            const SizedBox(height: 4),
            _buildCategories(),
            const SizedBox(height: 8),
            Expanded(child: _buildGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 16, horizontalPadding, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hey Saie Ahmad ',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 2),
          Text('What are you craving today?',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          TextField(
            onChanged: (v) => setState(() => _query = v),
            decoration: InputDecoration(
              hintText: 'Search dishes...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: kCategories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final cat = kCategories[i];
          return CategoryChip(
            label: cat,
            selected: cat == _category,
            onTap: () => setState(() => _category = cat),
          );
        },
      ),
    );
  }

  Widget _buildGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 700
            ? 4
            : (constraints.maxWidth > 480 ? 3 : 2);
        final items = _filtered;
        if (items.isEmpty) {
          return const Center(child: Text('No dishes found'));
        }
        return GridView.builder(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.68,
          ),
          itemCount: items.length,
          itemBuilder: (context, i) => FoodCard(
            item: items[i],
            onTap: () => Navigator.of(context).push(
              FadeSlideRoute(page: FoodDetailScreen(item: items[i])),
            ),
          ),
        );
      },
    );
  }
}
