part of 'all_ticket_bloc.dart';

abstract class AllTicketState {}

class AllTicketLoadingState extends AllTicketState {}

class AllTicketLoadedState extends AllTicketState {
  Dist dist;

  AllTicketLoadedState(this.dist);
}

class AllTicketErrorState extends AllTicketState {
  String error;
  AllTicketErrorState(this.error);
}
