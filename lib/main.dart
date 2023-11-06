import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pushapp/config/router/app_router.dart';
import 'package:pushapp/config/theme/app_theme.dart';
import 'package:pushapp/presentation/blocs/notifications/notifications_bloc.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFirebaseCM();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => NotificationsBloc())
    ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
      builder: (context, child) => HandleNotificationInteraction(child: child!),
    );
  }
}

class HandleNotificationInteraction extends StatefulWidget {
  final Widget child;

  const HandleNotificationInteraction({super.key, required this.child});

  @override
  State<HandleNotificationInteraction> createState() => _HandleNotificationInteractionState();
}

class _HandleNotificationInteractionState extends State<HandleNotificationInteraction> {
  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {

    context.read<NotificationsBloc>().handleRemoteMessage(message);
    final messageId = message.messageId?.replaceAll(':','').replaceAll('%','');
    appRouter.push('/push-details/$messageId');

    /*
    if (message.data['type'] == 'chat') {
      Navigator.pushNamed(context, '/chat',
        arguments: ChatArguments(message),
      );
     */
    }


  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

