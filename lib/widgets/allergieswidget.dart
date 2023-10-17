import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class AllergiesWidget extends StatelessWidget {
  const AllergiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question1 = TextEditingController();
    final question2 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.allergiesFormKey,
        child: InfoCardWidget(
          cardname: 'Allergies :',
          child: Column(
            children: [
              InputWidget(
                textEditingController: question1,
                labelText:
                    'Are you allergic to any medications, foods, or environmental factors?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q1) {
                  value.allergiesQ1 = q1;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                textEditingController: question2,
                labelText:
                    'Have you experienced any adverse reactions to medications in the past?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q2) {
                  value.allergiesQ2 = q2;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
