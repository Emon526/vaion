import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class PainScaleWidget extends StatelessWidget {
  const PainScaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.painscaleFormKey,
        child: InfoCardWidget(
          cardname: 'Pain Scale :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'On a scale from 0 to 10, with 0 being no pain and 10 being the worst pain imaginable, how would you rate the severity of any pain you\'re experiencing?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.painscaleQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
