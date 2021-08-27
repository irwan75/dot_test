import 'package:flutter_test/flutter_test.dart';
import 'package:services/utils/formatter_custom.dart';

void main() {
  group("Convert DateTime to String", () {
    test("result true 27-08-2021", () {
      expect("27-08-2021",
          FormatterCustom.getInstance.justFormatDate(dateTime: DateTime.now()));
    });
    test("result true 28-08-2021", () {
      expect(
          "28-08-2021",
          FormatterCustom.getInstance
              .justFormatDate(dateTime: DateTime.now().add(Duration(days: 1))));
    });
  });

  group("Convert String to DateTime", () {
    test("result true year 2021", () {
      expect(
          DateTime.now().year,
          FormatterCustom.getInstance
              .convertStringtoDate(date: "27-08-2021")
              .year);
    });
    test("result true month 08", () {
      expect(
          DateTime.now().month,
          FormatterCustom.getInstance
              .convertStringtoDate(date: "27-08-2021")
              .month);
    });
  });
}
