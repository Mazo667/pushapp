import 'package:go_router/go_router.dart';
import 'package:pushapp/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
    routes: [

      GoRoute(path: '/',
      builder: (context, state) => HomeScreen()),


    ]
);