import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'state/cart_model.dart';
import 'state/cart_scope.dart';
import 'state/theme_scope.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatefulWidget {
  const FoodApp({super.key});

  @override
  State<FoodApp> createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.light);
  final CartModel _cart = CartModel();

  @override
  void dispose() {
    _themeMode.dispose();
    _cart.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CartScope(
      cart: _cart,
      child: ThemeScope(
        notifier: _themeMode,
        child: AnimatedBuilder(
          animation: _themeMode,
          builder: (context, _) {
            return MaterialApp(
              title: 'FoodApp',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: _themeMode.value,
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
