import 'package:app/data/repositories/api/api_constants.dart';
import 'package:app/data/repositories/api/api_service.dart';

import '../model/all_ticket_model.dart';

class MyTicketRepo {
  ApiService apiService = ApiService();

  Future<AllTickets> fetchData() async {
    try {
      String totalTicketUrl = AppConstant.myTicketUrl;
      var result = await apiService.get(totalTicketUrl);
      AllTickets allTickets = AllTickets.fromJson(result);
      return allTickets;
    } catch (e) {
      throw e.toString();
    }
  }
}
