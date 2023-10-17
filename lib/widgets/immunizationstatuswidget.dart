import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class ImmunizationStatusWidget extends StatelessWidget {
  const ImmunizationStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question1 = TextEditingController();
    final question2 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.immunizationstatusFormKey,
        child: InfoCardWidget(
          cardname: 'Immunization Status :',
          child: Column(
            children: [
              InputWidget(
                textEditingController: question1,
                labelText: 'Are you up-to-date on your vaccinations?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q1) {
                  value.immunizationstatusQ1 = q1;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                textEditingController: question2,
                labelText: 'Have you received any specific vaccines recently?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q2) {
                  value.immunizationstatusQ2 = q2;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
