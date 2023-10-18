import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class SleepPatternsWidget extends StatelessWidget {
  const SleepPatternsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.sleeppatternsFormKey,
        child: InfoCardWidget(
          cardname: 'Sleep Patterns :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'How is your sleep quality and duration? Are you experiencing any sleep disturbances?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.sleeppatternsQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
