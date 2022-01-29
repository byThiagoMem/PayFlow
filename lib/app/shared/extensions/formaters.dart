import 'package:intl/intl.dart';

class Formaters {}

extension MoneyDouble on double {
  String reais() {
    final format = NumberFormat.simpleCurrency(locale: "pt_BR");
    return format.format(this);
  }
}
