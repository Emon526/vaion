import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class FamilyMedicalHistoryWidget extends StatelessWidget {
  const FamilyMedicalHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.familyMedicalHistroryFormKey,
        child: InfoCardWidget(
          cardname: 'Family Medical History :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Does your immediate family have a history of specific medical conditions (e.g., heart disease, cancer)?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.familyMedicalHistroryQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
