import 'package:go_router/go_router.dart';
import 'package:what_to_watch_app/presentation/screens/screens.dart';

final appRoute = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeView.name,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
