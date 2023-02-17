import 'package:app/data/repositories/api/api_constants.dart';
import 'package:app/data/repositories/api/api_service.dart';

import '../model/all_ticket_model.dart';

class AllTicketRepo {
  ApiService apiService = ApiService();

  Future<AllTickets> fetchData() async {
    try {
      String totalTicketUrl = AppConstant.totalTicketUrl;
      var result = await apiService.get(totalTicketUrl);
      AllTickets allTickets = AllTickets.fromJson(result);
      // result.map((i) => AllTickets.fromJson(i)).toList();
      return allTickets;
    } catch (e) {
      throw e.toString();
    }
  }
}
