import 'package:pay_flow_flutter/app/shared/models/ticket_model.dart';

abstract class TicketRepository {
  Future<void> addNewTicket({required String userId, required TicketModel ticket});
  Future<List<TicketModel>> getAllTickets({required String userId});
}
