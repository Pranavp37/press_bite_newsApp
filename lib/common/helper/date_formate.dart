import 'package:intl/intl.dart';

String formatDate(DateTime? dateString) {
  // DateTime date = DateTime.parse(dateString);
  return DateFormat('MMM dd, yyyy').format(dateString!);
}
