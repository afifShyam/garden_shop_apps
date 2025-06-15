import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garden_shop/providers/mall_provider.dart';
import 'package:garden_shop/routes/index.dart';

import 'package:garden_shop/viewmodels/index.dart';

import 'package:garden_shop/views/index.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  observers: [RouteStackObserver()],
  routes: [
    ShellRoute(
      builder: (context, state, child) => wrapWithBackHandler(context, MainShell(child: child)),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder:
              (context, state) => buildPageWithTransition(state: state, child: const HomeView()),
          routes: [],
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
          routes: [],
        ),
        GoRoute(
          path: '/discover',
          name: 'discover',
          pageBuilder:
              (context, state) => buildPageWithTransition(
                state: state,
                child: ChangeNotifierProvider(
                  create: (context) => DiscoverViewModel(discoverRepository),
                  child: const DiscoverView(),
                ),
              ),
          routes: [],
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

enum TransitionType { fade, slide, scale, cupertino }
