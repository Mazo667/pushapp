import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';
import 'package:pushapp/firebase_options.dart';


import 'package:pushapp/domain/entities/push_message.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';


Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}


class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(const NotificationsState()) {

    on<NotificationStatusChanged>((event, emit) {
      emit(state.copyWith(
        status: event.status)
      );
    });
    
    on<NotificationReceived>((event, emit) {
      emit(state.copyWith(
        notifications: [event.pushMessage,...state.notifications]
      ));
    });

    //Verficar estado de las notificaciones
    _initialStatusCheck();
    //Listener para notificaciones en Foreground
    _onForegroundMessage();

  }

  static Future<void> initializeFirebaseCM() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
    getFCMToken();
  }

  void getFCMToken() async {
    if(state.status != AuthorizationStatus.authorized) return;
    final token = await messaging.getToken();
    print(token);
  }

  void handleRemoteMessage(RemoteMessage message){
    if (message.notification == null) return;
    final notification = PushMessage(
        messageId: message.messageId?.replaceAll(':','').replaceAll('%','') ?? '',
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        sentData: message.sentTime ?? DateTime.now(),
        data: message.data,
        imageUrl: Platform.isAndroid ? message.notification!.android?.imageUrl : message.notification!.apple?.imageUrl
    );
    add(NotificationReceived(notification));
  }

  void _onForegroundMessage(){
    FirebaseMessaging.onMessage.listen((handleRemoteMessage));
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  PushMessage? getMessageById(String pushMessageId){
    final exist = state.notifications.any((element) => element.messageId == pushMessageId);
    if(!exist) return null;
    return state.notifications.firstWhere((element) => element.messageId == pushMessageId);
  }

}
