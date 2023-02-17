import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/all_ticket_model.dart';
import '../../../data/repositories/my_ticket_repo.dart';

part 'my_ticket_event.dart';
part 'my_ticket_state.dart';

class MyTicketBloc extends Bloc<MyTicketEvent, MyTicketState> {
  MyTicketBloc() : super(MyTicketLoading()) {
    on<MyticketFetchEvent>((event, emit) async {
      MyTicketRepo myTicketRepo = MyTicketRepo();
      try {
        AllTickets products = await myTicketRepo.fetchData();
        Dist dist = products.data!.dist!;
        emit(MyTicketLoaded(dist));
      } catch (e) {
        emit(MyTicketError(e.toString()));
      }
    });
  }
}
