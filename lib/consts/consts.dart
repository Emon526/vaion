import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Consts {
  static const appName = 'vaion';
  static const defaultBorderRadius = 5.0;

  static const Color primaryColor = Color(0xff38ACDB);
  static DateFormat dateFormat = DateFormat('dd/MM/yyyy', 'en');
  //Email Service Config
  // static const serviceid = 'service_ck3ivyo';
  // static const templateid = 'template_wwohwy4';
  // static const userid = 'zz3cLE9E63a-cWy6G';
  static const api = 'https://api.sendinblue.com/v3/smtp/email';
  static const apiKey =
      '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';
}
