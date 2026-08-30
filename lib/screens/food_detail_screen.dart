import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/food_item.dart';
import '../state/cart_scope.dart';
import '../utils/page_transitions.dart';
import '../widgets/custom_button.dart';
import '../widgets/food_card.dart';
import '../widgets/section_title.dart';

class FoodDetailScreen extends StatefulWidget {
  final FoodItem item;
  const FoodDetailScreen({super.key, required this.item});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(item),
          SliverToBoxAdapter(child: _buildContent(item)),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(item),
    );
  }

  Widget _buildAppBar(FoodItem item) {
    return SliverAppBar(
      expandedHeight: 260,
      pinned: true,
      backgroundColor: item.color,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: item.color,
          child: Center(child: Icon(item.icon, size: 120, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildContent(FoodItem item) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(item.name, style: theme.textTheme.headlineSmall)),
              _buildRating(item.rating),
            ],
          ),
          const SizedBox(height: 8),
          Text(item.category, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Text(item.description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 24),
          _buildQuantitySelector(),
          const SizedBox(height: 24),
          const SectionTitle(title: 'You might also like'),
          const SizedBox(height: 12),
          _buildRelated(item),
        ],
      ),
    );
  }

  Widget _buildRating(double rating) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 18),
        const SizedBox(width: 4),
        Text(rating.toStringAsFixed(1)),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        Text('Quantity', style: Theme.of(context).textTheme.titleMedium),
        const Spacer(),
        IconButton(
          onPressed: () => setState(() => _quantity = _quantity > 1 ? _quantity - 1 : 1),
          icon: const Icon(Icons.remove_circle_outline),
        ),
        Text('$_quantity', style: Theme.of(context).textTheme.titleMedium),
        IconButton(
          onPressed: () => setState(() => _quantity++),
          icon: const Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }

  Widget _buildRelated(FoodItem item) {
    final related = kFoodItems.where((f) => f.category == item.category && f.id != item.id).toList();
    if (related.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: related.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) => SizedBox(
          width: 150,
          child: FoodCard(
            item: related[i],
            onTap: () => Navigator.of(context).pushReplacement(
              FadeSlideRoute(page: FoodDetailScreen(item: related[i])),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(FoodItem item) {
    final cart = CartScope.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              '\$${(item.price * _quantity).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: CustomButton(
                label: 'Add to cart',
                icon: Icons.shopping_cart_outlined,
                onPressed: () {
                  for (var i = 0; i < _quantity; i++) {
                    cart.add(item);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item.name} added to cart')),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
