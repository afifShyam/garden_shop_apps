import 'package:garden_shop/routes/main_shell.dart';
import 'package:garden_shop/views/index.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(path: '/home', name: 'home', builder: (context, state) => const HomeView()),
        GoRoute(path: '/mall', name: 'mall', builder: (context, state) => const MallView()),
        GoRoute(
          path: '/discover',
          name: 'discover',
          builder: (context, state) => const DiscoverView(),
        ),
        GoRoute(path: '/inbox', name: 'inbox', builder: (context, state) => const InboxView()),
        GoRoute(
          path: '/account',
          name: 'account',
          builder: (context, state) => const AccountView(),
        ),
      ],
    ),
  ],
);
