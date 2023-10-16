import 'package:flutter/material.dart';

class InfoProvider extends ChangeNotifier {
  final _patientFormKey = GlobalKey<FormState>();
  get patientFormKey => _patientFormKey;
  final _currentsymptomsFormKey = GlobalKey<FormState>();
  get currentsymptomsFormKey => _currentsymptomsFormKey;
  final _senddoctoremailFormKey = GlobalKey<FormState>();
  get senddoctoremailFormKey => _senddoctoremailFormKey;

  String _patientName = '';
  get patientName => _patientName;
  set patientName(value) {
    _patientName = value;
    notifyListeners();
  }

  String _patientdob = '';
  get patientdob => _patientdob;
  set patientdob(value) {
    _patientdob = value;
    notifyListeners();
  }

  String _patientaddress = '';
  get patientaddress => _patientaddress;
  set patientaddress(value) {
    _patientaddress = value;
    notifyListeners();
  }

  String _patientphone = '';
  get patientphone => _patientphone;
  set patientphone(value) {
    _patientphone = value;
    notifyListeners();
  }

  String _patientemail = '';
  get patientemail => _patientemail;
  set patientemail(value) {
    _patientemail = value;
    notifyListeners();
  }

  String _currentSymptomsQ1 = '';
  get currentSymptomsQ1 => _currentSymptomsQ1;
  set currentSymptomsQ1(value) {
    _currentSymptomsQ1 = value;
    notifyListeners();
  }

  String _currentSymptomsQ2 = '';
  get currentSymptomsQ2 => _currentSymptomsQ2;
  set currentSymptomsQ2(value) {
    _currentSymptomsQ2 = value;
    notifyListeners();
  }

  String _currentSymptomsQ3 = '';
  get currentSymptomsQ3 => _currentSymptomsQ3;
  set currentSymptomsQ3(value) {
    _currentSymptomsQ3 = value;
    notifyListeners();
  }
}
