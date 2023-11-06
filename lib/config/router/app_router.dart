import 'package:go_router/go_router.dart';
import 'package:pushapp/presentation/screens/detail_screen.dart';
import 'package:pushapp/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
    routes: [

      GoRoute(path: '/',
      builder: (context, state) => HomeScreen()),

      GoRoute(path: '/push-details/:messageId',
      builder: (context, state) => DetailsScreen(pushMessageId: state.pathParameters['messageId'] ?? '')),


    ]
);