part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();
}

class NotificationStatusChanged extends NotificationsEvent{
  final AuthorizationStatus status;

  NotificationStatusChanged(this.status);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NotificationReceived extends NotificationsEvent{
  final PushMessage pushMessage;

  NotificationReceived(this.pushMessage);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}