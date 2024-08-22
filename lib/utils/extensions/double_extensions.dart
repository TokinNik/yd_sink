import 'package:intl/intl.dart';

extension DoubleExt on double {
  String get formatPrice {
    var formatter = NumberFormat.decimalPattern('ru_RU');
    return formatter.format(this);
  }

  String get withoutZeroFraction {
    RegExp regex = RegExp(r'([.]*0+)(?!.*\d)');
    return toString().replaceAll(regex, '');
  }

  String get doubleWithoutDecimalToInt {
    return toStringAsFixed(truncateToDouble() == this ? 0 : 1);
  }
}
