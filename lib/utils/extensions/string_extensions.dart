import 'package:intl/intl.dart';

String concatWithSymbol(List<String?> args, {String symbol = ','}) {
  return args.whereType<String>().join(symbol);
}

extension StringExt on String {
  String get capitalize {
    if (isEmpty) {
      return this;
    }
    var string = toLowerCase();
    return string[0].toUpperCase() + string.substring(1);
  }

  String removeYearSuffix() {
    return replaceAll(' г.', '');
  }

  DateTime parseToDDMMYYYY() {
    return DateFormat('yyyy-MM-dd').parse(this);
  }

  bool get isNumeric {
    return int.tryParse(this) != null;
  }
}

extension StringExtensions on String? {
  String get orEmpty => this ?? '';
}
