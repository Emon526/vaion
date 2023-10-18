import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class PreviousMedicalTestWidget extends StatelessWidget {
  const PreviousMedicalTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question1 = TextEditingController();
    final question2 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.previousmedicaltestFormKey,
        child: InfoCardWidget(
          cardname: 'Previous Medical Tests :',
          child: Column(
            children: [
              InputWidget(
                textEditingController: question1,
                labelText:
                    'Have you had any recent medical tests or imaging studies (e.g., X-rays, blood tests)?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q1) {
                  value.previousmedicaltestQ1 = q1;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                textEditingController: question2,
                labelText:
                    'If so, please provide details and results if available.',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q2) {
                  value.previousmedicaltestQ2 = q2;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
