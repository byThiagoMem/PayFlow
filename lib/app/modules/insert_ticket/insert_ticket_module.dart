import 'package:flutter_modular/flutter_modular.dart';

import 'insert_ticket_page.dart';
import 'insert_ticket_store.dart';

class InsertTicketModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InsertTicketStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InsertTicketPage(barcode: args.data)),
  ];
}
