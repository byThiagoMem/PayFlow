import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';

part 'insert_ticket_store.g.dart';

class InsertTicketStore = _InsertTicketStoreBase with _$InsertTicketStore;

abstract class _InsertTicketStoreBase with Store {
  final nameTicketController = TextEditingController();
  final dueDateTicketController = MaskedTextController(mask: '##/##/##', translator: {"#": RegExp(r'[0-9]')});
  final valueTicketController = MoneyMaskedTextController(leftSymbol: 'R\$');
  final barcodeController = TextEditingController();

  @observable
  String formError = '';

  void registerTicket() {
    if (validateForms()) {}
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
