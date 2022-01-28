import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/shared/models/ticket_model.dart';
import 'package:pay_flow_flutter/app/shared/repositories/ticket/ticket_repository.dart';

import './ticket_service.dart';

class TicketServiceImpl implements TicketService {
  final _ticketRepository = Modular.get<TicketRepository>();

  @override
  Future<void> addNewTicket({required String userId, required TicketModel ticket}) => _ticketRepository.addNewTicket(userId: userId, ticket: ticket);

  @override
  Future<List<TicketModel>> getAllTickets({required String userId}) => _ticketRepository.getAllTickets(userId: userId);
}
