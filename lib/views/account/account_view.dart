import 'package:flutter/material.dart';
import 'package:garden_shop/widgets/index.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: const StandardAppBar(title: 'Account'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
                child: Icon(Icons.person, size: 32, color: colorScheme.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Afif 🌱',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'afif@example.com',
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: theme.hintColor),
            ],
          ),
          const SizedBox(height: 30),

          _SectionTitle(title: 'My Stuff'),
          _ActionTile(icon: Icons.shopping_bag, label: 'My Orders', onTap: () {}),
          _ActionTile(icon: Icons.favorite, label: 'Wishlist', onTap: () {}),
          _ActionTile(icon: Icons.location_on, label: 'Addresses', onTap: () {}),
          const SizedBox(height: 30),

          _SectionTitle(title: 'Settings'),
          _ActionTile(icon: Icons.notifications, label: 'Notifications', onTap: () {}),
          _ActionTile(icon: Icons.settings, label: 'App Settings', onTap: () {}),
          _ActionTile(icon: Icons.help_outline, label: 'Help Center', onTap: () {}),
          const SizedBox(height: 30),

          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.error,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.centerLeft,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionTile({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.primary),
      title: Text(label, style: theme.textTheme.bodyLarge),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: theme.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
