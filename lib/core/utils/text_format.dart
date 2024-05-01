import 'package:intl/intl.dart';

String formatAmount(String enteredAmount) {
  final formatter = NumberFormat("#,###");
  if (enteredAmount.isNotEmpty) {
    // Check if enteredAmount is a valid integer
    try {
      final amount = int.parse(enteredAmount);
      // Format and return the valid integer
      return formatter.format(amount);
    } catch (e) {
      // Handle the case where enteredAmount is not a valid integer
      return 'Invalid Amount';
    }
  }

  return '';
}
