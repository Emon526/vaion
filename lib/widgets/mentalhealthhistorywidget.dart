import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class MentalHealthHistoryWidget extends StatelessWidget {
  const MentalHealthHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.mentalhealthhistoryFormKey,
        child: InfoCardWidget(
          cardname: 'Mental Health History :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Have you been diagnosed with any mental health conditions in the past?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.mentalhealthhistoryQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
