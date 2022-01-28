import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/shared/models/ticket_model.dart';
import 'package:pay_flow_flutter/app/shared/repositories/auth/user_controller.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';
import 'package:pay_flow_flutter/app/shared/services/ticket/ticket_service.dart';
import 'package:pay_flow_flutter/app/shared/utils/app_state.dart';

part 'insert_ticket_store.g.dart';

class InsertTicketStore = _InsertTicketStoreBase with _$InsertTicketStore;

abstract class _InsertTicketStoreBase with Store {
  final _ticketService = Modular.get<TicketService>();
  final _userController = Modular.get<UserController>();

  final nameTicketController = TextEditingController();
  final dueDateTicketController = MaskedTextController(mask: '##/##/##', translator: {"#": RegExp(r'[0-9]')});
  final valueTicketController = MoneyMaskedTextController(leftSymbol: 'R\$');
  final barcodeController = TextEditingController();

  @observable
  AppState ticketState = AppState.IDLE;

  @observable
  String formError = '';

  void registerTicket() async {
    if (validateForms()) {
      await addNewTicket();
    }
  }

  Future<void> addNewTicket() async {
    ticketState = AppState.LOADING;
    var user = _userController.user;
    var ticket = TicketModel(
      name: nameTicketController.text,
      dueDate: dueDateTicketController.text,
      value: valueTicketController.numberValue,
      barcode: barcodeController.text,
      paid: false,
    );
    try {
      if (user != null) {
        await _ticketService.addNewTicket(userId: user.uid, ticket: ticket);
        ticketState = AppState.SUCCESS;
        Modular.to.popUntil(ModalRoute.withName(AppRoutes.home));
      } else {
        ticketState = AppState.ERROR;
      }
    } catch (_) {
      ticketState = AppState.ERROR;
    }
  }

  @action
  bool validateForms() {
    if (validateNameTicket() && validateDueDateTicket() && validateValueTicket() && validateBarcodeTicket()) {
      formError = '';
      return true;
    }
    return false;
  }

  @action
  bool validateNameTicket() {
    if (nameTicketController.text.isEmpty) {
      formError = 'Dê um nome ao boleto';
      return false;
    }
    return true;
  }

  @action
  bool validateDueDateTicket() {
    if (dueDateTicketController.text.isEmpty) {
      formError = 'Preencha a data de vencimento.';
      return false;
    } else if (dueDateTicketController.text.length < 8) {
      formError = 'Preencha uma data válida. Ex: 01/01/01';
      return false;
    }
    return true;
  }

  @action
  bool validateValueTicket() {
    if (valueTicketController.numberValue <= 0.0) {
      formError = 'Preencha o valor do boleto';
      return false;
    }
    return true;
  }

  @action
  bool validateBarcodeTicket() {
    if (barcodeController.text.isEmpty) {
      formError = 'Insira o código de barras';
      return false;
    }
    return true;
  }

  void goToHomePage() => Modular.to.pushReplacementNamed(AppRoutes.home);
}
