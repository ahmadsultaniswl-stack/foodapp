import 'package:flutter/material.dart';
import '../state/theme_scope.dart';
import '../widgets/section_title.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ThemeScope.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          const SectionTitle(title: 'Preferences'),
          const SizedBox(height: 8),
          _buildThemeToggle(themeNotifier),
          const SizedBox(height: 24),
          const SectionTitle(title: 'Account'),
          const SizedBox(height: 8),
          ..._buildMenuItems(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(radius: 32, child: Icon(Icons.person, size: 32)),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saie Ahmad', style: Theme.of(context).textTheme.titleLarge),
            Text('Flutter Developer', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }

  Widget _buildThemeToggle(ValueNotifier<ThemeMode> notifier) {
    return AnimatedBuilder(
      animation: notifier,
      builder: (context, _) {
        return Card(
          child: SwitchListTile(
            title: const Text('Dark mode'),
            secondary: const Icon(Icons.dark_mode_outlined),
            value: notifier.value == ThemeMode.dark,
            onChanged: (v) => notifier.value = v ? ThemeMode.dark : ThemeMode.light,
          ),
        );
      },
    );
  }

  List<Widget> _buildMenuItems() {
    const items = [
      ('Order history', Icons.receipt_long_outlined),
      ('Saved addresses', Icons.location_on_outlined),
      ('Payment methods', Icons.credit_card_outlined),
      ('Help & support', Icons.help_outline),
    ];
    return items
        .map((e) => Card(
              child: ListTile(
                leading: Icon(e.$2),
                title: Text(e.$1),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ))
        .toList();
  }
}
