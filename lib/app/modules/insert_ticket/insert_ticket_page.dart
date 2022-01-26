import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'insert_ticket_store.dart';

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
    print(widget.barcode.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
