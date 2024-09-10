import 'package:intl/intl.dart';

String formatCurrency(int amount) {
  final format = NumberFormat.currency(
    locale: 'uz_UZ',
    symbol: '',
    decimalDigits: 0,
  );
  return format.format(amount);
}
