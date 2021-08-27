import 'package:intl/intl.dart';

class FormatterCustom {
  FormatterCustom._privateConstructor();

  static final FormatterCustom _instance =
      FormatterCustom._privateConstructor();

  static FormatterCustom get getInstance => _instance;

  String justFormatDate({required DateTime dateTime}) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  DateTime convertStringtoDate({required String date}) {
    return DateFormat('dd-MM-yyyy').parse(date);
  }
}
