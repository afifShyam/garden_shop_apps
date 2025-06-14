import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:garden_shop/gen/assets.gen.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/mall')) return 1;
    if (location.startsWith('/discover')) return 2;
    if (location.startsWith('/inbox')) return 3;
    if (location.startsWith('/account')) return 4;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/mall');
        break;
      case 2:
        context.go('/discover');
        break;
      case 3:
        context.go('/inbox');
        break;
      case 4:
        context.go('/account');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex(context),
        onTap: (index) => _onTap(context, index),
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Assets.images.navIconHome.image(
              color: _currentIndex(context) == 0 ? theme.colorScheme.primary : Colors.grey,
              colorBlendMode: BlendMode.srcIn,
              scale: 2,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconMall.image(
              color: _currentIndex(context) == 1 ? theme.colorScheme.primary : Colors.grey,
              colorBlendMode: BlendMode.srcIn,
              scale: 2,
            ),
            label: 'Mall',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconDiscover.image(
              color: _currentIndex(context) == 2 ? theme.colorScheme.primary : Colors.grey,
              colorBlendMode: BlendMode.srcIn,
              scale: 2,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconInbox.image(
              color: _currentIndex(context) == 3 ? theme.colorScheme.primary : Colors.grey,
              colorBlendMode: BlendMode.srcIn,
              scale: 2,
            ),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconAccount.image(
              color: _currentIndex(context) == 4 ? theme.colorScheme.primary : Colors.grey,
              colorBlendMode: BlendMode.srcIn,
              scale: 2,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
