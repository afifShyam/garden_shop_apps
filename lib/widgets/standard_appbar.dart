import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:garden_shop/routes/index.dart';
import 'package:go_router/go_router.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBack;
  final List<Widget>? actions;
  final double height;
  final IconData backIcon;

  const StandardAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.showBack = false,
    this.actions,
    this.height = kToolbarHeight,
    this.backIcon = Icons.arrow_back_ios,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
      elevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading:
          RouteStack.canPop
              ? IconButton(
                onPressed: () {
                  RouteStack.pop();
                  final previous = RouteStack.previous ?? '/home';
                  log(previous, name: 'previous');
                  context.go(previous);
                },
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                  child: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
                ),
              )
              : null,
      title: Text(
        title,
        style: TextStyle(
          color: theme.colorScheme.onPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
