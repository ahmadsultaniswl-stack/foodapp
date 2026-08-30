import 'package:flutter/material.dart';
import '../state/cart_model.dart';
import '../state/cart_scope.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartScope.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: AnimatedBuilder(
        animation: cart,
        builder: (context, _) {
          if (cart.entries.isEmpty) return _buildEmpty(context);
          return _buildList(context, cart);
        },
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 72, color: Theme.of(context).disabledColor),
          const SizedBox(height: 12),
          const Text('Your cart is empty'),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, CartModel cart) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: cart.entries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final entry = cart.entries[i];
              return CartItemTile(
                entry: entry,
                onIncrement: () => cart.add(entry.item),
                onDecrement: () => cart.decrement(entry.item.id),
                onRemove: () => cart.remove(entry.item.id),
              );
            },
          ),
        ),
        _buildSummary(context, cart),
      ],
    );
  }

  Widget _buildSummary(BuildContext context, CartModel cart) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, -4)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal'),
                Text('\$${cart.subtotal.toStringAsFixed(2)}'),
              ],
            ),
            const SizedBox(height: 12),
            CustomButton(
              label: 'Checkout',
              icon: Icons.arrow_forward,
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Checkout flow coming soon')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
