import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class MedicalHistoryWidget extends StatelessWidget {
  const MedicalHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question1 = TextEditingController();
    final question2 = TextEditingController();
    final question3 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.medicalHistoryFormKey,
        child: InfoCardWidget(
          cardname: 'Medical History :',
          child: Column(
            children: [
              InputWidget(
                textEditingController: question1,
                labelText:
                    'Do you have any chronic medical conditions? (e.g., diabetes, hypertension)',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q1) {
                  value.medicalhistoryQ1 = q1;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                textEditingController: question2,
                labelText:
                    'Have you had any surgeries or hospitalizations in the past?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q2) {
                  value.medicalhistoryQ2 = q2;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textEditingController: question3,
                labelText:
                    'Are you currently taking any medications or supplements? If so, please list them.',
                textInputType: TextInputType.text,
                onChanged: (q3) {
                  value.medicalhistoryQ3 = q3;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
