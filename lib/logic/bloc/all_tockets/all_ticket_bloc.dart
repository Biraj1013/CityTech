import 'package:bloc/bloc.dart';

import '../../../data/model/all_ticket_model.dart';
import '../../../data/repositories/all_ticket_repo.dart';

part 'all_ticket_event.dart';
part 'all_ticket_state.dart';

class AllTicketBloc extends Bloc<AllTicketEvent, AllTicketState> {
  AllTicketBloc() : super(AllTicketLoadingState()) {
    on<AllTicketFetchEvent>((event, emit) async {
      AllTicketRepo allTicketRepo = AllTicketRepo();
      try {
        AllTickets products = await allTicketRepo.fetchData();
        Dist dist = products.data!.dist!;
        emit(AllTicketLoadedState(dist));
      } catch (e) {
        emit(AllTicketErrorState(e.toString()));
      }
    });
  }
}
