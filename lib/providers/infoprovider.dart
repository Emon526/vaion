import 'package:flutter/material.dart';

class InfoProvider extends ChangeNotifier {
  final _patientFormKey = GlobalKey<FormState>();
  get patientFormKey => _patientFormKey;
  final _currentsymptomsFormKey = GlobalKey<FormState>();
  get currentsymptomsFormKey => _currentsymptomsFormKey;
  final _senddoctoremailFormKey = GlobalKey<FormState>();
  get senddoctoremailFormKey => _senddoctoremailFormKey;
  final _medicalHistoryFormKey = GlobalKey<FormState>();
  get medicalHistoryFormKey => _medicalHistoryFormKey;
  final _allergiesFormKey = GlobalKey<FormState>();
  get allergiesFormKey => _allergiesFormKey;
  final _immunizationstatusFormKey = GlobalKey<FormState>();
  get immunizationstatusFormKey => _immunizationstatusFormKey;
  final _lifestylehabitsFormKey = GlobalKey<FormState>();
  get lifestylehabitsFormKey => _lifestylehabitsFormKey;
  final _familyMedicalHistroryFormKey = GlobalKey<FormState>();
  get familyMedicalHistroryFormKey => _familyMedicalHistroryFormKey;
  final _travelHistoryFormKey = GlobalKey<FormState>();
  get travelHistoryFormKey => _travelHistoryFormKey;
  final _socialEnvironmentalFactorsFormKey = GlobalKey<FormState>();
  get socialEnvironmentalFactorsFormKey => _socialEnvironmentalFactorsFormKey;

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

  String _medicalhistoryQ1 = '';
  get medicalhistoryQ1 => _medicalhistoryQ1;
  set medicalhistoryQ1(value) {
    _medicalhistoryQ1 = value;
    notifyListeners();
  }

  String _medicalhistoryQ2 = '';
  get medicalhistoryQ2 => _medicalhistoryQ2;
  set medicalhistoryQ2(value) {
    _medicalhistoryQ2 = value;
    notifyListeners();
  }

  String _medicalhistoryQ3 = '';
  get medicalhistoryQ3 => _medicalhistoryQ3;
  set medicalhistoryQ3(value) {
    _medicalhistoryQ3 = value;
    notifyListeners();
  }

  String _allergiesQ1 = '';
  get allergiesQ1 => _allergiesQ1;
  set allergiesQ1(value) {
    _allergiesQ1 = value;
    notifyListeners();
  }

  String _allergiesQ2 = '';
  get allergiesQ2 => _allergiesQ2;
  set allergiesQ2(value) {
    _allergiesQ2 = value;
    notifyListeners();
  }

  String _immunizationstatusQ1 = '';
  get immunizationstatusQ1 => _immunizationstatusQ1;
  set immunizationstatusQ1(value) {
    _immunizationstatusQ1 = value;
    notifyListeners();
  }

  String _immunizationstatusQ2 = '';
  get immunizationstatusQ2 => _immunizationstatusQ2;
  set immunizationstatusQ2(value) {
    _immunizationstatusQ2 = value;
    notifyListeners();
  }

  String _lifestylehabitsQ1 = '';
  get lifestylehabitsQ1 => _lifestylehabitsQ1;
  set lifestylehabitsQ1(value) {
    _lifestylehabitsQ1 = value;
    notifyListeners();
  }

  String _lifestylehabitsQ2 = '';
  get lifestylehabitsQ2 => _lifestylehabitsQ2;
  set lifestylehabitsQ2(value) {
    _lifestylehabitsQ2 = value;
    notifyListeners();
  }

  String _lifestylehabitsQ3 = '';
  get lifestylehabitsQ3 => _lifestylehabitsQ3;
  set lifestylehabitsQ3(value) {
    _lifestylehabitsQ3 = value;
    notifyListeners();
  }

  String _lifestylehabitsQ4 = '';
  get lifestylehabitsQ4 => _lifestylehabitsQ4;
  set lifestylehabitsQ4(value) {
    _lifestylehabitsQ4 = value;
    notifyListeners();
  }

  String _familyMedicalHistroryQ1 = '';
  get familyMedicalHistroryQ1 => _familyMedicalHistroryQ1;
  set familyMedicalHistroryQ1(value) {
    _familyMedicalHistroryQ1 = value;
    notifyListeners();
  }

  String _travelHistoryQ1 = '';
  get travelHistoryQ1 => _travelHistoryQ1;
  set travelHistoryQ1(value) {
    _travelHistoryQ1 = value;
    notifyListeners();
  }

  String _travelHistoryQ2 = '';
  get travelHistoryQ2 => _travelHistoryQ2;
  set travelHistoryQ2(value) {
    _travelHistoryQ2 = value;
    notifyListeners();
  }

  String _socialEnvironmentalFactorsQ1 = '';
  get socialEnvironmentalFactorsQ1 => _socialEnvironmentalFactorsQ1;
  set socialEnvironmentalFactorsQ1(value) {
    _socialEnvironmentalFactorsQ1 = value;
    notifyListeners();
  }

  final _isnsuranceInformationFormKey = GlobalKey<FormState>();
  get isnsuranceInformationFormKey => _isnsuranceInformationFormKey;

  String _insuranceInformationQ1 = '';
  get insuranceInformationQ1 => _insuranceInformationQ1;
  set insuranceInformationQ1(value) {
    _insuranceInformationQ1 = value;
    notifyListeners();
  }

  final _genderIdentityFormKey = GlobalKey<FormState>();
  get genderIdentityFormKey => _genderIdentityFormKey;

  String _genderIdentityQ1 = '';
  get genderIdentityQ1 => _genderIdentityQ1;
  set genderIdentityQ1(value) {
    _genderIdentityQ1 = value;
    notifyListeners();
  }

  final _previousmedicaltestFormKey = GlobalKey<FormState>();
  get previousmedicaltestFormKey => _previousmedicaltestFormKey;

  String _previousmedicaltestQ1 = '';
  get previousmedicaltestQ1 => _previousmedicaltestQ1;
  set previousmedicaltestQ1(value) {
    _previousmedicaltestQ1 = value;
    notifyListeners();
  }

  String _previousmedicaltestQ2 = '';
  get previousmedicaltestQ2 => _previousmedicaltestQ2;
  set previousmedicaltestQ2(value) {
    _previousmedicaltestQ2 = value;
    notifyListeners();
  }

  final _primaryconcernFormKey = GlobalKey<FormState>();
  get primaryconcernFormKey => _primaryconcernFormKey;

  String _primaryconcernQ1 = '';
  get primaryconcernQ1 => _primaryconcernQ1;
  set primaryconcernQ1(value) {
    _primaryconcernQ1 = value;
    notifyListeners();
  }

  String _primaryconcernQ2 = '';
  get primaryconcernQ2 => _primaryconcernQ2;
  set primaryconcernQ2(value) {
    _primaryconcernQ2 = value;
    notifyListeners();
  }

  final _medicationhistoryFormKey = GlobalKey<FormState>();
  get medicationhistoryFormKey => _medicationhistoryFormKey;

  String _medicationhistoryQ1 = '';
  get medicationhistoryQ1 => _medicationhistoryQ1;
  set medicationhistoryQ1(value) {
    _medicationhistoryQ1 = value;
    notifyListeners();
  }

  String _medicationhistoryQ2 = '';
  get medicationhistoryQ2 => _medicationhistoryQ2;
  set medicationhistoryQ2(value) {
    _medicationhistoryQ2 = value;
    notifyListeners();
  }
}
