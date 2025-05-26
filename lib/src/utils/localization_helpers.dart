import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocalizationHelpers {
  static String formatDate(DateTime date, {String pattern = 'yMMMd', String? locale}) {
    return DateFormat(pattern, locale).format(date);
  }

  static String formatNumber(num number, {String? locale}) {
    return NumberFormat.decimalPattern(locale).format(number);
  }

  static String formatCurrency(num number, {String? locale, String? symbol}) {
    return NumberFormat.currency(locale: locale, symbol: symbol).format(number);
  }

  static Locale localeFromString(String localeString) {
    final parts = localeString.split('_');
    if (parts.length == 2) {
      return Locale(parts[0], parts[1]);
    }
    return Locale(localeString);
  }
} 