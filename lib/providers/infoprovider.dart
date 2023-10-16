import 'package:flutter/material.dart';

class InfoProvider extends ChangeNotifier {
  final _patientFormKey = GlobalKey<FormState>();
  get patientFormKey => _patientFormKey;
  final _currentsymptomsFormKey = GlobalKey<FormState>();
  get currentsymptomsFormKey => _currentsymptomsFormKey;
  final _senddoctoremailFormKey = GlobalKey<FormState>();
  get senddoctoremailFormKey => _senddoctoremailFormKey;
}
