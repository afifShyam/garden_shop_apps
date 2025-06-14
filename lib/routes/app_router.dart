import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garden_shop/providers/mall_provider.dart';
import 'package:garden_shop/routes/main_shell.dart';
import 'package:garden_shop/viewmodels/mall_vm.dart';
import 'package:garden_shop/views/index.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// ✅ Main GoRouter instance
final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    /// ✅ ShellRoute (with bottom navigation bar)
    ShellRoute(
      builder: (context, state, child) => wrapWithBackHandler(context, MainShell(child: child)),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder:
              (context, state) => buildPageWithTransition(state: state, child: const HomeView()),
        ),
        GoRoute(
          path: '/mall',
          name: 'mall',
          pageBuilder:
              (context, state) => buildPageWithTransition(
                state: state,
                child: ChangeNotifierProvider<MallViewModel>(
                  create: (_) => MallViewModel(mallRepository),
                  child: const MallView(),
                ),
              ),
        ),
        GoRoute(
          path: '/discover',
          name: 'discover',
          pageBuilder:
              (context, state) =>
                  buildPageWithTransition(state: state, child: const DiscoverView()),
        ),
        GoRoute(
          path: '/inbox',
          name: 'inbox',
          pageBuilder:
              (context, state) => buildPageWithTransition(state: state, child: const InboxView()),
        ),
        GoRoute(
          path: '/account',
          name: 'account',
          pageBuilder:
              (context, state) => buildPageWithTransition(state: state, child: const AccountView()),
        ),
      ],
    ),

    /// ✅ Non-shell route (outside Bottom Nav)
    GoRoute(
      path: '/product/:id',
      name: 'product_detail',
      pageBuilder: (context, state) {
        final id = state.pathParameters['id']!;
        final params = state.extra as Map<String, String>? ?? {};
        return buildPageWithTransition(
          state: state,
          child: ProductDetailView(
            productId: id,
            imageUrl: params['imageUrl'] ?? '',
            title: params['title'] ?? '',
            subtitle: params['subtitle'] ?? '',
            price: params['price'] ?? '',
          ),
          transitionType: TransitionType.slide,
        );
      },
    ),
  ],
);

/// ✅ Back handler wrapper using PopScope
Widget wrapWithBackHandler(BuildContext context, Widget child) {
  return PopScope(
    canPop: !GoRouter.of(context).canPop(),
    onPopInvokedWithResult: (didPop, result) {
      final router = GoRouter.of(context);
      if (!didPop) {
        if (router.canPop()) {
          router.pop();
        } else {
          SystemNavigator.pop();
        }
      }
    },
    child: child,
  );
}

/// ✅ Helper Function to build custom transitions safely
Page<dynamic> buildPageWithTransition({
  required Widget child,
  required GoRouterState state,
  TransitionType transitionType = TransitionType.fade,
}) {
  return CustomTransitionPage(
    child: Builder(builder: (context) => wrapWithBackHandler(context, child)),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (transitionType) {
        case TransitionType.fade:
          return FadeTransition(opacity: animation, child: child);
        case TransitionType.slide:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        case TransitionType.scale:
          return ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
            child: child,
          );
        case TransitionType.cupertino:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
      }
    },
  );
}

/// ✅ Enum for transition types
enum TransitionType { fade, slide, scale, cupertino }
