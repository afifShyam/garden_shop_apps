import 'package:flutter/material.dart';
import 'package:garden_shop/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatefulWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<String> _tabs = ['/home', '/mall', '/discover', '/inbox', '/account'];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Keep tab index in sync with route
    final location = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
    final index = _tabs.indexWhere((tab) => location.startsWith(tab));
    if (index != -1 && index != _currentIndex) {
      _currentIndex = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.6),
        onTap: (index) {
          if (_currentIndex != index) {
            setState(() => _currentIndex = index);
            context.go(_tabs[index]);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Assets.images.navIconHome.image(
              scale: 2,
              color:
                  _currentIndex == 0
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconMall.image(
              scale: 2,
              color:
                  _currentIndex == 1
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            label: 'Mall',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconDiscover.image(
              scale: 2,
              color:
                  _currentIndex == 2
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconInbox.image(
              scale: 2,
              color:
                  _currentIndex == 3
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconAccount.image(
              scale: 2,
              color:
                  _currentIndex == 4
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
