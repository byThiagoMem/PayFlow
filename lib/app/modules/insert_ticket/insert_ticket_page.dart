import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/modules/barcode_scanner/widgets/set_label_buttons.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

import 'insert_ticket_store.dart';
import 'widgets/custom_form_field.dart';

class InsertTicketPage extends StatefulWidget {
  final String title;
  final String? barcode;
  const InsertTicketPage({Key? key, this.title = 'InsertTicketPage', this.barcode}) : super(key: key);
  @override
  InsertTicketPageState createState() => InsertTicketPageState();
}

class InsertTicketPageState extends State<InsertTicketPage> {
  final InsertTicketStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    if (widget.barcode != null) {
      store.barcodeController.text = widget.barcode!;
    }
  }

  @override
  Widget build(BuildContext context) {
    AppTheme.systemChromePreferences;
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.colors.white, elevation: 0),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * .07,
                      vertical: constraints.maxHeight * .02,
                    ),
                    child: Observer(
                      builder: (_) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Text('Preencha os dados\ndo boleto', style: AppTheme.textStyles.heading20B, textAlign: TextAlign.center)),
                            SizedBox(height: constraints.maxHeight * .1),
                            CustomFormField(
                              hint: 'Nome do boleto',
                              icon: Icons.list_alt_rounded,
                              controller: store.nameTicketController,
                            ),
                            SizedBox(height: constraints.maxHeight * .025),
                            CustomFormField(
                              hint: 'Vencimento',
                              icon: Icons.cancel_outlined,
                              controller: store.dueDateTicketController,
                            ),
                            const SizedBox(height: 10),
                            CustomFormField(
                              hint: 'Valor',
                              icon: Icons.account_balance_wallet_outlined,
                              controller: store.valueTicketController,
                            ),
                            const SizedBox(height: 10),
                            CustomFormField(
                              hint: 'Código',
                              icon: Icons.qr_code_rounded,
                              controller: store.barcodeController,
                            ),
                            const SizedBox(height: 10),
                            store.formError.isNotEmpty
                                ? Text(
                                    store.formError,
                                    style: AppTheme.textStyles.heading13.copyWith(
                                      color: AppTheme.colors.actionsDelete,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              SetLabelButtons(
                primaryLabel: 'Cancelar',
                primaryOnPressed: store.goToHomePage,
                secundaryLabel: 'Cadastrar',
                secundaryOnPressed: store.registerTicket,
                enableSecundaryColor: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
