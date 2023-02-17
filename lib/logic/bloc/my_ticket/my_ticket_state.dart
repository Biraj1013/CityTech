part of 'my_ticket_bloc.dart';

@immutable
abstract class MyTicketState {}

class MyTicketLoading extends MyTicketState {}

class MyTicketLoaded extends MyTicketState {
  Dist dist;

  MyTicketLoaded(this.dist);
}

class MyTicketError extends MyTicketState {
  String error;
  MyTicketError(this.error);
}
