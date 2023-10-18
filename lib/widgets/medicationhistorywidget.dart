import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class MedicationHistoryWidget extends StatelessWidget {
  const MedicationHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question1 = TextEditingController();
    final question2 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.medicationhistoryFormKey,
        child: InfoCardWidget(
          cardname: 'Medication History :',
          child: Column(
            children: [
              InputWidget(
                textEditingController: question1,
                labelText:
                    'Are you currently taking over-the-counter medications, herbal supplements, or vitamins?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q1) {
                  value.medicationhistoryQ1 = q1;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                textEditingController: question2,
                labelText:
                    'Have you recently started or stopped any medications?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q2) {
                  value.medicationhistoryQ2 = q2;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
